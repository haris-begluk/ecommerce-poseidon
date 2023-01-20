using IdentityModel;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Swagger.Poseidon;
using System.Security.Claims;

namespace Poseidon.Auth.Endpoints;

public static partial class Endpoints
{

    public static WebApplication MappEndpoints(this WebApplication app)
    {
        app.MapPost("api/user/signup",
        [ProducesResponseType(201, Type = (typeof(string)))]
        [ProducesResponseType(400, Type = (typeof(string)))]
        [ProducesResponseType(401)]
        [ProducesResponseType(500, Type = (typeof(Poseidon.Auth.ErrorResponse)))]
        async ([FromServices] PoseidonAuthDbContext _context
             , [FromServices] UserManager<ApplicationUser> _userManager
             , [FromServices] ILogger<Program> _logger
             , [FromServices] IConfiguration _configuration
             , [FromServices] IHostEnvironment _env
             , [FromBody] SignupUserCommand command) =>
        {
            string _authUrl;
            string _poseidonApiUrl;

            if (_env.IsStaging())
            {
                _authUrl = "http://poseidon.auth";
                _poseidonApiUrl = "http://poseidon.api";
            }
            else
            {
                _authUrl = _configuration!.GetSection("Auth:BaseUrl").Value;
                _poseidonApiUrl = _configuration!.GetSection("Poseidon:BaseUrl").Value;
            }

            ApplicationUser? entity = null;

            var httpClient = new HttpClient()
            {
                Timeout = TimeSpan.FromMinutes(5)
            };

            var token = await httpClient.GetAccessTokenMachineToMachine(_authUrl);

            if (string.IsNullOrWhiteSpace(token))
            {
                _logger.LogError("Failed to get M2M token, system is not able to transfer user details to the poseidon api");
                throw new Exception("Failed to get M2M token, system is not able to transfer user details to the poseidon api");
            }

            entity = await _userManager.FindByNameAsync(command.UserName);

            if (entity is not null)
            {
                return Results.BadRequest($"Username {entity.UserName} already used");

            }
            else
            {
                entity = new ApplicationUser();
                entity.Email = command.Email;
                entity.EmailConfirmed = true;
                entity.LockoutEnabled = false;
                entity.NormalizedEmail = command.Email!.ToUpper();
                entity.NormalizedUserName = command.UserName!.ToUpper();
                entity.PhoneNumber = command.PhoneNumber;
                entity.PhoneNumberConfirmed = true;
                entity.TwoFactorEnabled = false;
                entity.UserName = command.UserName;

                //Usually user will get generic password by email after 
                //user will change their password, in this example i will use default 
                //password for all new users. Just for development.

                IdentityResult result = await _userManager.CreateAsync(entity, "Pass123$");

                await _userManager.AddClaimsAsync(entity, new Claim[]{
                                new Claim(JwtClaimTypes.Name      , entity.UserName),
                                new Claim(JwtClaimTypes.GivenName , entity.UserName),
                                new Claim(JwtClaimTypes.FamilyName, entity.UserName),
                                new Claim(JwtClaimTypes.Email     , entity.Email ?? "<NULL>")
                        });

                if (!result.Succeeded)
                {
                    throw new Exception($"Failed to create new user {result.Errors}");
                }
                else
                {
                    _logger.Debug($"Auth url {_authUrl} Poseidon Api Url {_poseidonApiUrl}");

                    var apiClient = new PoseidonClient(httpClient)
                    {
                        BaseUrl = _poseidonApiUrl,
                        Token = token
                    };

                    entity = await _userManager.FindByNameAsync(command.UserName);
                    try
                    {
                        var response = await apiClient.ApiUserQueryAsync(1,2
                        , orderBy: ""
                        , filter: $"externalRef={entity.Id},username={entity.UserName}"
                        );

                        var userCommand = new UserCommand
                        {
                            Email = entity.Email,
                            FirstName = entity.UserName,
                            ImageUrl = String.Empty,
                            LastName = entity.UserName,
                            PhoneNumber = entity.PhoneNumber,
                            Username = entity.UserName,
                            ExternalRef = entity.Id,
                            AddressId = 1 //Default address
                        };


                        if (response.TotalCount > 0)
                        {
                            _logger.Warning($"Found user {entity.UserName} in poseidon db");
                            userCommand.UserId = response.Items
                                    ?.SingleOrDefault()
                                    ?.UserId;
                        }

                        await apiClient.ApiUserUpsertAsync(userCommand);
                    }
                    catch (Exception)
                    {
                        _logger.Error("Creating user using poseidon api failed, rollback changes in the admin db");

                        await _userManager.DeleteAsync(entity);

                        _logger.Info($"User {entity.UserName} removed by rollback");

                        throw;
                    }

                }
                return Results.Created($"/create", entity.Id);
            }
        }).AllowAnonymous();
        return app;
    }
}