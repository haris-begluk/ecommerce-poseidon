using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;

namespace Poseidon.Application.CommandHandlers
{
    public static  class PostMethods
    { 
        public static async Task PostCartItemRecalculate(
                ILogger logger 
            ,   IPoseidonDbContext context 
            ,   long cartId
            )
        {
            var cart = context.Cart
                .Include( c => c.CartItem)
                .SingleOrDefault(c => c.CartId
                    .Equals(cartId)
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

            await context.SaveChangesAsync(default);
        }
    }
}
