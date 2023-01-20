using AutoMapper;
using Poseidon.Domain;
namespace Poseidon.Application.Commands;

public class ProductCommand : IUpsertCommand<Product>
{ 
    public int?            ProductId       { get; set; }
    public int?            CategoryId      { get; set; }
    public string?         Description     { get; set; }
    public string?         Gtin            { get; set; }
    public string?         ImageUrl        { get; set; }
    public string?          Name            { get; set; }
    public string?          Number          { get; set; }
    public decimal?         Price           { get; set; }
    public string?         Supplier        { get; set; }
    public int?            TaxRateId       { get; set; }
    public string?         Unit            { get; set; }

    public void Mapping(Profile profile)
    {
         profile.CreateMap<ProductCommand, Product>().MapOnlyIfChanged();
    }
} 



