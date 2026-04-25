namespace Poseidon.Api.Extensions;
using FluentValidation.AspNetCore;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
using Microsoft.OpenApi.Models;
using Poseidon.Api.Services;
using Poseidon.Application;
using Poseidon.Application.DataSeed;
using Poseidon.Common;
using Poseidon.Endpoints;
using Poseidon.Infrastructure;
using Poseidon.Logs;
using Poseidon.Persistence;
using Poseidon.Services;
using Serilog;
using Serilog.Sinks.Datadog.Logs;
using Serilog.Sinks.SystemConsole.Themes;
using Stripe;
using System.Net;
using System.Security.Authentication;

public static class RootExtensions
{
    public static WebApplicationBuilder ConfigureServices(this WebApplicationBuilder builder)
    {
        Log.Information("Application is running in {0} environment", builder.Environment.EnvironmentName);

        builder.Services.AddEndpointsApiExplorer();

        builder.AddCustomLoggerWithTelemetryMetrics();

        //aspire
        builder.AddServiceDefaults();

        builder.Services.AddScoped<ICurrentUserService, CurrentUserService>();
        builder.Services.AddHttpContextAccessor();

        builder.Services.AddInfrastructure();
        builder.Services.AddPersistence(builder.Configuration);
        builder.Services.AddApplication();

        builder.Services.AddHealthChecks()
            .AddDbContextCheck<PoseidonDbContext>();

        builder.Services.AddControllers(); 
        builder.Services.AddFluentValidationAutoValidation();
            
        return builder;
    }
    public static async Task<WebApplication> ConfigurePipelineAsync(this WebApplication app)
    {
        if (app.Environment.IsDevelopment() || app.Environment.IsStaging())
        {
            Log.Information("Executing migration database...");
            await app.ExecuteMigrationAndSeedAsync();
            Log.Information("Migration execution done."); 

        }

        var stripeApiKey = app.Configuration.GetSection("Stripe:ApiKey").Value;
        if (string.IsNullOrWhiteSpace(stripeApiKey))
        {
            Log.Warning("Stripe:ApiKey is not configured. Payment features will be unavailable.");
        }
        StripeConfiguration.ApiKey = stripeApiKey;
        app.UseMiddleware<GlobalExceptionMid>();

        app.UseSwagger();
        app.UseSwaggerUI(options =>
        {
            options.OAuthUsePkce();
            options
            .ConfigObject
            .AdditionalItems["syntaxHighlight"] = new Dictionary<string, object>
            {
                ["activated"] = false
            };
        });

        app.UseHttpsRedirection();

        app.UseAuthentication();
        app.UseAuthorization();
        app.MapDefaultEndpoints();
        app.MappEndpoints();

        return app;
    }
    public static WebApplicationBuilder AddSwagger(this WebApplicationBuilder builder)
    {
        var authBaseUrl = builder.Configuration.GetSection("Auth:BaseUrl").Value;
        var appBaseUrl = builder.Configuration.GetSection("Poseidon:BaseUrl").Value;

        if (string.IsNullOrWhiteSpace(authBaseUrl))
        {
            throw new ArgumentNullException("Auth:BaseUrl can not be null or empty");
        }

        if (string.IsNullOrWhiteSpace(appBaseUrl))
        {
            throw new ArgumentNullException("Poseidon:BaseUrl can not be null or empty");
        }

        builder.Services.AddSwaggerGen(options =>
        {  
            options.EnableAnnotations();
            options.AddServer(new OpenApiServer
            {
                Url = appBaseUrl
                ,
                Description = "Poseidon main api server"
            });
            options.AddSecurityDefinition("oauth2", new OpenApiSecurityScheme
            {
                Type = SecuritySchemeType.OAuth2,
                Flows = new OpenApiOAuthFlows
                {
                    AuthorizationCode = new OpenApiOAuthFlow
                    {
                        AuthorizationUrl = new Uri($"{authBaseUrl}/connect/authorize"),
                        TokenUrl         = new Uri($"{authBaseUrl}/connect/token"),
                        Scopes = new Dictionary<string, string>
                        {
                            {"poseidon-api", "Poseidon Api"}
                        }
                    },
                }
            });
            options.AddSecurityRequirement(new OpenApiSecurityRequirement
            {
                {
                    new OpenApiSecurityScheme
                    {
                        Reference = new OpenApiReference
                        {
                            Type = ReferenceType.SecurityScheme
                            , Id = "oauth2"
                        }
                    },
                    new[] { "poseidon-api" }
                }
            });
            options.MapType<decimal>(
            () => new OpenApiSchema
            {
                Type = "number"
                ,
                Format = "decimal"
            });
        });
        return builder;
    }

