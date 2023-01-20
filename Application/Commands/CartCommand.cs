using AutoMapper;
using Poseidon.Domain;
namespace Poseidon.Application.Commands;

public class CartCommand : IUpsertCommand<Cart>
{ 
    public int?            CartId             { get; set; }
    public decimal?        DiscountAmount     { get; set; }
    public bool?            IsActive           { get; set; }
    public bool?           LockedOnCheckout   { get; set; }
    public decimal?        TaxAmount          { get; set; }
    public decimal?        Total              { get; set; }
    public int?             UserId             { get; set; }

    public void Mapping(Profile profile)
    {
         profile.CreateMap<CartCommand, Cart>().MapOnlyIfChanged();
    }
} 



