
 
using System;
using AutoMapper;
using Poseidon.Domain;
namespace Poseidon.Application.Dto;
public class PaymentDto : IMapFrom<Payment>
{ 
    public int?            PaymentId           { get; set; }
    public decimal         Amount              { get; set; }
    public string?         FailureMessage      { get; set; }
    public int             OrderId             { get; set; }
    public decimal         PaymentFee          { get; set; }
    public int             PaymentProviderId   { get; set; }
    public DateTimeOffset  Sys_CreatedAt       { get; set; }
    public string          Sys_CreatedBy       { get; set; }
    public DateTimeOffset  Sys_UpdatedAt       { get; set; }
    public string          Sys_UpdatedBy       { get; set; }



    public void Mapping(Profile profile)
    {  
          profile.CreateMap<Payment, PaymentDto>();
    }
}



