using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Internal;
using Poseidon.Domain;

namespace Poseidon.Application
{
    public interface IPoseidonDbContext
    {
        DbSet<Address>                 Address              { get; set; }
        DbSet<Cart>                    Cart                 { get; set; }
        DbSet<CartItem>                CartItem             { get; set; }
        DbSet<Category>                Category             { get; set; }
        DbSet<Country>                 Country              { get; set; }
        DbSet<Order>                   Order                { get; set; }
        DbSet<OrderItem>               OrderItem            { get; set; }
        DbSet<Payment>                 Payment              { get; set; }
        DbSet<PaymentProvider>         PaymentProvider      { get; set; }
        DbSet<Product>                 Product              { get; set; }
        DbSet<UserProductReview>       UserProductReview    { get; set; }
        DbSet<Delivery>                Delivery             { get; set; }
        DbSet<Settings>                Settings             { get; set; }
        DbSet<TaxRate>                 TaxRate              { get; set; }
        DbSet<User>                    User                 { get; set; }
        DbSet<WishList>                WishList             { get; set; }
        DbSet<WishListItem>            WishListItem         { get; set; }
        DbSet<CreditCard>              CreditCard           { get; set; }
        DbSet<DiscountOffer>           DiscountOffer        { get; set; }
        DbSet<ProductDiscountOffer>    ProductDiscountOffer { get; set; }

        Task<int> SaveChangesAsync(CancellationToken cancellationToken);
        DbSet<TEntity> Set<TEntity>() where TEntity : class;
    }
}