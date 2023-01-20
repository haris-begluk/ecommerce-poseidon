using AutoMapper;
using Poseidon.Domain;
namespace Poseidon.Application.Commands;

public class CreditCardCommand : IUpsertCommand<CreditCard>
{ 
    public int?            CreditCardId        { get; set; }
    public string?          CVC                 { get; set; }
    public string?          CreaditCartNumber   { get; set; }
    public DateTime?        ExpirationDate      { get; set; }
    public string?         ImageUrl            { get; set; }
    public int?             PaymentProviderId   { get; set; }
    public int?             UserId              { get; set; }

    public void Mapping(Profile profile)
    {
         profile.CreateMap<CreditCardCommand, CreditCard>().MapOnlyIfChanged();
    }
} 



