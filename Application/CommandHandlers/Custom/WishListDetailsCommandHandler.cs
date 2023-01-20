using AutoMapper;
using MediatR;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using Poseidon.Application.Commands;
using Poseidon.Application.Dto;
using Poseidon.Common;
using Poseidon.Domain;

namespace Poseidon.Application.CommandHandlers;

public partial class WishListDetailsCommandHandler : IRequestHandler<WishListDetailsQueryCommand<WishListDetailsDto>, ResponseData<WishListDetailsDto>>
{
    private readonly IPoseidonDbContext _context;
    private readonly IMapper _mapper;
    private readonly ILogger<WishListDetailsCommandHandler> _logger;

    public WishListDetailsCommandHandler(IPoseidonDbContext context
        , IMapper mapper
        , ILogger<WishListDetailsCommandHandler> logger
                                        )
    {
        _context = context;
        _logger = logger;
        _mapper = mapper;
    }

    public async Task<ResponseData<WishListDetailsDto>> Handle(WishListDetailsQueryCommand<WishListDetailsDto> request, CancellationToken cancellationToken)
    {

        var wishList = await _context.WishList
            .Include(l => l.WishListItem)
            .ThenInclude(w => w.Product)
            .AsNoTracking()
            .FirstOrDefaultAsync(w => w.UserId.Equals(request.UserId))
            ;

        if (wishList is null)
        {
            _logger.Error($"User {request.UserId} does not have wish list");

            return new ResponseData<WishListDetailsDto>(Array.Empty<WishListDetailsDto>(), 0, 1, 1);
        }

        WishListDetailsDto wishListDto = _mapper.Map<WishList, WishListDetailsDto>(wishList);

        if (wishList.WishListItem is not null)
        {
            wishListDto.WishListItem = _mapper.Map<ICollection<WishListItem>, List<WishListItemDetailsDto>>(wishList.WishListItem);
        }
        else
        {
            _logger.Error($"User {request.UserId} does not any items inside wish list {wishList.WishListId}");
        }

        return new ResponseData<WishListDetailsDto>(new WishListDetailsDto[] { wishListDto }, 1, 1, 1);
    }
}
