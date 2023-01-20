
 
using System;
using AutoMapper;
using Poseidon.Domain;
namespace Poseidon.Application.Dto;
public class CartDto : IMapFrom<Cart>
{ 
    public int?            CartId             { get; set; }
    public decimal?        DiscountAmount     { get; set; }
    public bool            IsActive           { get; set; }
    public bool?           LockedOnCheckout   { get; set; }
    public DateTimeOffset  Sys_CreatedAt      { get; set; }
    public string          Sys_CreatedBy      { get; set; }
    public DateTimeOffset  Sys_UpdatedAt      { get; set; }
    public string          Sys_UpdatedBy      { get; set; }
    public decimal?        TaxAmount          { get; set; }
    public decimal?        Total              { get; set; }
    public int             UserId             { get; set; }



    public void Mapping(Profile profile)
    {  
          profile.CreateMap<Cart, CartDto>();
    }
}



