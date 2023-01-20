using AutoMapper;
using Poseidon.Domain;
namespace Poseidon.Application.Commands;

public class DeliveryCommand : IUpsertCommand<Delivery>
{ 
    public int?            DeliveryId      { get; set; }
    public string?         Description     { get; set; }
    public bool?            IsActive        { get; set; }
    public string?         Title           { get; set; }

    public void Mapping(Profile profile)
    {
         profile.CreateMap<DeliveryCommand, Delivery>().MapOnlyIfChanged();
    }
} 



