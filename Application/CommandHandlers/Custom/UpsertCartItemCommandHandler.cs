using MediatR;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using Poseidon.Application;
using Poseidon.Application.Commands;
using Poseidon.Common;
using Poseidon.Domain;
using Poseidon.Enums;

namespace Application.CommandHandlers;

public class UpsertCartItemCommandHandler : IRequestHandler<CartItemCommand, Response>
{
    private readonly IPoseidonDbContext _context;
    private readonly ILogger<UpsertCartItemCommandHandler> _logger;
    public UpsertCartItemCommandHandler( IPoseidonDbContext context
                                       , ILogger<UpsertCartItemCommandHandler> logger
                                       )
    {
        _context = context;
        _logger = logger;
    }

    public async Task<Response> Handle(CartItemCommand request, CancellationToken cancellationToken)
    {
        CartItem? entity = null;
        Status status;
        if (request.CartItemId.HasValue)
        {
            entity = await _context.CartItem.FindAsync(request.CartItemId.Value);
        }

        if (entity is not null)
        {
            entity.CartItemId = request.CartItemId!.Value;
            status = Status.Updated;
        }
        else
        {
            entity = new CartItem();
            _context.CartItem.Add(entity);
            status = Status.Created;
        }

        var product = _context
            .Product
            .Include(p => p.TaxRate)
            .FirstOrDefault(p => p.ProductId.Equals(request.ProductId ?? entity.ProductId));

        if (product is null)
        {
            _logger.Error($"Product not found {request.ProductId} can't create new cart item");
            throw new Exception($"Product not found {request.ProductId}");
        }

        var taxPercent = product
                         .TaxRate
                        ?.Rate;


        decimal? discountPercent = _context.ProductDiscountOffer
                .Include(i => i.DiscountOffer)
                .OrderByDescending(i => i.Sys_CreatedAt)
                .FirstOrDefault(d => d.ProductId.Equals(product.ProductId)
                && d.DiscountOffer.EndDate < DateTimeOffset.UtcNow)
                ?.DiscountOffer
                ?.Discount;


        if (request.CartId != null) entity.CartId = request.CartId!.Value;
        if (request.ProductId != null) entity.ProductId = request.ProductId!.Value;

        entity.ImageUrl = request.ImageUrl is null ? product.ImageUrl : request.ImageUrl;
        entity.Title = request.Title is null ? product.Name : request.Title;
        entity.Unit = request.Unit is null ? product.Unit : request.Unit;
        entity.Price = product.Price;
        entity.Quantity = request.Quantity ?? 1;
        entity.TaxAmount = taxPercent is null ? 0m : (product.Price * taxPercent / 100) * entity.Quantity;
        entity.DiscountAmount = discountPercent is null ? 0m : (product.Price * discountPercent / 100) * entity.Quantity;

        await _context.SaveChangesAsync(cancellationToken);

        var cart = _context.Cart
                .Include(c => c.CartItem)
                .SingleOrDefault(c => c.CartId
                    .Equals(entity.CartId)
                 );

        decimal total = 0m;
        decimal taxAmount = 0m;
        decimal discountAmount = 0m;

        foreach (var item in cart!.CartItem)
        {
            total += (item.Quantity ?? 0) * (item.Price ?? 0);
            taxAmount += item.TaxAmount ?? 0;
            discountAmount += item.DiscountAmount ?? 0;
        }

        cart.Total = total;
        cart.DiscountAmount = discountAmount;
        cart.TaxAmount = taxAmount;

        await _context.SaveChangesAsync(cancellationToken);

        if (status is Status.Created)
        {
            _logger.Info(string.Format("Created  CartItem {0}", entity.CartItemId));
        }
        else
        {
            _logger.Info(string.Format("Updated  CartItem {0}", entity.CartItemId));
        }
        return new (entity.CartItemId, status);
    }
}
