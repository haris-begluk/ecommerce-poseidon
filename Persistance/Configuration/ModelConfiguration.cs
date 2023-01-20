using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using Poseidon.Domain;
using System.Reflection.Emit;

namespace Persistance.Configuration
{
    public class OrderItemConfiguration : IEntityTypeConfiguration<OrderItem>
    {
        public void Configure(EntityTypeBuilder<OrderItem> builder)
        {
            builder.HasKey(e => new {e.OrderItemId, e.OrderId, e.ProductId });

            builder.Property(e => e.OrderId).HasColumnName("OrderID");

            builder.Property(e => e.ProductId).HasColumnName("ProductID");

        }
    }

    public class OrderConfiguration : IEntityTypeConfiguration<Order>
    {
        public void Configure(EntityTypeBuilder<Order> builder)
        {
            builder.HasOne(a => a.Cart)
                   .WithOne(b => b.Order)
                   .HasForeignKey<Order>(b => b.CartId)
                   .OnDelete(DeleteBehavior.ClientSetNull);
        }
    }

    
    public class ProductDiscounOfferConfiguration : IEntityTypeConfiguration<ProductDiscountOffer>
    {
        public void Configure(EntityTypeBuilder<ProductDiscountOffer> builder)
        {
            builder.HasKey(e => new { e.ProductDiscountOfferId, e.DiscountOfferId, e.ProductId });

            builder.Property(e => e.DiscountOfferId).HasColumnName("DiscountOfferID");

            builder.Property(e => e.ProductId).HasColumnName("ProductID");

        }
    }
    public class UserProductReviewConfiguration : IEntityTypeConfiguration<UserProductReview>
    {
        public void Configure(EntityTypeBuilder<UserProductReview> builder)
        {
            builder.HasKey(o => new {o.UserProductReviewId, o.ProductId, o.UserId });

            builder.Property(e => e.UserId).HasColumnName("UserID");

            builder.Property(e => e.ProductId).HasColumnName("ProductID");
        }
    }
}
