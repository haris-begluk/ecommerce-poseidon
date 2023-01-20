namespace Poseidon.Domain;

public class DiscountOffer : AuditableEntity
{
    public int            DiscountOfferId { get; set; }
    public string         Title           { get; set; }
    public string?        Description     { get; set; }
    public string?        ImageUrl        { get; set; }
    public DateTimeOffset StartDate       { get; set; }
    public DateTimeOffset EndDate         { get; set; }
    public decimal        Discount        { get; set; }

    public virtual ICollection<ProductDiscountOffer> ProductDiscountOffer { get; set; }
}
