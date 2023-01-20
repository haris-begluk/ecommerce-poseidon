namespace Poseidon.Domain;

public class CreditCard : AuditableEntity
{
    public int            CreditCardId      { get; set; }
    public string         CreaditCartNumber { get; set; }
    public string         CVC               { get; set; }
    public DateTime       ExpirationDate    { get; set; } 
    public string?        ImageUrl          { get; set; }

    public int    UserId            { get; set; }
    public int    PaymentProviderId { get; set; }

    public virtual PaymentProvider PaymentProvider { get; set; }
    public virtual User User { get; set; }
}
