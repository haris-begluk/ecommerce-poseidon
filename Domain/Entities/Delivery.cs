namespace Poseidon.Domain;

public class Delivery : AuditableEntity
{
    public int        DeliveryId     { get; set; }
    public string?    Title          { get; set; }
    public string?    Description    { get; set; }
    public bool       IsActive       { get; set; }

    public virtual ICollection<Order> Order { get; set; }

}
