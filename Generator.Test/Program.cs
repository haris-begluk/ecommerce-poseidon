using Generator.Test;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Configuration;

string[] arguments = Environment.GetCommandLineArgs();

await ConfigureLoggingAsync(arguments);




static async Task ConfigureLoggingAsync(string[] args)
{
    var services = new ServiceCollection();
    ServiceSetup.ConfigureServices(services);
    var serviceProvider = services.BuildServiceProvider();
    await serviceProvider.GetService<Runner>().Run(args);

}
