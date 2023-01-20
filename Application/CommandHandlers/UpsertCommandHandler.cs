using AutoMapper;
using MediatR;
using Microsoft.Extensions.Logging;
using Poseidon.Common;
using Poseidon.Enums;

namespace Poseidon.Application.CommandHandlers
{
    public partial class UpsertCommandHandler<TEntity, TCommand>
        : IRequestHandler<TCommand, Response> where TEntity 
        : class, new() where TCommand 
        : class, IUpsertCommand<TEntity>, new()
    {
        private readonly IPoseidonDbContext _context;
        private readonly ILogger<UpsertCommandHandler<TEntity, TCommand>> _logger;
        private readonly IMapper _mapper;

        public UpsertCommandHandler(
            IPoseidonDbContext context
          , ILogger<UpsertCommandHandler<TEntity, TCommand>> logger
          , IMapper mapper
          )
        {
            _context = context;
            _logger = logger;
            _mapper = mapper;
        }

        public async Task<Response> Handle(TCommand request, CancellationToken cancellationToken)
        {
            Status status;

            TEntity? entity = _mapper.Map<TCommand, TEntity>(request);

            string IdName = $"{entity!.GetType().Name}Id";

            var Id = entity
                !.GetType()
                !.GetProperty(IdName)
                !.GetValue(entity, null);

            if (Id is not null && (int)Id! > 0)
            {
                entity = _context.Set<TEntity>().Find(Id);

                if (entity is null)
                {
                    return new(Convert.ToInt32(Id), Status.NotFound);
                }

                _mapper.Map(request, entity);

                status = Status.Updated;
            }
            else
            {
                if ((int)Id! < 1)
                {
                    _logger.Warning($"Command Id => {Id} is not valid, data will be saved");

                    entity!.GetType()
                          !.GetProperty(IdName)
                          !.SetValue(entity, null);
                }
                _context.Set<TEntity>().Add(entity);

                status = Status.Created;
            }

            await _context.SaveChangesAsync(cancellationToken);

            var entityId = entity
                !.GetType()
                !.GetProperty(IdName)
                !.GetValue(entity, null);

            return new(Convert.ToInt32(entityId), status);
        }
    }
}