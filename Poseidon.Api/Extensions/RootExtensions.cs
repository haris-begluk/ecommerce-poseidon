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
using Poseidon.Persistence;
using Poseidon.Services;
using Serilog;
using Serilog.Sinks.Datadog.Logs;
using Serilog.Sinks.SystemConsole.Themes;
using Stripe;
using System.Net;

public static class RootExtensions
{
    public static WebApplicationBuilder ConfigureServices(this WebApplicationBuilder builder)
    {

        builder.Services.AddEndpointsApiExplorer();
        builder.Logging.ClearProviders();

        builder.AddLogging();

        builder.Services.AddScoped<ICurrentUserService, CurrentUserService>();
        builder.Services.AddScoped<IDateTimeOffset, DateTimeOffset>();
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
    public static WebApplication ConfigurePipeline(this WebApplication app)
    {
        if (app.Environment.IsDevelopment() || app.Environment.IsStaging())
        {
            Log.Information("Executing migration database...");
            app.ExecuteMigrationAndSeed();
            Log.Information("Migration execution done."); 

        }
        StripeConfiguration.ApiKey = app.Configuration.GetSection("Stripe:ApiKey").Value;
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

        //To avoid an issues  when testing flutter apps http 
        if (!app.Environment.IsDevelopment() && !app.Environment.IsStaging())
        {
            app.UseHttpsRedirection();
        }

        app.UseAuthentication();
        app.UseAuthorization();
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
                ?   "http://poseidon.auth" 
                :   authBaseUrl; 
               
                options.TokenValidationParameters = new TokenValidationParameters()
                {
                    ValidateAudience = false,
                };
                //TODO: Remove this line if app is deployed
                //Allows usage of http auth url 
                options.RequireHttpsMetadata = false;
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
    public static void ExecuteMigrationAndSeed(this WebApplication app)
    {
        using (var scope = app.Services.GetRequiredService<IServiceScopeFactory>().CreateScope())
        {
            var context = scope
                .ServiceProvider
                .GetService<PoseidonDbContext>()
                ;

            var logger = scope
                .ServiceProvider
                .GetService<ILogger<SampleDataSeeder>>()
                !;

            context!.Database.Migrate();

            var seeder = new SampleDataSeeder(context, logger);

             seeder.SeedAllAsync()
                .GetAwaiter()
                .GetResult();

        }
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


#if DEBUG  
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
        
#endif
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
