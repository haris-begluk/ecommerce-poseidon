
 
using System;
using AutoMapper;
using Poseidon.Domain;
namespace Poseidon.Application.Dto;
public class OrderItemDto : IMapFrom<OrderItem>
{ 
    public int?            OrderItemId      { get; set; }
    public decimal         DiscountAmount   { get; set; }
    public int             OrderId          { get; set; }
    public int             ProductId        { get; set; }
    public decimal         ProductPrice     { get; set; }
    public decimal         Quantity         { get; set; }
    public DateTimeOffset  Sys_CreatedAt    { get; set; }
    public string          Sys_CreatedBy    { get; set; }
    public DateTimeOffset  Sys_UpdatedAt    { get; set; }
    public string          Sys_UpdatedBy    { get; set; }
    public decimal         TaxAmount        { get; set; }



    public void Mapping(Profile profile)
    {  
          profile.CreateMap<OrderItem, OrderItemDto>();
    }
}



