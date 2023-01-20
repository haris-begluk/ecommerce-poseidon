
 
using System;
using AutoMapper;
using Poseidon.Domain;
namespace Poseidon.Application.Dto;
public class ProductDto : IMapFrom<Product>
{ 
    public int?            ProductId       { get; set; }
    public int?            CategoryId      { get; set; }
    public string?         Description     { get; set; }
    public string?         Gtin            { get; set; }
    public string?         ImageUrl        { get; set; }
    public string          Name            { get; set; }
    public string          Number          { get; set; }
    public decimal         Price           { get; set; }
    public string?         Supplier        { get; set; }
    public DateTimeOffset  Sys_CreatedAt   { get; set; }
    public string          Sys_CreatedBy   { get; set; }
    public DateTimeOffset  Sys_UpdatedAt   { get; set; }
    public string          Sys_UpdatedBy   { get; set; }
    public int?            TaxRateId       { get; set; }
    public string?         Unit            { get; set; }



    public void Mapping(Profile profile)
    {  
          profile.CreateMap<Product, ProductDto>();
    }
}



