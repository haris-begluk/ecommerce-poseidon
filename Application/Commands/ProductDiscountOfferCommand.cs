using AutoMapper;
using Poseidon.Domain;
namespace Poseidon.Application.Commands;

public class ProductDiscountOfferCommand : IUpsertCommand<ProductDiscountOffer>
{ 
    public int?            ProductDiscountOfferId   { get; set; }
    public int?             DiscountOfferId          { get; set; }
    public int?             ProductId                { get; set; }

    public void Mapping(Profile profile)
    {
         profile.CreateMap<ProductDiscountOfferCommand, ProductDiscountOffer>().MapOnlyIfChanged();
    }
} 



