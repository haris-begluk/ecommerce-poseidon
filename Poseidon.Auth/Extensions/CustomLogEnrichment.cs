
namespace Poseidon.Auth.Extensions;

public class CustomLogEnrichment
{
    private readonly RequestDelegate next;
    private readonly ILogger<CustomLogEnrichment> logger;

    public CustomLogEnrichment(RequestDelegate next, ILogger<CustomLogEnrichment> logger)
    {
        this.next = next;
        this.logger = logger;
    }

    public async Task Invoke(HttpContext context /* other dependencies */)
    {
            await next(context);
      
    }
}

