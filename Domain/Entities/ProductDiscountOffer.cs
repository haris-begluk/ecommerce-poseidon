namespace Poseidon.Domain;

public class ProductDiscountOffer : AuditableEntity
{
    public int           ProductDiscountOfferId { get; set; }
    public int           ProductId { get; set; }
    public Product       Product { get; set; }

    public int           DiscountOfferId { get; set; }
    public DiscountOffer DiscountOffer { get; set; }
}
