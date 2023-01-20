using AutoMapper;
using AutoMapper.QueryableExtensions;
using Gridify.EntityFramework;
using MediatR;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using Poseidon.Application.Commands;
using Poseidon.Application.Dto;
using Poseidon.Common;

namespace Poseidon.Application.CommandHandlers;

public class OfferDetailsCommandHandler : IRequestHandler<OfferDetailsQueryCommand, ResponseData<ProductDto>>
{
    private readonly IPoseidonDbContext _context;
    private readonly ILogger<OfferDetailsCommandHandler> _logger;
    private readonly IMapper _mapper;

    public OfferDetailsCommandHandler(    IPoseidonDbContext context
                                        , ILogger<OfferDetailsCommandHandler> logger
                                        , IMapper mapper
                                        )
    {
        _context = context;
        _logger = logger;
        _mapper = mapper;

    }
    public async Task<ResponseData<ProductDto>> Handle(OfferDetailsQueryCommand request, CancellationToken cancellationToken)
    {

        _logger.Info(string.Format("Getting discount offer products, page number => {0} page size => {1} orderby => {2} filter => {3} offerId => {4}", request.Page, request.PageSize, request.OrderBy, request.Filter, request.OfferId));


        var (count, query) = await _context
        .ProductDiscountOffer
        .Include(l => l.Product)
        .Where(d => d.DiscountOfferId == request.OfferId)
        .AsNoTracking()
        .Select(c => c.Product)
        .ProjectTo<ProductDto>(_mapper.ConfigurationProvider)
        .GridifyQueryableAsync(request, null);

        return await query.ResponseDataAsync(count, request.Page, request.PageSize);

    }
}