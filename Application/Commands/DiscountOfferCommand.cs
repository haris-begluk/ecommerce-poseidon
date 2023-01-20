using AutoMapper;
using Poseidon.Domain;
namespace Poseidon.Application.Commands;

public class DiscountOfferCommand : IUpsertCommand<DiscountOffer>
{ 
    public int?            DiscountOfferId   { get; set; }
    public string?         Description       { get; set; }
    public decimal?         Discount          { get; set; }
    public DateTimeOffset?  EndDate           { get; set; }
    public string?         ImageUrl          { get; set; }
    public DateTimeOffset?  StartDate         { get; set; }
    public string?          Title             { get; set; }

    public void Mapping(Profile profile)
    {
         profile.CreateMap<DiscountOfferCommand, DiscountOffer>().MapOnlyIfChanged();
    }
} 



