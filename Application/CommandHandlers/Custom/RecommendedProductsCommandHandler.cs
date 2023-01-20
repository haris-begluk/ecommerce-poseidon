using AutoMapper;
using AutoMapper.QueryableExtensions;
using Gridify.EntityFramework;
using MediatR;
using Microsoft.AspNetCore.Http;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using Microsoft.ML;
using Microsoft.ML.Data;
using Microsoft.ML.Trainers;
using Poseidon.Application.Commands;
using Poseidon.Application.Dto;
using Poseidon.Common;
using Poseidon.Domain;

namespace Poseidon.Application.CommandHandlers;

public class RecommendedProductsCommandHandler : IRequestHandler<RecommendedProductsQueryCommand, ResponseData<ProductDto>>
{
    private readonly IPoseidonDbContext   _context;
    private readonly IMapper              _mapper;
    private static   MLContext?           _mlContext = null;
    private static   ITransformer?        _model     = null;
    private readonly IHttpContextAccessor _httpContextAccessor;
    private readonly ILogger<RecommendedProductsCommandHandler> _logger;

    public RecommendedProductsCommandHandler(
                                            IPoseidonDbContext context
                                        , IHttpContextAccessor httpContextAccessor
                                        , ILogger<RecommendedProductsCommandHandler> logger
                                        , IMapper mapper
                                        )
    {
        _context = context;
        _logger = logger;
        _mapper = mapper;
        _httpContextAccessor = httpContextAccessor;

    }
    public async Task<ResponseData<ProductDto>> Handle(RecommendedProductsQueryCommand request, CancellationToken cancellationToken)
    {

        _logger.Info(string.Format("Getting discount offer products page number: {0} page size: {1} orderby: {2} filter: {3}", request.Page, request.PageSize, request.OrderBy, request.Filter));

        string? extReference = _httpContextAccessor.HttpContext
                        ?.User
                        ?.FindFirst("UserIdentifier")
                        ?.Value;

        if (string.IsNullOrWhiteSpace(extReference))
        {
            _logger.Error($"System not able to find user idetifier");
            return new ResponseData<ProductDto>(Array.Empty<ProductDto>(), 1, 1, 1);
        }

        long? userId = _context.User
            ?.SingleOrDefault(u => u.ExternalRef.Equals(extReference))
            ?.UserId;

        if (userId is null)
        {
            _logger.Error($"User not found or does not exist for user identifier {extReference}");
            return new ResponseData<ProductDto>(Array.Empty<ProductDto>(), 1, 1, 1);
        }

        long? lastReviwedUserProductId = _context.UserProductReview
             .OrderByDescending(o => o.Sys_CreatedAt)
             .FirstOrDefault(p => p.UserId == userId)
             ?.ProductId;

        if (lastReviwedUserProductId is null)
        {
            _logger.Warning($"User {userId} does not have any product reviews");
            return new ResponseData<ProductDto>(Array.Empty<ProductDto>(), 1, 1, 1);
        }

        if (_mlContext is null)
        {
            _logger.LogInformation("Creating new static instance of ML Context...");
            _mlContext = new();
        }

        var size = request.PageSize > 20
            ? 20
            : request.PageSize;

        var data = new List<ProductInput>();

        var userLikedPorductIds = _context.UserProductReview
                                .Where(p => p.UserId == userId && p.Rating > 3)
                                .Select(s => s.ProductId)
                                .ToArray();

        var allProducts = _context.UserProductReview
            .Select(s => s.ProductId)
            .Distinct()
            .ToArray();

        for (int i = 0; i < allProducts.Length; i++)
        {
            for (int j = 0; j < allProducts.Length; j++)
            {
                if (allProducts[i] != allProducts[j])
                {
                    data.Add(new()
                    {
                        ProductId = (uint)allProducts[i]!,
                        CoRelatedProductId = (uint)allProducts[j]!,
                    });
                }
            }
        }

        MatrixFactorizationTrainer.Options options = new()
        {

            MatrixColumnIndexColumnName = nameof(ProductInput.ProductId),
            MatrixRowIndexColumnName = nameof(ProductInput.CoRelatedProductId),
            LabelColumnName = "Label",

            LossFunction = MatrixFactorizationTrainer
                                        .LossFunctionType
                                        .SquareLossOneClass,

            Alpha = 0.01,
            Lambda = 0.025,
            NumberOfIterations = 100,
            C = 0.00001
        };

        var traindata = _mlContext!
                        .Data
                        .LoadFromEnumerable(data);


        var est = _mlContext
                .Recommendation()
                .Trainers
                .MatrixFactorization(options);

        _model = est.Fit(traindata);


        var products = _context.Product
            .Where(p => !userLikedPorductIds
            .Any(t => t == p.ProductId))
            .OrderBy(p => p.Sys_CreatedAt)
            .Take(200)
            .ToArray();

        var scoreList = new List<Tuple<Product, float>>();

        var mlEngine = _mlContext
                               .Model
                               .CreatePredictionEngine<ProductInput, CoRelatedPrediction>(_model);

        foreach (var i in products)
        {
            var prediction = mlEngine.Predict(new ProductInput()
            {
                ProductId = (uint)lastReviwedUserProductId,
                CoRelatedProductId = (uint)i.ProductId
            });

            if (!double.Equals(double.NaN, prediction.Score))
            {
                scoreList.Add(new(i, prediction.Score));
            }
        }

        var predictedListTop10 = scoreList.Where(d => !double.Equals(double.NaN, d.Item2))
                                          .OrderByDescending(x => x.Item2)
                                          .Select(x => x.Item1.ProductId)
                                          .Take(size);


        var (count, query) = await _context
          .Product
          .AsNoTracking()
          .Where(p => predictedListTop10.Any(t => t == p.ProductId))
          .ProjectTo<ProductDto>(_mapper.ConfigurationProvider)
          .GridifyQueryableAsync(request, null);

        return await query.ResponseDataAsync(
              count
            , request.Page
            , size
            );

    }
}

public class CoRelatedPrediction
{
    public float Score { get; set; }
}

public class ProductInput
{
    [KeyType(count: 10)]
    public uint ProductId { get; set; }

    [KeyType(count: 10)]
    public uint CoRelatedProductId { get; set; }

    public float Label { get; set; }
}