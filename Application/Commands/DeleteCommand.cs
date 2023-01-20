namespace Poseidon.Application.Commands;

public class DeleteCommand<T> : IDeleteCommand<T> where T : class, new()
{
    public int Id { get; init; }
}
