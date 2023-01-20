namespace Poseidon.Domain;

public class Order : AuditableEntity
{
    public int            OrderId                { get; set; }
    public string?        Description            { get; set; }
    public decimal        SubTotal               { get; set; }
    public decimal        ProductTaxAmount       { get; set; }
    public decimal        ProductDiscountAmount  { get; set; }
    public decimal        OrderDiscountAmount    { get; set; }
    public decimal        OrderTaxAmount         { get; set; }
    public decimal        OrderTotal             { get; set; }
    public string         OrderStatus            { get; set; }
    public bool           PayedAndClosed         { get; set; }
    public string?        ShippingMethod         { get; set; }
    public decimal        ShippingFeeAmount      { get; set; }
    
    public string?        PaymentMethod          { get; set; }
    public decimal        PaymentFeeAmount       { get; set; }

    public int?          ShippingAddressId      { get; set; }
    public int?          BillingAddressId       { get; set; }
    public int           UserId                 { get; set; }
    public int?          CartId                 { get; set; }
    public int?          DeliveryId             { get; set; }

    public virtual User     User                 { get; set; }
    public virtual Address? ShippingAddress      { get; set; }
    public virtual Address? BillingAddress       { get; set; }
    public virtual Cart?     Cart                { get; set; }
    public virtual Delivery? Delivery            { get; set; }

    public virtual ICollection<OrderItem> OrderItem { get; set; }
    public virtual ICollection<Payment>   Payment   { get; set; }

}

