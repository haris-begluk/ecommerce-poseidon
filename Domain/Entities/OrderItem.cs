namespace Poseidon.Domain;

public class OrderItem : AuditableEntity
{
    public int     OrderItemId    { get; set; }
    public decimal ProductPrice   { get; set; }
    public decimal Quantity       { get; set; }
    public decimal DiscountAmount { get; set; }
    public decimal TaxAmount      { get; set; }
    public int     ProductId      { get; set; }
    public int     OrderId        { get; set; }

    public virtual Product Product          { get; set; }
    public virtual Order   Order            { get; set; }
}

