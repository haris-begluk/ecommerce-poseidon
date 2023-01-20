namespace Poseidon.Domain;

public class CartItem : AuditableEntity
{
    public int    CartItemId             { get; set; }
    public decimal? Quantity              { get; set; }
    public decimal? Price                 { get; set; }
    public decimal? DiscountAmount        { get; set; }
    public decimal? TaxAmount             { get; set; }
    public string? Title                  { get; set; }
    public string? ImageUrl               { get; set; }
    public string? Unit                   { get; set; }


    public int CartId    { get; set; }
    public int ProductId { get; set; }

    public virtual Cart Cart       { get; set; }
    public virtual Product Product { get; set; }
}
