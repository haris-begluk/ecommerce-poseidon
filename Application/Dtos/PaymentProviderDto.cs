
 
using System;
using AutoMapper;
using Poseidon.Domain;
namespace Poseidon.Application.Dto;
public class PaymentProviderDto : IMapFrom<PaymentProvider>
{ 
    public int?            PaymentProviderId    { get; set; }
    public string?         AdditionalSettings   { get; set; }
    public bool            IsEnabled            { get; set; }
    public string          Name                 { get; set; }
    public DateTimeOffset  Sys_CreatedAt        { get; set; }
    public string          Sys_CreatedBy        { get; set; }
    public DateTimeOffset  Sys_UpdatedAt        { get; set; }
    public string          Sys_UpdatedBy        { get; set; }



    public void Mapping(Profile profile)
    {  
          profile.CreateMap<PaymentProvider, PaymentProviderDto>();
    }
}



