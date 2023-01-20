namespace Poseidon.Domain;

public class Product : AuditableEntity
{
    public int             ProductId              { get; set; }
    public string          Name                   { get; set; } = null!;
    public string          Number                 { get; set; } = null!;
    public string?         ImageUrl               { get; set; }
    public string?         Unit                   { get; set; }
    public decimal         Price                  { get; set; }
    public string?         Description            { get; set; }
    public string?         Gtin                   { get; set; }
    public string?         Supplier               { get; set; }
    public int?            TaxRateId              { get; set; }
    public int?            CategoryId             { get; set; }

    public virtual TaxRate          TaxRate               { get; set; }
    public virtual Category        Category               { get; set; }
            
    public virtual ICollection<WishListItem>      WishListItem            { get; set; }
    public virtual ICollection<OrderItem>         OrderItem               { get; set; }
    public virtual ICollection<CartItem>          CartItem                { get; set; }
    public virtual ICollection<ProductDiscountOffer> ProductDiscountOffer { get; set; }
    public virtual ICollection<UserProductReview> UserProductReview { get; set; }

}

