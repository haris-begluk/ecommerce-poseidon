
 
using System;
using AutoMapper;
using Poseidon.Domain;
namespace Poseidon.Application.Dto;
public class DeliveryDto : IMapFrom<Delivery>
{ 
    public int?            DeliveryId      { get; set; }
    public string?         Description     { get; set; }
    public bool            IsActive        { get; set; }
    public DateTimeOffset  Sys_CreatedAt   { get; set; }
    public string          Sys_CreatedBy   { get; set; }
    public DateTimeOffset  Sys_UpdatedAt   { get; set; }
    public string          Sys_UpdatedBy   { get; set; }
    public string?         Title           { get; set; }



    public void Mapping(Profile profile)
    {  
          profile.CreateMap<Delivery, DeliveryDto>();
    }
}



