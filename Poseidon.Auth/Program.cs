using Poseidon.Auth.Extensions;
using Serilog;
using System.Net;
using static Poseidon.Auth.Extensions.CertificateExtension;

Log.Logger = new LoggerConfiguration()
    .WriteTo.Console()
    .CreateBootstrapLogger();

Log.Information("Starting up");

try
{
    var builder = WebApplication.CreateBuilder(args); 

    var certificates  = await builder.GetCertificatesAsync(Log.Logger);
    
    builder.Services.AddEndpointsApiExplorer();
    builder.Services.AddSwaggerGen();
#if DEBUG
    ServicePointManager.ServerCertificateValidationCallback
    += (sender, cert, chain, sslPolicyErrors) => true;
#endif
    var app = builder
        .ConfigureServices(certificates)
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

