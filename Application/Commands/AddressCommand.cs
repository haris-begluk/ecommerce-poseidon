using AutoMapper;
using Poseidon.Domain;
namespace Poseidon.Application.Commands;

public class AddressCommand : IUpsertCommand<Address>
{ 
    public int?            AddressId       { get; set; }
    public string?         Address1        { get; set; }
    public string?         Address2        { get; set; }
    public string?         City            { get; set; }
    public string?         Company         { get; set; }
    public int?             CountryId       { get; set; }
    public string?         County          { get; set; }
    public string?         Email           { get; set; }
    public string?         FirstName       { get; set; }
    public string?         LastName        { get; set; }
    public string?         PhoneNumber     { get; set; }
    public string?         ZipPostalCode   { get; set; }

    public void Mapping(Profile profile)
    {
         profile.CreateMap<AddressCommand, Address>().MapOnlyIfChanged();
    }
} 



