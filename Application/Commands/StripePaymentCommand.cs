using MediatR;
using Poseidon.Application.Dto;
using Poseidon.Enums;
namespace Poseidon.Application.Commands;
public class StripePaymentCommand : IRequest<(string response, Status status)>
{
    public int OrderId { get; set; }
    public int CardId { get; set; }
    public int DeliveryId { get; set; }

}