using AutoMapper;
using Poseidon.Domain;
namespace Poseidon.Application.Commands;

public class TaxRateCommand : IUpsertCommand<TaxRate>
{ 
    public int?            TaxRateId       { get; set; }
    public string?          Name            { get; set; }
    public decimal?         Rate            { get; set; }

    public void Mapping(Profile profile)
    {
         profile.CreateMap<TaxRateCommand, TaxRate>().MapOnlyIfChanged();
    }
} 



