namespace Poseidon.Domain;

public class Cart : AuditableEntity
{
    public int           CartId                    { get; set; }
    public bool           IsActive                  { get; set; }
    public bool?          LockedOnCheckout          { get; set; }
    public int           UserId                    { get; set; }
    public decimal?        Total                    { get; set; }
    public decimal?        TaxAmount                { get; set; }
    public decimal?        DiscountAmount           { get; set; }

    public virtual User User { get; set; } 
    public virtual ICollection<CartItem> CartItem { get; set; }
    public virtual Order Order { get; set; } 
}
