using AutoMapper;
using Poseidon.Domain;
namespace Poseidon.Application.Commands;

public class UserCommand : IUpsertCommand<User>
{ 
    public int?            UserId          { get; set; }
    public int?             AddressId       { get; set; }
    public string?          Email           { get; set; }
    public string?          ExternalRef     { get; set; }
    public string?          FirstName       { get; set; }
    public string?         ImageUrl        { get; set; }
    public string?          LastName        { get; set; }
    public string?          PhoneNumber     { get; set; }
    public string?          Username        { get; set; }

    public void Mapping(Profile profile)
    {
         profile.CreateMap<UserCommand, User>().MapOnlyIfChanged();
    }
} 



