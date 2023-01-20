using Gridify.EntityFramework;
using MediatR;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using Poseidon.Application.Commands;
using Poseidon.Application.Dto;
using Poseidon.Common;

namespace Poseidon.Application.CommandHandlers;

public class OrderItemDetailsCommandHandler : IRequestHandler<QueryCommand<OrderItemDetailsDto>, ResponseData<OrderItemDetailsDto>>
    {
        private readonly IPoseidonDbContext _context;
        private readonly ILogger<OrderItemDetailsCommandHandler> _logger;

        public OrderItemDetailsCommandHandler(IPoseidonDbContext context
                                                 , ILogger<OrderItemDetailsCommandHandler> logger)
        {
            _context = context;
            _logger = logger;
        }

        public async Task<ResponseData<OrderItemDetailsDto>> Handle(QueryCommand<OrderItemDetailsDto> request, CancellationToken cancellationToken)
        {
            _logger.Info(string.Format("Getting OrderItem page number {0} page size {1} orderby {2} filter {3}", request.Page, request.PageSize, request.OrderBy, request.Filter));

            var (count, query) = await _context.OrderItem
                                .Include(i => i.Product)
                                .AsNoTracking() 
                                .Select(s => new OrderItemDetailsDto
                                {
                                          OrderItemId        = s.OrderItemId
                                        , DiscountAmount     = s.DiscountAmount  
                                        , OrderId            = s.OrderId         
                                        , ProductId          = s.ProductId       
                                        , ProductPrice       = s.ProductPrice    
                                        , Quantity           = s.Quantity        
                                        , TaxAmount          = s.TaxAmount       
                                        , Sys_CreatedAt      = s.Sys_CreatedAt   
                                        , Sys_CreatedBy      = s.Sys_CreatedBy   
                                        , Sys_UpdatedAt      = s.Sys_UpdatedAt   
                                        , Sys_UpdatedBy      = s.Sys_UpdatedBy    
                                        , ProductName        = s.Product.Name 
                                        , Total              = s.ProductPrice + s.TaxAmount - s.DiscountAmount


                                })
                                .GridifyQueryableAsync(request, null);
            return await query.ResponseDataAsync(count, request.Page, request.PageSize);
        }
    }
