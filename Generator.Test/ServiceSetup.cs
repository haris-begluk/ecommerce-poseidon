using System;
using System.IO;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Logging;
using Microsoft.EntityFrameworkCore;

#if AUTH
using Microsoft.AspNetCore.Identity;
using Poseidon.Auth.Entities;
#endif

namespace Generator.Test
{
    public static class ServiceSetup
    {
        public static IConfiguration ConfigureServices(IServiceCollection services)
        {
            var configuration = new ConfigurationBuilder()
                .SetBasePath(Directory.GetCurrentDirectory())
                .AddJsonFile("appsettings.json", true, true)
                .AddUserSecrets<Runner>(optional: true)
                .AddEnvironmentVariables()
                .Build();

            // initialize root paths and connection string from configuration
            Root.Initialize(configuration);

            var connectionString = configuration.GetConnectionString("Auth") ?? "Data Source=localhost;Initial Catalog=Poseidon-Auth;Integrated Security=True";

            services.AddLogging(builder =>
            {
                builder.AddConsole();
                builder.AddDebug();

            });
#if AUTH
            services.AddDbContext<PoseidonAuthDbContext>(options =>
                     options.UseSqlServer(connectionString));

            services.AddIdentity<ApplicationUser, IdentityRole>()
                .AddEntityFrameworkStores<PoseidonAuthDbContext>()
                .AddDefaultTokenProviders();

            var identityBuilder = services
            .AddIdentityServer(options =>
            {
                options.Events.RaiseErrorEvents = true;
                options.Events.RaiseInformationEvents = true;
                options.Events.RaiseFailureEvents = true;
                options.Events.RaiseSuccessEvents = true;
                options.UserInteraction.LoginUrl = "/Account/Login";
                options.UserInteraction.LogoutUrl = "/Account/Logout";
                options.IssuerUri = "";
                options.EmitStaticAudienceClaim = true;
            })
            .AddAspNetIdentity<ApplicationUser>();

            identityBuilder.AddConfigurationStore(options =>
            {
                options.ConfigureDbContext = builder =>
                    builder.UseSqlServer(connectionString);
            });

            identityBuilder.AddOperationalStore(options =>
            {
                options.ConfigureDbContext = builder =>
                    builder.UseSqlServer(connectionString);
            }); 
#endif
            services.AddTransient<Runner>();
            services.AddSingleton<IConfiguration>(configuration);

            return configuration;
        }
    }
}
