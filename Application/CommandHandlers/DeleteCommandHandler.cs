using MediatR;
using Microsoft.Extensions.Logging;
using Poseidon.Common;
using Poseidon.Enums;
using static Poseidon.Application.CommandHandlers.PostMethods;
namespace Poseidon.Application.CommandHandlers
{
    public class DeleteCommandHandler<TEntity, TCommand> : IRequestHandler<TCommand, Response>
        where TEntity : class, new()
        where TCommand : class, IDeleteCommand<TEntity>, new()
    {
        private readonly IPoseidonDbContext _context;
        private readonly ILogger<DeleteCommandHandler<TEntity, TCommand>> _logger;
    
        public DeleteCommandHandler(
              IPoseidonDbContext context
            , ILogger<DeleteCommandHandler<TEntity, TCommand>> logger
            )
        {
            _context = context;
            _logger  = logger;
        }
    
        public async Task<Response> Handle(TCommand request, CancellationToken cancellationToken)
        {
            var entity = _context.Set<TEntity>().Find(request.Id);
    
            if (entity is null)
            {
                _logger.Warning($"{typeof(TEntity).Name} entity for id => {request.Id} not found");
    
                return new (request.Id, Status.NotFound);
            }
            _context.Set<TEntity>().Remove(entity);
    
            await _context.SaveChangesAsync(cancellationToken);

            _logger.Info($"{typeof(TEntity).Name} entity for id => {request.Id} deleted");

            //This is done because of need to recalculate cart values after item is removed
            if (entity.GetType().Name == "CartItem")
            {
                await PostCartItemRecalculate(
                  _logger
                , _context
                , request.Id);
            }
           

            return new (request.Id , Status.Deleted);
        }
    }
}