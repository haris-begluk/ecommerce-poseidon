using MediatR;
using Poseidon.Application.Dto;
using Poseidon.Enums;
namespace Poseidon.Application.Commands;
public class OrderCheckoutCommand : IRequest<(OrderDto order, Status status)>
{
    public int CartId { get; set; }
    public int? DeliveryId { get; set; }
    public string? PaymentMethod { get; set; }

}


