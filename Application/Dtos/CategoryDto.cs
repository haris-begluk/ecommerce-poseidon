
 
using System;
using AutoMapper;
using Poseidon.Domain;
namespace Poseidon.Application.Dto;
public class CategoryDto : IMapFrom<Category>
{ 
    public int?            CategoryId      { get; set; }
    public string          Name            { get; set; }
    public DateTimeOffset  Sys_CreatedAt   { get; set; }
    public string          Sys_CreatedBy   { get; set; }
    public DateTimeOffset  Sys_UpdatedAt   { get; set; }
    public string          Sys_UpdatedBy   { get; set; }



    public void Mapping(Profile profile)
    {  
          profile.CreateMap<Category, CategoryDto>();
    }
}



