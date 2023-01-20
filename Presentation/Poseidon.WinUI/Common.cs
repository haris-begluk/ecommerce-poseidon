using Swagger.Admin;
using Swagger.Poseidon;
using static Poseidon.WinUI.Auth.AuthService;

namespace Poseidon.WinUI;

public static partial class Root
{

    public static readonly Size ListViewMaxSize  = new (900, 402);
    public static readonly Size ListViewMinSize  = new (900, 502);     
    public static readonly int  MainFormWidth    = 1280;
    public static readonly int  MainFormHeight   = 720; 
    public static HttpClient _httpClient = new ()
        {
            Timeout = TimeSpan.FromMinutes(10)
        };
public static string? Truncate(this string? v, int nbr) => 
        v is null ? v : 
        v.Length > nbr ? v.Substring(0, nbr) + "..." : v;

  
    public static async Task<PoseidonClient> CreatePoseidonClient()
    {  
        if (_httpClient == null)
        {
            _httpClient = new()
            {
                Timeout = TimeSpan.FromMinutes(10)
            };
        }
        return new PoseidonClient(_httpClient)
        {
            Token = await GetAccessToken(), 
            BaseUrl = PoseidonUrl
        };
    }
    public static async Task<AdminClient> CreateAdminClient()
    {
        if (_httpClient == null)
        {
            _httpClient = new()
            {
                Timeout = TimeSpan.FromMinutes(10)
            };
        }
        return new AdminClient(_httpClient)
        {
            Token = await GetAccessToken(),
            BaseUrl = AdminUrl
            
        };
    }
}
