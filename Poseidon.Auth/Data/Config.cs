using Duende.IdentityServer;
using Duende.IdentityServer.EntityFramework.DbContexts;
using Duende.IdentityServer.EntityFramework.Mappers;
using Duende.IdentityServer.Models;
using IdentityModel;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using Serilog;
using System.Security.Claims;

namespace Poseidon.Auth
{
    public static class Config
    {
        public static IEnumerable<IdentityResource> IdentityResources =>
            new IdentityResource[]
            {
            new IdentityResources.OpenId(),
            new IdentityResources.Profile(),
            new IdentityResources.Email(),
            };

        public static IEnumerable<ApiScope> ApiScopes =>
            new ApiScope[]
            {
                new ApiScope("poseidon-api"),
                new ApiScope("poseidon-admin"),
            };
        public static IEnumerable<ApiResource> ApiResources =>
            new ApiResource[]
            {
                new ApiResource(
                      "poseidon-api"
                    , "Poseidon Api" )
                {
                    ApiSecrets =
                    {
                        new Secret("secret".Sha256())
                    }
                } ,
                new ApiResource(
                      "poseidon-admin"
                    , "Poseidon Admin" )
                {
                    ApiSecrets =
                    {
                        new Secret("secret".Sha256())
                    }
                }
            };
        public static IEnumerable<Client> Clients =>
            new Client[]
            {
                new Client
                {
                        ClientId                    = "postman",
                        ClientName                  = "Postman",
                        AllowedGrantTypes           = GrantTypes.Code,
                        AllowAccessTokensViaBrowser = true,
                        RedirectUris                = { "http://www.getpostman.com/oauth2/callback" },
                        PostLogoutRedirectUris      = { "http://www.getpostman.com" },
                        AllowedCorsOrigins          = { "http://www.getpostman.com" },
                        EnableLocalLogin            = true,
                        AllowedScopes               =
                        {
                            IdentityServerConstants.StandardScopes.OpenId,
                            IdentityServerConstants.StandardScopes.Profile,
                            "poseidon-api",
                            "poseidon-admin"
                        },
                        ClientSecrets =
                        {
                            new Secret("secret".Sha256())
                        },

                },
                new Client
                {
                    ClientId          = "postman-client",
                    ClientName        = "Client credentials",
                    AllowedGrantTypes = GrantTypes.ClientCredentials,
                    ClientSecrets     = new List<Secret>
                    {
                        new Secret("secret".Sha256())
                    },
                    AllowedScopes     = new List<string>
                    {
                        IdentityServerConstants.StandardScopes.OpenId,
                        IdentityServerConstants.StandardScopes.Profile,
                        IdentityServerConstants.StandardScopes.Email,
                        IdentityServerConstants.StandardScopes.OfflineAccess,
                        "poseidon-api",
                        "poseidon-admin",
                    }
                },
                new Client
                {
                    ClientId          = "m2m-client",
                    ClientName        = "Machine to machine client",
                    AllowedGrantTypes = GrantTypes.ClientCredentials,
                    ClientSecrets     = new List<Secret>
                    {
                        new Secret("00d86c28-9523-4261-8b31-e53a67c1396b".Sha256())
                    },
                    AllowedScopes     = new List<string>
                    {
                        IdentityServerConstants.StandardScopes.OpenId,
                        IdentityServerConstants.StandardScopes.Profile,
                        "poseidon-api",
                    }
                },
                new Client
                {
                        ClientId                    = "dev",
                        ClientName                  = "Swagger dev",
                        AllowedGrantTypes           = GrantTypes.Code,
                        AllowAccessTokensViaBrowser = true,
                        RequirePkce                 = true,
                        RequireClientSecret         = false,
                        RedirectUris                =
                        {
                              "https://localhost:5430/swagger/oauth2-redirect.html"
                            , "https://localhost:5533/swagger/oauth2-redirect.html"

                        },
                        PostLogoutRedirectUris      =
                        {
                              "https://localhost:5430/swagger"
                            , "https://localhost:5533/swagger"
                        },
                        AllowedCorsOrigins          =
                        {
                               "https://localhost:5430"
                            ,  "https://localhost:5533"

                        },
                        EnableLocalLogin            = true,
                        AllowedScopes               =
                        {
                              IdentityServerConstants.StandardScopes.OpenId
                            , IdentityServerConstants.StandardScopes.Profile
                            , IdentityServerConstants.StandardScopes.Email
                            , IdentityServerConstants.StandardScopes.OfflineAccess
                            , "poseidon-api"
                            , "poseidon-admin"
                        },
                        ClientSecrets =
                        {
                            new Secret("kestrel".Sha256())
                        },
                },
                new Client
                {
                        ClientId                    = "docker",
                        ClientName                  = "Swagger Docker",
                        AllowedGrantTypes           = GrantTypes.Code,
                        AllowAccessTokensViaBrowser = true,
                        RequirePkce                 = true,
                        RequireClientSecret         = false,
                        RedirectUris                =
                        {
                              "https://localhost:5430/swagger/oauth2-redirect.html"
                            , "https://localhost:5533/swagger/oauth2-redirect.html"

                        },
                        PostLogoutRedirectUris      =
                        {
                              "https://localhost:5430/swagger"
                            , "https://localhost:5533/swagger"
                        },
                        AllowedCorsOrigins          =
                        {
                               "https://localhost:5430"
                            ,  "https://localhost:5533"

                        },
                        EnableLocalLogin            = true,
                        AllowedScopes               =
                        {
                            IdentityServerConstants.StandardScopes.OpenId,
                            IdentityServerConstants.StandardScopes.Profile,
                            IdentityServerConstants.StandardScopes.Email,
                            IdentityServerConstants.StandardScopes.OfflineAccess,
                            "poseidon-api", 
                            "poseidon-admin"
                        },
                        ClientSecrets =
                        {
                            new Secret("docker".Sha256())
                        },
                },
                new Client
                {
                        ClientId                    = "user-client",
                        ClientName                  = "ResourceOwnerPasswordAndClientCredentials",
                        AllowedGrantTypes           = GrantTypes.ResourceOwnerPasswordAndClientCredentials,
                        AllowAccessTokensViaBrowser = true,
                        RequirePkce                 = true,
                        RequireClientSecret         = false,
                        RedirectUris                =
                        {
                              "https://localhost:5430/swagger/oauth2-redirect.html"
                            , "https://localhost:5533/swagger/oauth2-redirect.html"

                        },
                        PostLogoutRedirectUris      =
                        {
                              "https://localhost:5430/swagger"
                            , "https://localhost:5533/swagger"
                        },
                        AllowedCorsOrigins          =
                        {
                               "https://localhost:5430"
                            ,  "https://localhost:5533"

                        },
                        EnableLocalLogin            = true,
                        AllowedScopes               =
                        {
                            IdentityServerConstants.StandardScopes.OpenId,
                            IdentityServerConstants.StandardScopes.Profile,
                            IdentityServerConstants.StandardScopes.Email,
                            IdentityServerConstants.StandardScopes.OfflineAccess,
                            "poseidon-api",
                            "poseidon-admin"
                        },
                        ClientSecrets =
                        {
                            new Secret("docker".Sha256())
                        },
                },
                new Client
                {
                    ClientId            = "flutter-dev",
                    AllowedGrantTypes   = GrantTypes.Code,
                    RequirePkce         = true,
                    RequireClientSecret = false,

                    RedirectUris                =
                    {
                          "https://localhost:4000/" 
                    },
                    PostLogoutRedirectUris      =
                    {
                          "https://localhost:4000"
                    },
                    AllowedCorsOrigins          =
                    {
                           "https://localhost:4000"
                    },
                    AllowedScopes =
                    {
                        IdentityServerConstants.StandardScopes.OpenId,
                        IdentityServerConstants.StandardScopes.Profile,
                        IdentityServerConstants.StandardScopes.Email,
                        IdentityServerConstants.StandardScopes.OfflineAccess,
                        "poseidon-api",
                    },
                    AllowAccessTokensViaBrowser = true,
                    RequireConsent              = false,
                    ClientSecrets =
                    {
                        new Secret("secret".Sha256())
                    },
                },
                new Client
                {
                    ClientId            = "flutter-docker",
                    AllowedGrantTypes   = GrantTypes.Code,
                    RequirePkce         = true,
                    RequireClientSecret = false,

                    RedirectUris       =
                    {
                          "https://10.0.2.2/"
                        , "https://localhost:4000/"
                        , "https://10.0.2.2:4000/"
                    },
                    PostLogoutRedirectUris      =
                    {
                          "https://10.0.2.2/"
                        , "https://localhost:4000/"
                        , "https://10.0.2.2:4000/"
                    },
                    AllowedCorsOrigins =
                    {
                          "https://10.0.2.2"
                        , "https://localhost:4000"
                        , "https://10.0.2.2:4000"
                    },
                    AllowedScopes =
                    {
                        IdentityServerConstants.StandardScopes.OpenId,
                        IdentityServerConstants.StandardScopes.Profile,
                        IdentityServerConstants.StandardScopes.Email,
                        IdentityServerConstants.StandardScopes.OfflineAccess,
                        "poseidon-api",
                    },
                    AllowAccessTokensViaBrowser = true,
                    RequireConsent              = false,
                    ClientSecrets =
                    {
                        new Secret("secret".Sha256())
                    },
                },
                new Client 
                {  
                    ClientId            = "win-forms",
                    ClientName          = "windows forms",
                    AllowedGrantTypes   = GrantTypes.Code,
                    RequirePkce         = true,
                    RequireClientSecret = false,
                    AllowOfflineAccess  = true,
                    RedirectUris       = 
                    { 
                        "https://localhost/winforms.client" 
                    },
                    AllowedScopes = 
                    {
                        IdentityServerConstants.StandardScopes.OpenId,
                        IdentityServerConstants.StandardScopes.Profile,
                        IdentityServerConstants.StandardScopes.Email,
                        IdentityServerConstants.StandardScopes.OfflineAccess,
                        "poseidon-api",
                        "poseidon-admin",
                    },
                    AllowAccessTokensViaBrowser = true,
                    RequireConsent              = false, 
                    ClientSecrets =
                    {
                        new Secret("secret".Sha256())
                    },
                },

            };

