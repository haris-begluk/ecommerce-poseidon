using MediatR;
using Poseidon.Application.Dto;
namespace Poseidon.Application.Commands;
public class UserDetailsCommand : IRequest<ResponseData<UserDetailsDto>> { }
