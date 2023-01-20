using Duende.IdentityServer.Models;
using Duende.IdentityServer.Services;
using Microsoft.AspNetCore.Identity;
using System.Security.Claims;

namespace Poseidon.Auth.Services
{ 
    public class CustomProfileService : IProfileService
    {
        protected UserManager<ApplicationUser> _userManager;

        public CustomProfileService(UserManager<ApplicationUser> userManager)
        {
            _userManager = userManager;
        }

        public async Task GetProfileDataAsync(ProfileDataRequestContext context)
        {
            var user   = await _userManager.GetUserAsync(context.Subject);
            var claims = new List<Claim>
            {
                new Claim(ClaimTypes.Email , user.Email),
                new Claim("UserIdentifier" , user.Id   ),
            };

            context.IssuedClaims.AddRange(claims);
        }

        public async Task IsActiveAsync(IsActiveContext context)
        {
            var user = await _userManager.GetUserAsync(context.Subject);

            context.IsActive = user is not null  && user.EmailConfirmed;
        }
    }
}
