using Microsoft.EntityFrameworkCore;
using Poseidon.Application;
using Poseidon.Common;
using Poseidon.Domain;

namespace Poseidon.Persistence
{
    public class PoseidonDbContext : DbContext, IPoseidonDbContext
    {
        private readonly ICurrentUserService _currentUserService;
        private readonly IDateTimeOffset     _dateTime;

        
        public DbSet<Address>                Address               { get; set; }
        public DbSet<Cart>                   Cart                  { get; set; }
        public DbSet<CartItem>               CartItem              { get; set; }
        public DbSet<Category>               Category              { get; set; }
        public DbSet<Country>                Country               { get; set; }
        public DbSet<Order>                  Order                 { get; set; }
        public DbSet<OrderItem>              OrderItem             { get; set; }
        public DbSet<Payment>                Payment               { get; set; }
        public DbSet<PaymentProvider>        PaymentProvider       { get; set; }
        public DbSet<Product>                Product               { get; set; }
        public DbSet<UserProductReview>      UserProductReview     { get; set; }
        public DbSet<Delivery>               Delivery              { get; set; }
        public DbSet<Settings>               Settings              { get; set; }
        public DbSet<TaxRate>                TaxRate               { get; set; }
        public DbSet<User>                   User                  { get; set; }
        public DbSet<WishList>               WishList              { get; set; }
        public DbSet<WishListItem>           WishListItem          { get; set; }
        public DbSet<CreditCard>             CreditCard            { get; set; }
        public DbSet<DiscountOffer>          DiscountOffer         { get; set; }
        public DbSet<ProductDiscountOffer>   ProductDiscountOffer  { get; set; }

        public PoseidonDbContext(DbContextOptions<PoseidonDbContext> options)
            : base(options)
        {
        }
        public PoseidonDbContext(
            DbContextOptions<PoseidonDbContext> options,
            ICurrentUserService currentUserService,
            IDateTimeOffset dateTime)
            : base(options)
        {
            _currentUserService = currentUserService;
            _dateTime           = dateTime          ;
        }

        public override Task<int> SaveChangesAsync(CancellationToken cancellationToken = new CancellationToken())
        {
            foreach (var entry in ChangeTracker.Entries<AuditableEntity>())
            {
                switch (entry.State)
                {
                    case EntityState.Added:
                        entry.Entity.Sys_CreatedBy   = entry.Entity.Sys_UpdatedBy = _currentUserService.UserId;
                        entry.Entity.Sys_CreatedAt   = entry.Entity.Sys_UpdatedAt = _dateTime.Now;
                        break;

                    case EntityState.Modified:
                        entry.Entity.Sys_UpdatedBy                   = _currentUserService.UserId;
                        entry.Entity.Sys_UpdatedAt                   = _dateTime.Now;
                        entry.Property("Sys_CreatedAt").IsModified   = false;
                        entry.Property("Sys_CreatedBy").IsModified   = false;
                        break;
                }
            }

            return base.SaveChangesAsync(cancellationToken);
        }
        
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.ApplyConfigurationsFromAssembly(typeof(IPoseidonDbContext).Assembly);
            
                                                                                          
            modelBuilder.Entity<Cart>            ().Property(p => p.Total)                 .HasPrecision(19, 4);
            modelBuilder.Entity<Cart>            ().Property(p => p.TaxAmount)             .HasPrecision(19, 4);
            modelBuilder.Entity<Cart>            ().Property(p => p.DiscountAmount)        .HasPrecision(19, 4);

            modelBuilder.Entity<CartItem>        ().Property(p => p.Quantity)              .HasPrecision(19, 4);
            modelBuilder.Entity<CartItem>        ().Property(p => p.Price   )              .HasPrecision(19, 4);
            modelBuilder.Entity<CartItem>        ().Property(p => p.DiscountAmount)        .HasPrecision(19, 4);
            modelBuilder.Entity<CartItem>        ().Property(p => p.TaxAmount)             .HasPrecision(19, 4);
                                                                                           
            modelBuilder.Entity<Order>           ().Property(p => p.SubTotal)              .HasPrecision(19, 4);

            modelBuilder.Entity<Order>           ().Property(p => p.OrderDiscountAmount)   .HasPrecision(19, 4);
            modelBuilder.Entity<Order>           ().Property(p => p.OrderTaxAmount)        .HasPrecision(19, 4);

            modelBuilder.Entity<Order>           ().Property(p => p.ProductTaxAmount)      .HasPrecision(19, 4);
            modelBuilder.Entity<Order>           ().Property(p => p.ProductDiscountAmount) .HasPrecision(19, 4);

            modelBuilder.Entity<Order>           ().Property(p => p.ShippingFeeAmount)     .HasPrecision(19, 4);
            modelBuilder.Entity<Order>           ().Property(p => p.OrderTotal)            .HasPrecision(19, 4);
            modelBuilder.Entity<Order>           ().Property(p => p.PaymentFeeAmount)      .HasPrecision(19, 4);
                                                                                           
            modelBuilder.Entity<OrderItem>       ().Property(p => p.ProductPrice)          .HasPrecision(19, 4);
            modelBuilder.Entity<OrderItem>       ().Property(p => p.Quantity)              .HasPrecision(19, 4);
            modelBuilder.Entity<OrderItem>       ().Property(p => p.DiscountAmount)        .HasPrecision(19, 4);
            modelBuilder.Entity<OrderItem>       ().Property(p => p.TaxAmount)             .HasPrecision(19, 4);
                                                                                           
            modelBuilder.Entity<Payment>         ().Property(p => p.Amount)                .HasPrecision(19, 4);
            modelBuilder.Entity<Payment>         ().Property(p => p.PaymentFee)            .HasPrecision(19, 4);
                                                                                           
            modelBuilder.Entity<Product>         ().Property(p => p.Price)                 .HasPrecision(19, 4);
                                                                                                                                                                                      
            modelBuilder.Entity<TaxRate>         ().Property(p => p.Rate)                  .HasPrecision(19, 4);
                                                                                           
            modelBuilder.Entity<WishListItem>    ().Property(p => p.Quantity)              .HasPrecision(19, 4);

            modelBuilder.Entity<DiscountOffer>   ().Property(p => p.Discount)              .HasPrecision(19, 4);


            modelBuilder.Entity<Settings>        ().Property(p => p.OrderDiscountAmount)   .HasPrecision(19, 4);
            modelBuilder.Entity<Settings>        ().Property(p => p.OrderTaxAmount)        .HasPrecision(19, 4);
            modelBuilder.Entity<Settings>        ().Property(p => p.PaymentFeeAmount)      .HasPrecision(19, 4);
            modelBuilder.Entity<Settings>        ().Property(p => p.ShippingFeeAmount)     .HasPrecision(19, 4);
        

        }
    }
}  