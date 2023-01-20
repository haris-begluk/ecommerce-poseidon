using Gridify;
using MediatR;

namespace Poseidon.Application;
public interface IQueryCommand<TResponse> : IGridifyQuery, IRequest<ResponseData<TResponse>> where TResponse : class
{}