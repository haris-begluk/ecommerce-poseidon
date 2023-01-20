using Application.Common.Exceptions;
using Poseidon.Api.Exceptions;
using Poseidon.Common;
using System.Text.Json;

namespace Poseidon.Api.Extensions;

public class GlobalExceptionMid
{
    private readonly RequestDelegate                    _next;
    private readonly ILogger<GlobalExceptionMid>        _logger;
    private const string CorrelationIdHeaderKey         = "X-Correlation-ID";

    public GlobalExceptionMid(RequestDelegate next, ILogger<GlobalExceptionMid> logger)
    {
        _next   = next  ;
        _logger = logger;
    }

    public async Task Invoke(HttpContext context)
    {
        try
        {
            await _next(context);
        }
        catch (Exception error)
        {
            _logger.Error(error, $"Global exception handler caught exception {error.GetType()}");
            
            var response = context.Response;
            
            response.ContentType = "application/json";

            response.StatusCode = error switch
            {
                PoseidonException    => 400,
                KeyNotFoundException => 404,
                                   _ => 500
            };
            context.Response.Headers.TryGetValue(CorrelationIdHeaderKey, out var correlationIds);
            
            var correlationId = correlationIds.FirstOrDefault() 
                ?? "Not Found";

            var result = JsonSerializer.Serialize( 
                new ErrorResponse
                { 
                    Message      = error?.Message, 
                    InnerMessage = error?.InnerException?.Message,
                    CorelationId = correlationId

                });
            
            await response.WriteAsync(result);
        }
    }
}