        public static void SeedUsers(this WebApplication app)
        {
            using (var scope = app.Services.GetRequiredService<IServiceScopeFactory>().CreateScope())
            {
                var userMgr = scope
                    .ServiceProvider
                    .GetRequiredService<UserManager<ApplicationUser>>()
                    ;

                var alice = userMgr
                    .FindByNameAsync("alice")
                    .GetAwaiter()
                    .GetResult();

                if (alice is null)
                {
                    var email = "alice.smith@email.com";
                    alice = new ApplicationUser
                    { 
                        Id             = "3e481369-3e1d-458a-93bf-1b6855f13aed",
                        UserName       = "alice",
                        Email          = email,
                        EmailConfirmed = true,
                    };
                    var result = userMgr.CreateAsync(alice, "Pass123$").Result;
                    if (!result.Succeeded)
                    {
                        throw new Exception(result.Errors.First().Description);
                    }

                    result = userMgr.AddClaimsAsync(alice, new Claim[]{
                            new Claim(JwtClaimTypes.Name      , "Alice Smith"),
                            new Claim(JwtClaimTypes.GivenName , "Alice"),
                            new Claim(JwtClaimTypes.FamilyName, "Smith"),
                            new Claim(JwtClaimTypes.Email     , email),
                        }).Result;
                    if (!result.Succeeded)
                    {
                        throw new Exception(result.Errors.First().Description);
                    }
                }
                

                var bob = userMgr
                    .FindByNameAsync("bob")
                    .GetAwaiter()
                    .GetResult();

                if (bob is null)
                {
                    var email = "bob.smith@email.com";
                    bob = new ApplicationUser
                    { 
                        Id             = "fff9a883-0dab-44e8-b323-deebafd5bfaf",
                        UserName       = "bob",
                        Email          = email,
                        EmailConfirmed = true
                    };
                    var result = userMgr.CreateAsync(bob, "Pass123$").Result;
                    if (!result.Succeeded)
                    {
                        throw new Exception(result.Errors.First().Description);
                    }

                    result = userMgr.AddClaimsAsync(bob, new Claim[]{
                            new Claim(JwtClaimTypes.Name      , "Bob Smith"),
                            new Claim(JwtClaimTypes.GivenName , "Bob"),
                            new Claim(JwtClaimTypes.FamilyName, "Smith"),
                            new Claim(JwtClaimTypes.Email     , email)
                        }).Result;
                    if (!result.Succeeded)
                    {
                        throw new Exception(result.Errors.First().Description);
                    }
                }

                var mobile = userMgr
                    .FindByNameAsync("mobile")
                    .GetAwaiter()
                    .GetResult();

                if (mobile is null)
                {
                    var email = "mobile.user@email.com";
                    mobile = new ApplicationUser
                    {
                        Id = "3e484169-3e1d-458a-93bf-1b6855f13aed",
                        UserName = "mobile",
                        Email = email,
                        EmailConfirmed = true,
                    };
                    var result = userMgr.CreateAsync(mobile, "Pass123$").Result;
                    if (!result.Succeeded)
                    {
                        throw new Exception(result.Errors.First().Description);
                    }

                    result = userMgr.AddClaimsAsync(mobile, new Claim[]{
                            new Claim(JwtClaimTypes.Name      , "Mobile User"),
                            new Claim(JwtClaimTypes.GivenName , "Mobile"),
                            new Claim(JwtClaimTypes.FamilyName, "User"),
                            new Claim(JwtClaimTypes.Email     , email),
                        }).Result;
                    if (!result.Succeeded)
                    {
                        throw new Exception(result.Errors.First().Description);
                    }
                }


                var desktop = userMgr
                    .FindByNameAsync("desktop")
                    .GetAwaiter()
                    .GetResult(); 

                if (desktop is null)
                {
                    var email = "desktop.user@email.com";
                    desktop = new ApplicationUser
                    {
                        Id = "56c55d0b-a0ea-42c6-8eeb-a834e9e2dd5e",
                        UserName = "desktop",
                        Email = email,
                        EmailConfirmed = true,
                    };
                    var result = userMgr.CreateAsync(desktop, "Pass123$").Result;
                    if (!result.Succeeded)
                    {
                        throw new Exception(result.Errors.First().Description);
                    }

                    result = userMgr.AddClaimsAsync(desktop, new Claim[]{
                            new Claim(JwtClaimTypes.Name      , "Desktop User"),
                            new Claim(JwtClaimTypes.GivenName , "Desktop"),
                            new Claim(JwtClaimTypes.FamilyName, "User"),
                            new Claim(JwtClaimTypes.Email     , email),
                        }).Result;
                    if (!result.Succeeded)
                    {
                        throw new Exception(result.Errors.First().Description);
                    }
                }
            }
        }

