using AutoMapper;
using Poseidon.Domain;
namespace Poseidon.Application.Commands;

public class UserProductReviewCommand : IUpsertCommand<UserProductReview>
{ 
    public int?            UserProductReviewId   { get; set; }
    public string?         Comment               { get; set; }
    public int?             ProductId             { get; set; }
    public short?           Rating                { get; set; }
    public string?         Title                 { get; set; }
    public int?             UserId                { get; set; }

    public void Mapping(Profile profile)
    {
         profile.CreateMap<UserProductReviewCommand, UserProductReview>().MapOnlyIfChanged();
    }
} 



