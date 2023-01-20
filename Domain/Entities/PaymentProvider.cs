namespace Poseidon.Domain;

public class PaymentProvider : AuditableEntity
{
    public int     PaymentProviderId        { get; set; }
    public string  Name                     { get; set; } = null!;
    public bool    IsEnabled                { get; set; }
    public string? AdditionalSettings       { get; set; }

    public virtual ICollection<Payment> Payment { get; set; }

}
