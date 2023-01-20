using AutoMapper;
using Poseidon.Domain;
namespace Poseidon.Application.Commands;

public class PaymentProviderCommand : IUpsertCommand<PaymentProvider>
{ 
    public int?            PaymentProviderId    { get; set; }
    public string?         AdditionalSettings   { get; set; }
    public bool?            IsEnabled            { get; set; }
    public string?          Name                 { get; set; }

    public void Mapping(Profile profile)
    {
         profile.CreateMap<PaymentProviderCommand, PaymentProvider>().MapOnlyIfChanged();
    }
} 



