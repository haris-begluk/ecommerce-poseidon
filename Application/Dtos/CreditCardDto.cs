
 
using System;
using AutoMapper;
using Poseidon.Domain;
namespace Poseidon.Application.Dto;
public class CreditCardDto : IMapFrom<CreditCard>
{ 
    public int?            CreditCardId        { get; set; }
    public string          CVC                 { get; set; }
    public string          CreaditCartNumber   { get; set; }
    public DateTime        ExpirationDate      { get; set; }
    public string?         ImageUrl            { get; set; }
    public int             PaymentProviderId   { get; set; }
    public DateTimeOffset  Sys_CreatedAt       { get; set; }
    public string          Sys_CreatedBy       { get; set; }
    public DateTimeOffset  Sys_UpdatedAt       { get; set; }
    public string          Sys_UpdatedBy       { get; set; }
    public int             UserId              { get; set; }



    public void Mapping(Profile profile)
    {  
          profile.CreateMap<CreditCard, CreditCardDto>();
    }
}



