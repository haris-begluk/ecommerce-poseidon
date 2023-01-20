namespace Poseidon.Domain;

public class WishList : AuditableEntity
{
    public int     WishListId        { get; set; }
    public string? Title             { get; set; }
    public string? Description       { get; set; }
    public int     UserId            { get; set; }
    public virtual User User         { get; set; }
    public virtual ICollection<WishListItem> WishListItem { get; set; }
}
