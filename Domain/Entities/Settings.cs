namespace Poseidon.Domain;

public class Settings: AuditableEntity
{
    public int            SettingsId            { get; set; }
    public string?        Description           { get; set; }

    public decimal?       OrderDiscountAmount    { get; set; }
    public decimal?       OrderTaxAmount         { get; set; }
    public decimal?       PaymentFeeAmount       { get; set; }
    public decimal?       ShippingFeeAmount      { get; set; }
    public string?        ShippingMethod         { get; set; }
    public string?        PaymentMethod          { get; set; }
    public string?        Supplier               { get; set; }

}