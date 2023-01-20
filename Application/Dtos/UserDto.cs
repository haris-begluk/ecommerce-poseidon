
 
using System;
using AutoMapper;
using Poseidon.Domain;
namespace Poseidon.Application.Dto;
public class UserDto : IMapFrom<User>
{ 
    public int?            UserId          { get; set; }
    public int             AddressId       { get; set; }
    public string          Email           { get; set; }
    public string          ExternalRef     { get; set; }
    public string          FirstName       { get; set; }
    public string?         ImageUrl        { get; set; }
    public string          LastName        { get; set; }
    public string          PhoneNumber     { get; set; }
    public DateTimeOffset  Sys_CreatedAt   { get; set; }
    public string          Sys_CreatedBy   { get; set; }
    public DateTimeOffset  Sys_UpdatedAt   { get; set; }
    public string          Sys_UpdatedBy   { get; set; }
    public string          Username        { get; set; }



    public void Mapping(Profile profile)
    {  
          profile.CreateMap<User, UserDto>();
    }
}



