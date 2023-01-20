
 
using System;
using AutoMapper;
using Poseidon.Domain;
namespace Poseidon.Application.Dto;
public class CartItemDto : IMapFrom<CartItem>
{ 
    public int?            CartItemId       { get; set; }
    public int             CartId           { get; set; }
    public decimal?        DiscountAmount   { get; set; }
    public string?         ImageUrl         { get; set; }
    public decimal?        Price            { get; set; }
    public int             ProductId        { get; set; }
    public decimal?        Quantity         { get; set; }
    public DateTimeOffset  Sys_CreatedAt    { get; set; }
    public string          Sys_CreatedBy    { get; set; }
    public DateTimeOffset  Sys_UpdatedAt    { get; set; }
    public string          Sys_UpdatedBy    { get; set; }
    public decimal?        TaxAmount        { get; set; }
    public string?         Title            { get; set; }
    public string?         Unit             { get; set; }



    public void Mapping(Profile profile)
    {  
          profile.CreateMap<CartItem, CartItemDto>();
    }
}