    public static WebApplicationBuilder AddAuth(this WebApplicationBuilder builder)
    {
        var authBaseUrl = builder.Configuration.GetSection("Auth:BaseUrl").Value;

        if (string.IsNullOrWhiteSpace(authBaseUrl))
        {
            throw new ArgumentNullException("Auth:BaseUrl can not be null or empty");
        }
        builder.Services.AddAuthentication(JwtBearerDefaults.AuthenticationScheme)
            .AddJwtBearer(JwtBearerDefaults.AuthenticationScheme, options =>
            {
                // "http://host.docker.internal:5000"Docker container have a look inside docker-compos.yaml
                // Check this link: https://stackoverflow.com/questions/68913012/system-net-http-httprequestexception-cannot-assign-requested-address-error-wh
                options.Authority = 
                    builder.Environment.IsStaging()
                ?   "https://poseidon.auth:443" 
                :   authBaseUrl; 
               
                options.TokenValidationParameters = new TokenValidationParameters()
                {
                    ValidateAudience = false,
                };
                options.RequireHttpsMetadata = builder.Environment.IsProduction();
                options.BackchannelHttpHandler = GetHandler(
                    isDevelopmentOrStaging: builder.Environment.IsDevelopment() || builder.Environment.IsStaging());
            });

        builder.Services.AddAuthorization(options =>
        {
            options.AddPolicy("ApiScope", policy =>
            {
                policy.AuthenticationSchemes.Add(JwtBearerDefaults.AuthenticationScheme);
                policy.RequireAuthenticatedUser();
                policy.RequireClaim("scope", "poseidon-api");
            });
        });
        return builder;
    }
    public static async Task ExecuteMigrationAndSeedAsync(this WebApplication app)
    {
        await using var scope = app.Services.GetRequiredService<IServiceScopeFactory>()
            .CreateAsyncScope();

        var context = scope.ServiceProvider.GetRequiredService<PoseidonDbContext>();
        var logger  = scope.ServiceProvider.GetRequiredService<ILogger<SampleDataSeeder>>();

        await context.Database.MigrateAsync();

        var seeder = new SampleDataSeeder(context, logger);
        await seeder.SeedAllAsync();
    }
    private static HttpClientHandler GetHandler(bool isDevelopmentOrStaging)
    {
        var handler = new HttpClientHandler
        {
            ClientCertificateOptions = ClientCertificateOption.Manual,
            SslProtocols = SslProtocols.Tls12,
        };

        if (isDevelopmentOrStaging)
        {
            // Only bypass certificate validation in non-production environments
            handler.ServerCertificateCustomValidationCallback =
                (message, cert, chain, errors) => true;
        }

        return handler;
    }
}
public static partial class LoggerExtension
{
    public static void AddLogging(this WebApplicationBuilder builder)
    {
        var logConsoleAndSQl = builder.Configuration.GetSection("ConsoleAndSqlLogging").Get<bool>(); 
        var dataDogUrl       = builder.Configuration.GetSection("DataDog:Url"   ).Value; 
        var dataDogApiKey    = builder.Configuration.GetSection("DataDog:ApiKey").Value;
        var appName = AppDomain.CurrentDomain.FriendlyName;
        var env     = builder.Environment.EnvironmentName;
        var host    = Dns.GetHostName();


        var ddConfig = new DatadogConfiguration(
                url:   dataDogUrl
            ,   port:   443
            ,   useSSL: true
            );


        if (logConsoleAndSQl)
        {
            builder.Host.UseSerilog((ctx, lc) => lc
                .Enrich.WithProperty("ApplicationName", appName)
                .Enrich.WithMachineName()
                .Enrich.WithThreadId()
                .Enrich.WithCorrelationIdHeader()
                .Enrich.WithClientIp()
                .ReadFrom.Configuration(ctx.Configuration)
                .WriteTo.Console(outputTemplate:
                "[{Timestamp:HH:mm:ss} {Level}] {SourceContext}{NewLine}{Message:lj}{NewLine}{Exception}{NewLine}"
                , theme: AnsiConsoleTheme.Literate))
                ;
        }
        
        if (!string.IsNullOrWhiteSpace(dataDogApiKey))
        {
            builder.Host.UseSerilog((ctx, lc) => lc
            .Enrich.WithProperty("ApplicationName", appName)
            .Enrich.WithMachineName()
            .Enrich.WithThreadId()
            .Enrich.WithCorrelationIdHeader()
            .Enrich.WithClientIp()
            .WriteTo.DatadogLogs(
                      apiKey: dataDogApiKey
                    , source: appName
                    , service: appName
                    , host: host
                    , tags: new[]
                    {
                        $"Env:{env}"
                    }
                    , configuration: ddConfig));
        }
    }
}
