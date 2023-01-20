using Application;
using MediatR;
namespace Poseidon.Application;

public interface IUpsertCommand<T> : IRequest<Response> where T : class, new()
{
}
public interface ICustomUpsertCommand<T> : IRequest<Response> where T : class, new()
{
}