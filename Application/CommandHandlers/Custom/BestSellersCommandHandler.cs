using AutoMapper;
using AutoMapper.QueryableExtensions;
using Gridify.EntityFramework;
using MediatR;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using Poseidon.Application;
using Poseidon.Application.Commands;
using Poseidon.Application.Dto;
using Poseidon.Common;

namespace Application.CommandHandlers;

public class BestSellersCommandHandler : IRequestHandler<BestSellersQueryCommand, ResponseData<ProductDto>>
{
    private readonly IPoseidonDbContext _context;
    private readonly ILogger<BestSellersCommandHandler> _logger;
    private readonly IMapper _mapper;

    public BestSellersCommandHandler(IPoseidonDbContext context
                                        , ILogger<BestSellersCommandHandler> logger
                                        , IMapper mapper
                                        )
    {
        _context = context;
        _logger = logger;
        _mapper = mapper;

    }
    public async Task<ResponseData<ProductDto>> Handle(BestSellersQueryCommand request, CancellationToken cancellationToken)
    {

        _logger.Info(string.Format("Getting bestseller products page number: {0} page size: {1} orderby: {2} filter: {3}", request.Page, request.PageSize, request.OrderBy, request.Filter));

        var size = request.PageSize > 20
            ? 20
            : request.PageSize;

        var productIds = _context
          .OrderItem
          .GroupBy(i => i.ProductId)
          .Select(s => new
          {
              Product = s.Key
              ,
              QuantitySum = s.Sum(i => i.Quantity)
          })
          .OrderByDescending(o => o.QuantitySum)
          .Select(c => c.Product)
          .Take(size)
          .ToArray();

        var (count, query) = await _context
          .Product
          .AsNoTracking()
          .Where(p => productIds.Contains(p.ProductId))
          .ProjectTo<ProductDto>(_mapper.ConfigurationProvider)
          .GridifyQueryableAsync(request, null);

        return await query.ResponseDataAsync(
              count
            , request.Page
            , request.PageSize > 20
            ? 20
            : request.PageSize
            );

    }
}