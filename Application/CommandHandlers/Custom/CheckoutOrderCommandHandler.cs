using AutoMapper;
using MediatR;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using Poseidon.Application;
using Poseidon.Application.Commands;
using Poseidon.Application.Dto;
using Poseidon.Common;
using Poseidon.Domain;
using Poseidon.Enums;

namespace Poseidon.Application.CommandHandlers;

public partial class CheckoutOrderCommandHandler : IRequestHandler<OrderCheckoutCommand, (OrderDto dto, Status status)>
{
    private readonly IMapper             _mapper;
    private readonly IPoseidonDbContext  _context;
    private readonly ILogger<CheckoutOrderCommandHandler> _logger;
    public CheckoutOrderCommandHandler(
          IMapper            mapper
        , IPoseidonDbContext context
        , ILogger<CheckoutOrderCommandHandler> logger
                                        )
    {
        _context = context;
        _logger  = logger;
        _mapper  = mapper;
    }
    public async Task<(OrderDto dto, Status status)> Handle(OrderCheckoutCommand request, CancellationToken cancellationToken)
    {
        try
        {
            var cart = _context.Cart
                .Include(i =>i.Order)
                .AsNoTracking()
                .FirstOrDefault(c => c.CartId
                    .Equals(request.CartId
                    ));

            _logger.Info($"Cart entity {cart?.CartId ?? 0} fetched");

            if (cart is null)
            {
                _logger.Warning($"Cart entity {request.CartId} not found");
                return ( new () , Status.NotFound);
            }

            var cartItems = _context
                .CartItem
                .Include(c => c.Product)
                .ThenInclude(p => p.TaxRate)
                .AsNoTracking()
                .Where(c => c.CartId.Equals(cart.CartId))
                .ToArray();

            if (cartItems.Length == 0)
            {
                _logger.Warning($"Cart {request.CartId} does not contain any elements  0");

                return (new (), Status.BadRequest);
            }

            _logger.Debug($"{cartItems.Length} cart items fetched from database including related products, taxClasses, taxRates");

            var user = _context.User
                .FirstOrDefault(u => u.UserId.Equals(cart.UserId));
               
            Order? order = null;

            if(cart.Order is not null)
            {
                order = cart.Order;
            }
            else
            {

                var settings = _context
                    .Settings
                    .OrderByDescending(d => d.Sys_CreatedAt)
                    .FirstOrDefault();

                order = new ()
                {
                    Description            = $"Created on time {DateTimeOffset.UtcNow} by user {cart.UserId}",
                    OrderDiscountAmount    = settings?.OrderDiscountAmount ?? 0m,
                    OrderTaxAmount         = settings?.OrderTaxAmount      ?? 0m,
                    SubTotal               = 0m,
                    ProductTaxAmount       = 0m, 
                    ProductDiscountAmount  = 0m,
                    OrderStatus            = "Created",
                    ShippingMethod         = settings?.ShippingMethod,
                    ShippingFeeAmount      = settings?.ShippingFeeAmount ?? 0m,
                    OrderTotal             = 0m,
                    PaymentFeeAmount       = settings?.PaymentFeeAmount ?? 0m,
                    PayedAndClosed         = false,
                    PaymentMethod          = settings?.PaymentMethod,
                    UserId                 = cart.UserId, 
                    DeliveryId             = request.DeliveryId 
                    
                };

                order.ShippingAddressId = user?.AddressId; 
                order.BillingAddressId  = user?.AddressId; 


                _context.Order.Add(order);
            }



            await _context.SaveChangesAsync(cancellationToken);


            _logger.Info($"Order {order.OrderId} created for cart {cart.CartId}");

            var orderItems = new List<OrderItem>();

            decimal subTotal             = 0m;
            decimal productDiscountTotal = 0m;
            decimal productTaxTotal      = 0m;

            _logger.Info($"Processing cart item...");


            var productIds = cartItems
                .Select(k => k.ProductId)
                .ToArray();

            var productDiscounts = _context.ProductDiscountOffer
                .Include(i => i.DiscountOffer)
                .Where(d => productIds
                    .Contains(d.ProductId) && d.DiscountOffer.EndDate < DateTimeOffset.UtcNow)
                .Select(d => new
                {
                      d.ProductId
                    , d.DiscountOffer.Discount
                });

            foreach (CartItem cartItem in cartItems)
            {
                subTotal = cartItem.Price!.Value * cartItem.Quantity!.Value;

                productDiscountTotal += cartItem.DiscountAmount ?? 0m;
                productTaxTotal      += cartItem.TaxAmount      ?? 0m;

                orderItems.Add(new OrderItem
                {
                    ProductPrice   = cartItem.Price          ?? 0m,
                    Quantity       = cartItem.Quantity       ?? 0m,
                    DiscountAmount = cartItem.DiscountAmount ?? 0m,
                    TaxAmount      = cartItem.TaxAmount      ?? 0m,
                    ProductId      = cartItem.ProductId,
                    OrderId        = order.OrderId
                });; ;
            }
            _logger.Info("Price calculation started....");
            
            order.SubTotal              = subTotal;
            order.ProductDiscountAmount = productDiscountTotal;
            order.ProductTaxAmount      = productTaxTotal;  

            order.OrderTotal += subTotal 
                + productTaxTotal 
                + order.OrderTaxAmount 
                + order.ShippingFeeAmount 
                + order.PaymentFeeAmount 
                - (productDiscountTotal + order.OrderDiscountAmount);

            _logger.Info($"Order {order.OrderId} total: {order.OrderTotal} subtotal: {subTotal} product tax amount: {productTaxTotal} product discount amount: {productDiscountTotal} order tax amount: {order.OrderTaxAmount} order discount amount: {order.OrderDiscountAmount} shipping fee amount: {order.ShippingFeeAmount} payment fee amount {order.PaymentFeeAmount}");

            cart.IsActive               = false; 
            cart.LockedOnCheckout       = true;

            _context.Cart.Update(cart);

            _context.OrderItem.AddRange(orderItems);
             
            _logger.Info($"Price calculation done for order {order.OrderId}, saving data...");

            await _context.SaveChangesAsync(cancellationToken);


            return (_mapper.Map<Order, OrderDto>(order), Status.Created);
        }
        catch (Exception ex)
        {
            _logger.Error(ex, "Critical error order calculation failure"); 
            throw;
        }
    }
}
