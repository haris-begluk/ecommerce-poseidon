namespace Poseidon.Domain;

public class Category : AuditableEntity
{
    public int     CategoryId       { get; set; }
    public string  Name             { get; set; } = null!;
    public virtual ICollection<Product> Product { get; set; }
}
