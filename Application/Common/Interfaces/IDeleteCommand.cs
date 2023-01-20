using MediatR;
namespace Poseidon.Application;

public interface IDeleteCommand<TEntity> : IRequest<Response> where TEntity : class, new()
{
    int Id { get; init; }
}
