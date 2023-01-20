namespace Poseidon.Domain;

public class WishListItem : AuditableEntity
{
    public int      WishListItemId { get; set; }
    public string?  Note           { get; set; }
    public decimal? Quantity       { get; set; }

    public int      WishListId     { get; set; }
    public int      ProductId      { get; set; }
    public virtual Product  Product        { get; set; } 
    public virtual WishList WishList       { get; set; } 
}
