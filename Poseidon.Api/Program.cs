using Poseidon.Api.Extensions;
using Serilog;

Log.Logger = new LoggerConfiguration()
    .WriteTo.Console()
    .CreateBootstrapLogger();

Log.Information("Starting application");

try
{
    var builder = WebApplication.CreateBuilder(args);

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


