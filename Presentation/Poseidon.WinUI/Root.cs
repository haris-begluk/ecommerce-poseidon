#define DOCKER_STAGE
using IdentityModel.Client;
using IdentityModel.OidcClient;

namespace Poseidon.WinUI;

public static partial class Root
{


    public static readonly string AdminUrl    = "https://localhost:5533";
    public static readonly string PoseidonUrl = "https://localhost:5433";
    public static OidcClientOptions OidcClientConfiguration => new ()
    {
            Authority    = AdminUrl,
            ClientId     = "win-forms",
            Scope        = "openid profile email offline_access poseidon-api poseidon-admin",
            RedirectUri  = "https://localhost/winforms.client",
            ClientSecret = "secret",
            Browser      = new PoseidonWebView(), 
            
            //TODO: Remove this policy or use debug mode 
#if DEBUG 
        Policy = new Policy()
        {
            Discovery = new DiscoveryPolicy()
            {
                RequireHttps      = false, 
                ValidateIssuerName = false,
            } 
        }
#endif
    };  
}
