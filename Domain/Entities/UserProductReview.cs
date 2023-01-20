namespace Poseidon.Domain;

public class UserProductReview : AuditableEntity
{ 
    public int     UserProductReviewId { get; set; }
    public string? Title            { get; set; }
    public string? Comment          { get; set; }
    public short   Rating           { get; set; }
    public int     UserId           { get; set; }
    public int     ProductId        { get; set; }

    public virtual User    User             { get; set; }
    public virtual Product Product          { get; set; }

}
