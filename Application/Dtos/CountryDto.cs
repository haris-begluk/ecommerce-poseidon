
 
using System;
using AutoMapper;
using Poseidon.Domain;
namespace Poseidon.Application.Dto;
public class CountryDto : IMapFrom<Country>
{ 
    public int?            CountryId            { get; set; }
    public string          Name                 { get; set; }
    public int             NumericIsoCode       { get; set; }
    public string?         PhonePrefix          { get; set; }
    public DateTimeOffset  Sys_CreatedAt        { get; set; }
    public string          Sys_CreatedBy        { get; set; }
    public DateTimeOffset  Sys_UpdatedAt        { get; set; }
    public string          Sys_UpdatedBy        { get; set; }
    public string?         ThreeLetterIsoCode   { get; set; }
    public string?         TwoLetterIsoCode     { get; set; }



    public void Mapping(Profile profile)
    {  
          profile.CreateMap<Country, CountryDto>();
    }
}



