namespace Swagger.Poseidon;
public partial class PoseidonClient
{
    public string Token { get; set; }

    partial void PrepareRequest(System.Net.Http.HttpClient client, System.Net.Http.HttpRequestMessage request, string url)
    {
        request.Headers.Authorization = new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", Token);
        request.Headers.TryAddWithoutValidation("X-Requested-With", "XMLHttpRequest");
    }

} 
