using MediatR;
using Poseidon.Application.Dto;
namespace Poseidon.Application.Commands;
public class CartDetailsCommand : IRequest<ResponseData<CartDetailsDto>> { }