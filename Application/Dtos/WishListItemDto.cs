
 
using System;
using AutoMapper;
using Poseidon.Domain;
namespace Poseidon.Application.Dto;
public class WishListItemDto : IMapFrom<WishListItem>
{ 
    public int?            WishListItemId   { get; set; }
    public string?         Note             { get; set; }
    public int             ProductId        { get; set; }
    public decimal?        Quantity         { get; set; }
    public DateTimeOffset  Sys_CreatedAt    { get; set; }
    public string          Sys_CreatedBy    { get; set; }
    public DateTimeOffset  Sys_UpdatedAt    { get; set; }
    public string          Sys_UpdatedBy    { get; set; }
    public int             WishListId       { get; set; }



    public void Mapping(Profile profile)
    {  
          profile.CreateMap<WishListItem, WishListItemDto>();
    }
}



