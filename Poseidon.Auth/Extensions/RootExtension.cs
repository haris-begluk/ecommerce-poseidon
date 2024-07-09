using Azure.Identity;
using Duende.IdentityServer.Configuration;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.DataProtection;
using Microsoft.AspNetCore.DataProtection.AuthenticatedEncryption;
using Microsoft.AspNetCore.DataProtection.AuthenticatedEncryption.ConfigurationModel;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Logging;
using Microsoft.IdentityModel.Tokens;
using Microsoft.OpenApi.Models;
using Poseidon.Auth.Endpoints;
using Poseidon.Auth.Services;
using Serilog;
using System.Reflection;
using System.Security.Authentication;
using System.Security.Cryptography.X509Certificates;
namespace Poseidon.Auth.Extensions;

internal static class RootExtensions
{
    public static WebApplication ConfigureServices(this WebApplicationBuilder builder
        , (X509Certificate2 PrimaryCert, X509Certificate2[] ExpiredCerts) certificates)
    {
        string connectionString = builder.Configuration.GetConnectionString("MainDB")!;

        string issuerUrl        = builder.Configuration.GetSection("Auth:BaseUrl").Value!;

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

        builder.Services.AddDbContext<ProtectionContext>(options =>
            options.UseSqlServer(connectionString));

        builder.Services.AddDataProtection()
            .PersistKeysToDbContext<ProtectionContext>();

        builder.Services.AddIdentity<ApplicationUser, IdentityRole>()
            .AddEntityFrameworkStores<PoseidonAuthDbContext>()
            .AddDefaultTokenProviders();

        builder.Services.AddDistributedSqlServerCache(options =>
        {
            options.ConnectionString = connectionString;
            options.SchemaName = "dbo";
            options.TableName = "DistributedCache";
            options.ExpiredItemsDeletionInterval = TimeSpan.FromMinutes(5);
            options.DefaultSlidingExpiration = TimeSpan.FromMinutes(3);
        });

        // configures the OpenIdConnect handlers to persist the state parameter into the server-side IDistributedCache.
        builder.Services.AddOidcStateDataFormatterCache();

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
            options.IssuerUri  = builder.Environment.IsStaging() //Staging env is docker env
                ? "https://host.docker.internal:5000" // "http://poseidon.auth" 
                : issuerUrl;

            options.EmitStaticAudienceClaim       = true;
            // This cause and exception System.Security.Cryptography.CryptographicException:
            // 'The payload was invalid. For more information go to http://aka.ms/dataprotectionwarning
            options.KeyManagement.Enabled = false;
            options.Authentication                = new AuthenticationOptions()
            {
                CookieLifetime                    = TimeSpan.FromHours(1), 
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
            options.EnableTokenCleanup = true;
            options.RemoveConsumedTokens = true;
            options.TokenCleanupInterval = 10;
            options.TokenCleanupBatchSize = 100; 
            options.FuzzTokenCleanupStart = true;

        });

#if DEBUG  
        identityBuilder.AddDeveloperSigningCredential();
#else
        identityBuilder.AddSigningCredential(certificates.PrimaryCert);
#endif  
        builder.AddAuth(certificates.PrimaryCert);
        builder.AddSwagger();
        builder.AddDataProtection(certificates);
        
        return builder.Build();
    }

    public static WebApplication ConfigurePipeline(this WebApplication app)
    {
        if (app.Environment.IsDevelopment() || app.Environment.IsStaging())
        {
            IdentityModelEventSource.ShowPII = true;

            Log.Information("Seeding database...");
            app.MigrateWithData();
            Log.Information("Done seeding database. Exiting."); 

            app.UseDeveloperExceptionPage();
        } 

        app.UseHsts();

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
            options.InjectStylesheet("/Swagger/Theme/SwaggerDark.css");
        });

        app.UseHttpsRedirection();

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
    public static WebApplicationBuilder AddAuth(this WebApplicationBuilder builder, X509Certificate2 certificate)
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
                    IssuerSigningKey = new X509SecurityKey(certificate)
                };

                //TODO: Remove this line when app is deployed 
                options.RequireHttpsMetadata = true;
                options.BackchannelHttpHandler = GetHandler();

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
    public static WebApplicationBuilder AddDataProtection(
           this WebApplicationBuilder builder
        , (X509Certificate2 PrimaryCert, X509Certificate2[] ExpiredCerts) certificates)
    {
        bool protectWihtWithCertificate    = builder.Configuration.GetValue<bool>("DataProtection:ProtectWithCertificate");
        bool disableAutomaticKeyGeneration = builder.Configuration.GetValue<bool>("DataProtection:DisableAutomaticKeyGeneration");
        string? secretKeyVaultUrl          = null;
        int dataProtectionKeyLifetimeDays  = 90;

        if (!protectWihtWithCertificate)
        {
            secretKeyVaultUrl = builder.Configuration.GetValue<string>("DataProtection:SecretKeyVaultUrl");

            if (string.IsNullOrWhiteSpace(secretKeyVaultUrl))
            {
                throw new Exception("Key vault url is null");
            }
            dataProtectionKeyLifetimeDays = builder.Configuration.GetValue<int?>("DataProtection:DataProtectionKeyLifetimeDays")
                ?? 90;
        }
        

        IDataProtectionBuilder dataProtectionBuilder = builder.Services.AddDataProtection()
          .SetApplicationName(AppDomain.CurrentDomain.FriendlyName)
          .SetDefaultKeyLifetime(TimeSpan.FromDays(dataProtectionKeyLifetimeDays))
          .UseCryptographicAlgorithms(
                new AuthenticatedEncryptorConfiguration
                {
                    EncryptionAlgorithm = EncryptionAlgorithm.AES_256_CBC,
                    ValidationAlgorithm = ValidationAlgorithm.HMACSHA256
                });

        if (disableAutomaticKeyGeneration)
        {
            dataProtectionBuilder.DisableAutomaticKeyGeneration();
        }

        if (protectWihtWithCertificate)
        {
            dataProtectionBuilder.ProtectKeysWithCertificate(certificates.PrimaryCert);
        }
        else
        {
            //If we use this option we are not able to unprotect the dp keys 
            //when we rotate key vault secret, more on this issue on this link 
            //https://github.com/dotnet/aspnetcore/issues/46310
            dataProtectionBuilder.ProtectKeysWithAzureKeyVault(
                new Uri(secretKeyVaultUrl!),
                new DefaultAzureCredential());
        }
        dataProtectionBuilder.PersistKeysToDbContext<ProtectionContext>();

        if(certificates.ExpiredCerts.Length > 0)
        {
            dataProtectionBuilder.UnprotectKeysWithAnyCertificate(certificates.ExpiredCerts);
        }

        return builder;
    }
    private static HttpClientHandler GetHandler()
    => new()
    {
        ClientCertificateOptions = ClientCertificateOption.Manual,
        SslProtocols = SslProtocols.Tls12,
        ServerCertificateCustomValidationCallback = (message, cert, chain, errors) => true
    };
}
