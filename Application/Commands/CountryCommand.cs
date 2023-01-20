using AutoMapper;
using Poseidon.Domain;
namespace Poseidon.Application.Commands;

public class CountryCommand : IUpsertCommand<Country>
{ 
    public int?            CountryId            { get; set; }
    public string?          Name                 { get; set; }
    public int?             NumericIsoCode       { get; set; }
    public string?         PhonePrefix          { get; set; }
    public string?         ThreeLetterIsoCode   { get; set; }
    public string?         TwoLetterIsoCode     { get; set; }

    public void Mapping(Profile profile)
    {
         profile.CreateMap<CountryCommand, Country>().MapOnlyIfChanged();
    }
} 



