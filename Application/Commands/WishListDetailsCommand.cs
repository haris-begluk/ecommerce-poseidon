
namespace Poseidon.Application.Commands;

using MediatR;

public partial class WishListDetailsQueryCommand<TResponse> : IRequest<ResponseData<TResponse>> 
    where TResponse : class
{
    public int? UserId { get; set; }
}