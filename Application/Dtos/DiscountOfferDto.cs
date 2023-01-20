
 
using System;
using AutoMapper;
using Poseidon.Domain;
namespace Poseidon.Application.Dto;
public class DiscountOfferDto : IMapFrom<DiscountOffer>
{ 
    public int?            DiscountOfferId   { get; set; }
    public string?         Description       { get; set; }
    public decimal         Discount          { get; set; }
    public DateTimeOffset  EndDate           { get; set; }
    public string?         ImageUrl          { get; set; }
    public DateTimeOffset  StartDate         { get; set; }
    public DateTimeOffset  Sys_CreatedAt     { get; set; }
    public string          Sys_CreatedBy     { get; set; }
    public DateTimeOffset  Sys_UpdatedAt     { get; set; }
    public string          Sys_UpdatedBy     { get; set; }
    public string          Title             { get; set; }



    public void Mapping(Profile profile)
    {  
          profile.CreateMap<DiscountOffer, DiscountOfferDto>();
    }
}



