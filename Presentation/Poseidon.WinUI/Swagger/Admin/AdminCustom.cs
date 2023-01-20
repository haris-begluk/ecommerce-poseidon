namespace Swagger.Admin;
public partial class AdminClient
{
    public string Token { get; set; }

    partial void PrepareRequest(System.Net.Http.HttpClient client, System.Net.Http.HttpRequestMessage request, string url)
    {
        request.Headers.Authorization = new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", Token);
        //https://stackoverflow.com/questions/54556388/identity-server-4-intercept-302-and-replace-it-with-401
        request.Headers.TryAddWithoutValidation("X-Requested-With", "XMLHttpRequest"); 
    }

} 
