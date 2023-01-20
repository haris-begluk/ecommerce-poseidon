using AutoMapper;
using Poseidon.Domain;
namespace Poseidon.Application.Commands;

public class WishListCommand : IUpsertCommand<WishList>
{ 
    public int?            WishListId      { get; set; }
    public string?         Description     { get; set; }
    public string?         Title           { get; set; }
    public int?             UserId          { get; set; }

    public void Mapping(Profile profile)
    {
         profile.CreateMap<WishListCommand, WishList>().MapOnlyIfChanged();
    }
} 