        public static void MigrateWithData(this WebApplication app)
        {
            Log.Information("Start migrations...");

            Log.Information($"Migrating {nameof(PoseidonAuthDbContext)}");
            app.ExecuteMigrations<PoseidonAuthDbContext>();

            Log.Information($"Migrating {nameof(ConfigurationDbContext)}"); 
            app.ExecuteMigrations<ConfigurationDbContext>();

            Log.Information($"Migrating {nameof(PersistedGrantDbContext)}");
            app.ExecuteMigrations<PersistedGrantDbContext>();

            Log.Information($"Migrating {nameof(ProtectionContext)}");
            app.ExecuteMigrations<ProtectionContext>();

            Log.Information("Migrations finished...");

            Log.Information("Seeding test data...");
            app.SeedData();
            Log.Information("Done seeding database.");
        }



        public static void ExecuteMigrations<T>(this WebApplication app) where T : DbContext
        {
            using (var serviceScope = app
                .Services
                .GetRequiredService<IServiceScopeFactory>()
                .CreateScope())
            {
                var context = serviceScope.ServiceProvider.GetService<T>();
                context!.Database.Migrate();

            }
        }
        private static void SeedData(this WebApplication app)
        {
            using (var serviceScope = app
                .Services
                .GetRequiredService<IServiceScopeFactory>()
                .CreateScope())
            {
                var context = serviceScope.ServiceProvider.GetService<ConfigurationDbContext>();
                if (!context!.Clients.Any())
                {
                    Log.Information("Clients being populated");
                    foreach (var client in Clients)
                    {
                        context.Clients.Add(client.ToEntity());
                    }
                    context.SaveChanges();
                }
                else
                {
                    Log.Information("Clients already populated");
                }

                if (!context.IdentityResources.Any())
                {
                    Log.Information("IdentityResources being populated");
                    foreach (var resource in IdentityResources)
                    {
                        context.IdentityResources.Add(resource.ToEntity());
                    }
                    context.SaveChanges();
                }
                else
                {
                    Log.Information("IdentityResources already populated");
                }

                if (!context.ApiResources.Any())
                {
                    Log.Information("ApiResources being populated");
                    foreach (var resource in ApiResources)
                    {
                        context.ApiResources.Add(resource.ToEntity());
                    }
                    context.SaveChanges();
                }
                else
                {
                    Log.Information("ApiResources already populated");
                }
                if (!context.ApiScopes.Any())
                {
                    Log.Information("ApiScopes being populated");
                    foreach (var resource in ApiScopes)
                    {
                        context.ApiScopes.Add(resource.ToEntity());
                    }
                    context.SaveChanges();
                }
                else
                {
                    Log.Information("ApiScopes already populated");
                }
            }
            app.SeedUsers();
        }
    }
}
