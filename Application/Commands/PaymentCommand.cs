using AutoMapper;
using Poseidon.Domain;
namespace Poseidon.Application.Commands;

public class PaymentCommand : IUpsertCommand<Payment>
{ 
    public int?            PaymentId           { get; set; }
    public decimal?         Amount              { get; set; }
    public string?         FailureMessage      { get; set; }
    public int?             OrderId             { get; set; }
    public decimal?         PaymentFee          { get; set; }
    public int?             PaymentProviderId   { get; set; }

    public void Mapping(Profile profile)
    {
         profile.CreateMap<PaymentCommand, Payment>().MapOnlyIfChanged();
    }
} 



