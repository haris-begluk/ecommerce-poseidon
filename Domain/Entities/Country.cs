namespace Poseidon.Domain;

public class Country : AuditableEntity
{
    public int     CountryId          { get; set; }
    public string  Name               { get; set; } = null!;
    public string? TwoLetterIsoCode   { get; set; }
    public string? ThreeLetterIsoCode { get; set; }
    public int     NumericIsoCode     { get; set; }
    public string? PhonePrefix        { get; set; }

}
