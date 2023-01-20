using AutoMapper;
using Poseidon.Domain;
namespace Poseidon.Application.Commands;

public class CategoryCommand : IUpsertCommand<Category>
{ 
    public int?            CategoryId      { get; set; }
    public string?          Name            { get; set; }

    public void Mapping(Profile profile)
    {
         profile.CreateMap<CategoryCommand, Category>().MapOnlyIfChanged();
    }
} 



