using Microsoft.Extensions.DependencyInjection;
using Poseidon.Common;

namespace Poseidon.Infrastructure
{
    public static class DependencyInjection
    {
        public static IServiceCollection AddInfrastructure(this IServiceCollection services)
        {
            services.AddTransient<IDateTime, MachineDateTime>();
            services.AddTransient<IDateTimeOffset, MachineDateTimeOffset>();

            return services;
        }
    }
}