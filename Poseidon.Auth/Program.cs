using Poseidon.Auth.Extensions;
using Serilog;

Log.Logger = new LoggerConfiguration()
    .WriteTo.Console()
    .CreateBootstrapLogger();

Log.Information("Starting up");


try
{
    var builder = WebApplication.CreateBuilder(args);

    builder.Services.AddEndpointsApiExplorer();
    builder.Services.AddSwaggerGen();

    var app = builder
        .ConfigureServices()
        .ConfigurePipeline();

       app.Run();

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

