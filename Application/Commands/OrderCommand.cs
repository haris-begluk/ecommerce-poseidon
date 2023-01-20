using AutoMapper;
using Poseidon.Domain;
namespace Poseidon.Application.Commands;

public class OrderCommand : IUpsertCommand<Order>
{ 
    public int?            OrderId                 { get; set; }
    public int?            BillingAddressId        { get; set; }
    public int?            CartId                  { get; set; }
    public int?            DeliveryId              { get; set; }
    public string?         Description             { get; set; }
    public decimal?         OrderDiscountAmount     { get; set; }
    public string?          OrderStatus             { get; set; }
    public decimal?         OrderTaxAmount          { get; set; }
    public decimal?         OrderTotal              { get; set; }
    public bool?            PayedAndClosed          { get; set; }
    public decimal?         PaymentFeeAmount        { get; set; }
    public string?         PaymentMethod           { get; set; }
    public decimal?         ProductDiscountAmount   { get; set; }
    public decimal?         ProductTaxAmount        { get; set; }
    public int?            ShippingAddressId       { get; set; }
    public decimal?         ShippingFeeAmount       { get; set; }
    public string?         ShippingMethod          { get; set; }
    public decimal?         SubTotal                { get; set; }
    public int?             UserId                  { get; set; }

    public void Mapping(Profile profile)
    {
         profile.CreateMap<OrderCommand, Order>().MapOnlyIfChanged();
    }
} 



