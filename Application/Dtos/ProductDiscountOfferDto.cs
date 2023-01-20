
 
using System;
using AutoMapper;
using Poseidon.Domain;
namespace Poseidon.Application.Dto;
public class ProductDiscountOfferDto : IMapFrom<ProductDiscountOffer>
{ 
    public int?            ProductDiscountOfferId   { get; set; }
    public int             DiscountOfferId          { get; set; }
    public int             ProductId                { get; set; }
    public DateTimeOffset  Sys_CreatedAt            { get; set; }
    public string          Sys_CreatedBy            { get; set; }
    public DateTimeOffset  Sys_UpdatedAt            { get; set; }
    public string          Sys_UpdatedBy            { get; set; }



    public void Mapping(Profile profile)
    {  
          profile.CreateMap<ProductDiscountOffer, ProductDiscountOfferDto>();
    }
}



