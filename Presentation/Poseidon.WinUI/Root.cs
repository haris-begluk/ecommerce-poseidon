#define DOCKER_STAGE
using IdentityModel.Client;
using IdentityModel.OidcClient;

namespace Poseidon.WinUI;

public static partial class Root
{


    public static readonly string AdminUrl    = "http://localhost:5533";
    public static readonly string PoseidonUrl = "http://localhost:5433";
    public static OidcClientOptions OidcClientConfiguration => new ()
    {
            Authority    = AdminUrl,
            ClientId     = "win-forms",
            Scope        = "openid profile email offline_access poseidon-api poseidon-admin",
            RedirectUri  = "http://localhost/winforms.client",
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
