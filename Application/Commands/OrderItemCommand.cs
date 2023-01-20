using AutoMapper;
using Poseidon.Domain;
namespace Poseidon.Application.Commands;

public class OrderItemCommand : IUpsertCommand<OrderItem>
{ 
    public int?            OrderItemId      { get; set; }
    public decimal?         DiscountAmount   { get; set; }
    public int?             OrderId          { get; set; }
    public int?             ProductId        { get; set; }
    public decimal?         ProductPrice     { get; set; }
    public decimal?         Quantity         { get; set; }
    public decimal?         TaxAmount        { get; set; }

    public void Mapping(Profile profile)
    {
         profile.CreateMap<OrderItemCommand, OrderItem>().MapOnlyIfChanged();
    }
} 



