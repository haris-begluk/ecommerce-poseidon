using AutoMapper;
using AutoMapper.QueryableExtensions;
using Gridify.EntityFramework;
using MediatR;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using Poseidon.Common;

namespace Poseidon.Application.CommandHandlers
{

    public class QueryDataHandler<TEntity, TQuery, TResponse> : IRequestHandler<TQuery, ResponseData<TResponse>>
        where TEntity : class, new()
        where TQuery : class, IQueryCommand<TResponse>
        where TResponse: class
    {
        private readonly IPoseidonDbContext                       _context;
        private readonly IMapper                                  _mapper;
        private readonly ILogger<QueryDataHandler<TEntity, TQuery, TResponse>> _logger;
    
        public QueryDataHandler(
              IPoseidonDbContext context
            , IMapper mapper 
            , ILogger<QueryDataHandler<TEntity, TQuery, TResponse>> logger
            )
        {
            _context = context;
            _mapper = mapper; 
            _logger = logger;
        }
    
        public async Task<ResponseData<TResponse>> Handle(TQuery request, CancellationToken cancellationToken)
        {
            _logger.Info($"Executing query {typeof(TEntity).Name} page => {request.Page} page size => {request.PageSize} orderBy => {request.OrderBy ?? "<NULL>" } filter => {request.Filter ?? "<NULL>" }");
            
            var result = await _context.Set<TEntity>()
                .AsNoTracking()
                .ProjectTo<TResponse>(_mapper.ConfigurationProvider)
                .GridifyQueryableAsync(request, null);
            
            return await result.Query.ResponseDataAsync(
                    result.Count
              ,     request.Page
              ,     request.PageSize
              );
        }
    }
}