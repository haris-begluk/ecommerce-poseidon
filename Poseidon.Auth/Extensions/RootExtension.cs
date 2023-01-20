using Duende.IdentityServer.Configuration;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
using Microsoft.OpenApi.Models;
using Poseidon.Auth.Endpoints;
using Poseidon.Auth.Services;
using Serilog;
using System.Reflection;

namespace Poseidon.Auth.Extensions;

internal static class RootExtensions
{
    public static WebApplication ConfigureServices(this WebApplicationBuilder builder)
    {
        string connectionString = builder.Configuration.GetConnectionString("MainDB")!;

        string issuerUrl        = builder.Configuration.GetSection("Auth:BaseUrl").Value;

        if (string.IsNullOrWhiteSpace(issuerUrl))
        {
            throw new ArgumentNullException("Main DB connection string can not be null or empty");
        }
        if (string.IsNullOrWhiteSpace(issuerUrl))
        {
            throw new ArgumentNullException("Auth:BaseUrl can not be null or empty");
        }

        var migrationsAssembly  = typeof(Program)
            .GetTypeInfo()
            .Assembly
            .GetName()
            .Name;

        builder.Services.AddRazorPages();
        builder.Services.AddEndpointsApiExplorer();

        builder.AddLogging();

        builder.Services.AddDbContext<PoseidonAuthDbContext>(options =>
            options.UseSqlServer(connectionString));

        builder.Services.AddIdentity<ApplicationUser, IdentityRole>()
            .AddEntityFrameworkStores<PoseidonAuthDbContext>()
            .AddDefaultTokenProviders();
       
        var identityBuilder = builder.Services
        .AddIdentityServer(options =>
        {
            options.Events.RaiseErrorEvents       = true;
            options.Events.RaiseInformationEvents = true;
            options.Events.RaiseFailureEvents     = true;
            options.Events.RaiseSuccessEvents     = true;
            options.UserInteraction.LoginUrl      = "/Account/Login";
            options.UserInteraction.LogoutUrl     = "/Account/Logout";
            // "http://host.docker.internal:5000"
            // Check this link: https://stackoverflow.com/questions/68913012/system-net-http-httprequestexception-cannot-assign-requested-address-error-wh
            options.IssuerUri  = builder.Environment.IsStaging()
                ? "http://host.docker.internal:5000" // "http://poseidon.auth" 
                : issuerUrl;

            options.EmitStaticAudienceClaim       = true;
            // This cause and exception System.Security.Cryptography.CryptographicException:
            // 'The payload was invalid. For more information go to http://aka.ms/dataprotectionwarning
            options.KeyManagement.Enabled = false;
            options.Authentication                = new AuthenticationOptions()
            {
                CookieLifetime                    = TimeSpan.FromHours(10), // ID server cookie timeout set to 10 hours
                CookieSlidingExpiration           = true
            };
        })
        .AddAspNetIdentity<ApplicationUser>()
        .AddProfileService<CustomProfileService>();

        identityBuilder.AddConfigurationStore(options =>
        {
            options.ConfigureDbContext = builder =>
                builder.UseSqlServer(connectionString,
                options => options.MigrationsAssembly(migrationsAssembly));
        });

        identityBuilder.AddOperationalStore(options =>
        {
            options.ConfigureDbContext = builder =>
                builder.UseSqlServer(connectionString,
                options => options.MigrationsAssembly(migrationsAssembly));
        }); 

        //TODO: Remove this line if app is deployed to production.
        identityBuilder.AddDeveloperSigningCredential();

        builder.AddAuth();
        builder.AddSwagger();


        
        return builder.Build();
    }

    public static WebApplication ConfigurePipeline(this WebApplication app)
    {
        if (app.Environment.IsDevelopment() || app.Environment.IsStaging())
        {
            
            Log.Information("Seeding database...");
            app.MigrateWithData();
            Log.Information("Done seeding database. Exiting."); 

            //This is needed when testing flutter apps using http 
            app.UseCookiePolicy(new CookiePolicyOptions()
            {
                MinimumSameSitePolicy = SameSiteMode.Lax
            });

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
            app.UseDeveloperExceptionPage();

        }
        //To avoid an issues  when testing flutter apps http 
        if (!app.Environment.IsDevelopment() && !app.Environment.IsStaging())
        {
            app.UseHttpsRedirection();
        }

        app.UseStaticFiles();
        app.UseRouting();

        app.UseCors(
          options =>
          options
          .WithOrigins("*")
          .AllowAnyMethod()
          .AllowAnyHeader()
        );

        app.UseIdentityServer();
        app.UseAuthorization();

        app.MappEndpoints();

        app.MapRazorPages();

        return app;
    }


    public static WebApplicationBuilder AddSwagger(this WebApplicationBuilder builder)
    {
        var authBaseUrl = builder.Configuration.GetSection("Auth:BaseUrl").Value;

        if (string.IsNullOrWhiteSpace(authBaseUrl))
        {
            throw new ArgumentNullException("Auth:BaseUrl can not be null or empty");
        }

        builder.Services.AddSwaggerGen(options =>
        {
            options.AddServer(new OpenApiServer
            {
                Url = authBaseUrl
                ,
                Description = "Poseidon admin server"
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

        builder.Services.AddAuthentication()
            .AddJwtBearer(JwtBearerDefaults.AuthenticationScheme, options =>
            {
                options.Authority = authBaseUrl;
                // Our API app will call to the IdentityServer to get the authority
                options.TokenValidationParameters = new TokenValidationParameters()
                {
                    ValidateAudience = false,
                    ValidateIssuer   = false,
                };

                //TODO: Remove this line when app is deployed 
                options.RequireHttpsMetadata = false;
            });

        builder.Services.AddAuthorization(options =>
        {
            options.AddPolicy("ApiScope", policy =>
            {
                policy.AuthenticationSchemes.Add(JwtBearerDefaults.AuthenticationScheme);
                policy.RequireAuthenticatedUser();
                policy.RequireClaim("scope", "poseidon-admin");
            });
        });
        return builder;
    }
}
