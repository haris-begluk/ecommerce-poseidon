namespace Poseidon.Domain;

public class TaxRate : AuditableEntity
{
    public int      TaxRateId        { get; set; }
    public string   Name             { get; set; } = null!;
    public decimal  Rate             { get; set; }
}
