namespace Poseidon.Domain;

public class Payment : AuditableEntity
{
    public int            PaymentId            { get; set; }
    public decimal        Amount               { get; set; }
    public decimal        PaymentFee           { get; set; }
    public string?        FailureMessage       { get; set; }

    public int            OrderId               { get; set; }
    public int            PaymentProviderId     { get; set; }

    public virtual PaymentProvider PaymentProvider      { get; set; }
    public virtual Order Order                          { get; set; }
}
