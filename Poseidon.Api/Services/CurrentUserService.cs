using Poseidon.Application;
using System.Security.Claims;

namespace Poseidon.Services;

public class CurrentUserService : ICurrentUserService
{
    public CurrentUserService(IHttpContextAccessor httpContextAccessor)
    { 
        //TODO: Remove after full set of claims are defined
        var user = httpContextAccessor
                        .HttpContext
                        ?.User;
        UserId          = (user
                        ?.FindFirstValue(ClaimTypes.Email)
                        ?? user?.Claims?.FirstOrDefault(c => c.Type.Equals("client_id"))?.Value) 
                        ?? "User email or clientid not found";
        IsAuthenticated = UserId is not null;
    }
    public string UserId { get; }

    public bool IsAuthenticated { get; }
}
