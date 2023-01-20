using AutoMapper;
using MediatR;
using Microsoft.AspNetCore.Http;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using Poseidon.Application.Commands;
using Poseidon.Application.Dto;
using Poseidon.Common;
using Poseidon.Domain;

namespace Poseidon.Application.CommandHandlers;

public class CartDetailsCommandHandler : IRequestHandler<CartDetailsCommand, ResponseData<CartDetailsDto>>
{
    private readonly IPoseidonDbContext _context;
    private readonly IHttpContextAccessor _httpContextAccessor;
    private readonly ILogger<CartDetailsCommandHandler> _logger;
    private readonly IMapper _mapper;

    public CartDetailsCommandHandler(     IPoseidonDbContext context
                                        , IHttpContextAccessor httpContextAccessor
                                        , ILogger<CartDetailsCommandHandler> logger
                                        , IMapper mapper
                                        )
    {
        _context = context;
        _logger = logger;
        _mapper = mapper;
        _httpContextAccessor = httpContextAccessor;
    }

    public async Task<ResponseData<CartDetailsDto>> Handle(CartDetailsCommand request, CancellationToken cancellationToken)
    {

        string? extReference = _httpContextAccessor.HttpContext
                        ?.User
                        ?.FindFirst("UserIdentifier")
                        ?.Value;

        if (string.IsNullOrWhiteSpace(extReference))
        {
            _logger.Error($"System not able to find user idetifier");
            return new ResponseData<CartDetailsDto>(new CartDetailsDto[] { new() }, 1, 1, 1);
        }

        int? userId = _context.User
            ?.SingleOrDefault(u => u.ExternalRef.Equals(extReference))
            ?.UserId;

        if (userId is null)
        {
            _logger.Error($"User not found or does not exist for user identifier {extReference}");
            return new ResponseData<CartDetailsDto>(new CartDetailsDto[] { new() }, 1, 1, 1);
        }

        var cartDetails = await _context.Cart
          .Include(l => l.CartItem)
          .AsNoTracking()
          .FirstOrDefaultAsync(c => c.UserId.Equals(userId) && c.IsActive == true)
          ;
        if (cartDetails is null)
        {
            cartDetails = new Cart
            {
                IsActive = true,
                LockedOnCheckout = false,
                UserId = userId!.Value,
                Total = 0m,
                TaxAmount = 0m,
                DiscountAmount = 0m
            };

            _context.Cart.Add(cartDetails);

            await _context.SaveChangesAsync(cancellationToken);

            _logger.Info($"New active cart {cartDetails?.CartId} created for {userId}");
        }

        CartDetailsDto cartDto = _mapper.Map<Cart, CartDetailsDto>(cartDetails!);

        if (cartDetails?.CartItem is not null)
        {
            cartDto.CartItem = _mapper.Map<ICollection<CartItem>, List<CartItemDto>>(cartDetails?.CartItem!);
        }
        else
        {
            _logger.Info($"User {userId} does not any items inside cart {cartDetails?.CartId}");
        }
        return new ResponseData<CartDetailsDto>(new CartDetailsDto[] { cartDto! }, 1, 1, 1);
    }
}
