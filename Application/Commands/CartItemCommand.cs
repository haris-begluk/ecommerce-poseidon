using AutoMapper;
using MediatR;
using Poseidon.Domain;
namespace Poseidon.Application.Commands;

public class CartItemCommand : IRequest<Response>
{ 
    public int?            CartItemId       { get; set; }
    public int?             CartId           { get; set; }
    public decimal?        DiscountAmount   { get; set; }
    public string?         ImageUrl         { get; set; }
    public decimal?        Price            { get; set; }
    public int?             ProductId        { get; set; }
    public decimal?        Quantity         { get; set; }
    public decimal?        TaxAmount        { get; set; }
    public string?         Title            { get; set; }
    public string?         Unit             { get; set; }

    public void Mapping(Profile profile)
    {
         profile.CreateMap<CartItemCommand, CartItem>().MapOnlyIfChanged();
    }
} 



