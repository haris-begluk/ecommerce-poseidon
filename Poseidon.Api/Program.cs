using Microsoft.IdentityModel.Logging;
using Poseidon.Api.Extensions;
using Serilog;
using System.Net;

Log.Logger = new LoggerConfiguration()
    .WriteTo.Console()
    .CreateBootstrapLogger();

Log.Information("Starting application");

try
{
    var builder = WebApplication.CreateBuilder(args);
#if DEBUG 
    IdentityModelEventSource.ShowPII = true;
#endif
    var app = builder
            .ConfigureServices()
            .AddSwagger()
            .AddAuth()
            .Build();


    app.ConfigurePipeline() 
        .Run();
}
catch (Exception ex)
{
    Log.Fatal(ex, "Caught exception building Host");
}
finally
{
    Log.Information("Shut down complete");
    Log.CloseAndFlush();
}



