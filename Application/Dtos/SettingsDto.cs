
 
using System;
using AutoMapper;
using Poseidon.Domain;
namespace Poseidon.Application.Dto;
public class SettingsDto : IMapFrom<Settings>
{ 
    public int?            SettingsId            { get; set; }
    public string?         Description           { get; set; }
    public decimal?        OrderDiscountAmount   { get; set; }
    public decimal?        OrderTaxAmount        { get; set; }
    public decimal?        PaymentFeeAmount      { get; set; }
    public string?         PaymentMethod         { get; set; }
    public decimal?        ShippingFeeAmount     { get; set; }
    public string?         ShippingMethod        { get; set; }
    public string?         Supplier              { get; set; }
    public DateTimeOffset  Sys_CreatedAt         { get; set; }
    public string          Sys_CreatedBy         { get; set; }
    public DateTimeOffset  Sys_UpdatedAt         { get; set; }
    public string          Sys_UpdatedBy         { get; set; }



    public void Mapping(Profile profile)
    {  
          profile.CreateMap<Settings, SettingsDto>();
    }
}



