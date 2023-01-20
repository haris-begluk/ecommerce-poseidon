using IdentityModel.Client;
namespace Poseidon.Auth
{
    public static class Common
    { 
        public static async Task<string> GetAccessTokenMachineToMachine(this HttpClient client, string url)
        {
            var disco = await client.GetDiscoveryDocumentAsync(
                new DiscoveryDocumentRequest
                {
                    Address = $"{url}/.well-known/openid-configuration",
                    Policy =
                    {
                        RequireHttps = false,
                        ValidateIssuerName = false
                    }
                    
                });

            ClientCredentialsTokenRequest passwordTokenRequest = new ()
            {
                Address      = disco.TokenEndpoint,
                ClientId     = "m2m-client",
                ClientSecret = "00d86c28-9523-4261-8b31-e53a67c1396b",
                GrantType    = "client_credentials",
                Scope        = "poseidon-api", 
                
            };

            var tokenResponse = await client.RequestClientCredentialsTokenAsync(passwordTokenRequest);
            
            return tokenResponse.IsError 
                ? string.Empty
                : tokenResponse.AccessToken; 
        }
    }
}
