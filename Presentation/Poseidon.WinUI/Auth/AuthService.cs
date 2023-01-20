using IdentityModel.OidcClient;
using System.Text;

namespace Poseidon.WinUI.Auth
{
    public class Token
    {
        public string? AccessToken                      { get; set; }
        public string? IdentityToken                    { get; set; }
        public string? RefreshToken                     { get; set; }
        public DateTimeOffset AccessTokenExpiration     { get; set; }
    }


    public static  class AuthService
    {

        private static Token? AccessToken;    
        public static OidcClient _oidcClient        = new OidcClient(OidcClientConfiguration);

        public static void SaveToken(LoginResult authResults)
        {
            
            AccessToken = null;

            AccessToken = new()
            {
                AccessToken = authResults.AccessToken,
                RefreshToken = authResults.RefreshToken,
                AccessTokenExpiration = authResults.AccessTokenExpiration,
                IdentityToken = authResults.IdentityToken,
            };
                 


        }
        public static async Task<string> GetAccessToken()
        {
            await ValidateTokenOrRefresh();
            if (AccessToken?.AccessToken is null)
            {
                await Login();
            }
            return AccessToken?.AccessToken!;
        }
        public static async Task ValidateTokenOrRefresh()
        {
            if (AccessToken!.AccessTokenExpiration < DateTimeOffset.UtcNow)
            {
                try
                {  
                    if(AccessToken?.RefreshToken is null)
                    {
                        throw new ArgumentNullException("Refresh token is null invalid value, can't refresh access token.");
                    }

                    var result = await _oidcClient.RefreshTokenAsync(AccessToken.RefreshToken); 

                    if(result is null)
                    {
                        throw new ArgumentNullException("Refresh token result is null, invalid value");
                    }
                    else
                    {

                        AccessToken = null;

                        AccessToken = new()
                        {
                            AccessToken = result.AccessToken,
                            RefreshToken = result.RefreshToken,
                            AccessTokenExpiration = result.AccessTokenExpiration,
                            IdentityToken = result.IdentityToken,
                        };

                    }
                }
                catch (Exception ex)
                {  
                    System.Diagnostics.Debug.WriteLine(ex);
                     AccessToken = null;
                }
                
            }
               
        }
        public static async Task<string> Login()
        {
            LoginResult loginResult;

            try
            {

                loginResult = await _oidcClient.LoginAsync();

                SaveToken(loginResult);
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine(ex.Message + ex.InnerException);
                return $"Unexpected Error: {ex.Message}";
            }
            var sb = new StringBuilder(128);

            if (!string.IsNullOrWhiteSpace(loginResult.AccessToken))
            {
                sb.AppendLine();
                sb.AppendLine($"access token: {loginResult.AccessToken}");
            }

            return sb.ToString();
        
        } 
        public static bool IsValid()
        {
            if (AccessToken is null) return false; 
            if (string.IsNullOrWhiteSpace(AccessToken.AccessToken))         return false; 
            if (string.IsNullOrWhiteSpace(AccessToken.RefreshToken))        return false; 
            if (string.IsNullOrWhiteSpace(AccessToken.IdentityToken))       return false; 
            if (AccessToken!.AccessTokenExpiration < DateTimeOffset.UtcNow) return false;

            return true;
        }
    } 
}
