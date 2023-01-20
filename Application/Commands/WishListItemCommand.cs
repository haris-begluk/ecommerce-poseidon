using AutoMapper;
using Poseidon.Domain;
namespace Poseidon.Application.Commands;

public class WishListItemCommand : IUpsertCommand<WishListItem>
{ 
    public int?            WishListItemId   { get; set; }
    public string?         Note             { get; set; }
    public int?             ProductId        { get; set; }
    public decimal?        Quantity         { get; set; }
    public int?             WishListId       { get; set; }

    public void Mapping(Profile profile)
    {
         profile.CreateMap<WishListItemCommand, WishListItem>().MapOnlyIfChanged();
    }
} 



