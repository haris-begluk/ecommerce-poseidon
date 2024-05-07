
using IdentityModel.Client;
using Swagger.Poseidon;
using System.Reflection;

namespace Poseidon.Tests
{
    public class MyClass
    {
        public void MyMethod(int number)
        {
            Console.WriteLine($"Method with one parameter: {number}");
        }

        public void MyMethod(int number, string text)
        {
            Console.WriteLine($"Method with two parameters: {number}, {text}");
        }
    }
    public class Program
    {
        static async Task Main(string[] args)
        {

            var myObject = new MyClass();
            Type myType = myObject.GetType();

            // Define the parameters for the method
            object[] parametersForFirst = { 10 };
            object[] parametersForSecond = { 20, "Hello" };

            try
            {
                // Get the method with one parameter
                MethodInfo methodInfo1 = myType.GetMethod("MyMethod", new Type[] { typeof(int) });

                if (methodInfo1 != null)
                {
                    methodInfo1.Invoke(myObject, parametersForFirst);
                }

                // Get the method with two parameters
                MethodInfo methodInfo2 = myType.GetMethod("MyMethod", new Type[] { typeof(int), typeof(string) });

                if (methodInfo2 != null)
                {
                    methodInfo2.Invoke(myObject, parametersForSecond);
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Exception: " + ex.Message);
            }






            string token = (await GetAccessTokenAsync())
                ?? throw new ArgumentNullException("Token is null");

            var poseidonClient = new PoseidonClient(new HttpClient())
            {
                Token = token
            };

            var poseidonType = poseidonClient.GetType();

            MethodInfo[] methods = poseidonType
                .GetMethods();

            await Console.Out.WriteLineAsync($"Found {methods.Length} in {nameof(poseidonType)}");

            for (int i = 0; i < methods
                .Where(m => m.IsPublic && m.Name.Contains("Api"))
                .ToArray().Length; i++)
            {
                var method = methods[i];
                if (method.Name == "ApiCountryQueryAsync")
                {
                    var subMethodList = methods
                        .Where(m => m.Name == "ApiCountryQueryAsync")
                        .ToArray();

                    var correctMethod = GetMethodWithMostParams(subMethodList);

                    object[] parameters = { 1, 100, "", "", CancellationToken.None };

                    if (correctMethod.GetParameters().Length != parameters.Length)
                    {
                        await Console.Out.WriteLineAsync($"Mismatch:{method.GetParameters().Length} - {parameters.Length}");
                        foreach (var item in method.GetParameters())
                        {
                            await Console.Out.WriteLineAsync($"Param: {item.Name}:{item.ParameterType}");
                        }
                    }
                    else
                    {
                        //var somet = poseidonClient.ApiCountryQueryAsync(); 

                        // Invoke the method dynamically 

                        var res = correctMethod.Invoke(poseidonClient, parameters);
                        var some = 10;
                    }

                }
                else
                {
                    await Console.Out.WriteLineAsync($"[{i}]-{method.Name}");
                }
            }

            //// Access private method using BindingFlags 
            //var privateMth = "PrivateMethod";
            //MethodInfo? privateMethod = poseidonType.GetMethod(privateMth, BindingFlags.NonPublic | BindingFlags.Instance);
            //if (privateMethod != null)
            //{
            //    // Invoke the private method dynamically
            //    privateMethod.Invoke(privateMth, null);
            //}
            //else
            //{
            //    await Console.Out.WriteLineAsync($"Unable to find method {privateMth}");
            //}

            //await TestAuthAsync(); 

        }
        static async Task<string?> GetAccessTokenAsync()
        {
            var authority = "https://localhost:5533"; // Replace with your OIDC provider URL
            var clientId = "user-client"; // Replace with your client ID
            var clientSecret = "secret"; // Replace with your client secret
            var scope = "openid profile email"; // Replace with desired scopes
            var username = "alice"; // Replace with the user's username
            var password = "Pass123$"; // Replace with the user's password


            HttpClientHandler handler = new();
            handler.ServerCertificateCustomValidationCallback = (sender, cert, chain, sslPolicyErrors) => { return true; };
            var client = new HttpClient(handler);

            var disco = await client.GetDiscoveryDocumentAsync(new DiscoveryDocumentRequest
            {
                Address = authority,
                Policy =
                    {
                        ValidateIssuerName = false,
                        ValidateEndpoints  = false,
                    },
            });

            if (disco.IsError)
            {
                Console.WriteLine(disco.Error);
                return null;
            }

            var tokenResponse = await client.RequestPasswordTokenAsync(new PasswordTokenRequest
            {
                Address = disco.TokenEndpoint,
                ClientId = clientId,
                ClientSecret = clientSecret,
                Scope = scope,
                UserName = username,
                Password = password
            });

            if (tokenResponse.IsError)
            {
                Console.WriteLine(tokenResponse.Error);
                return null;
            }

            Console.WriteLine("Access Token:");
            Console.WriteLine(tokenResponse.AccessToken);

            // Use the access token to call an API or get user info
            var userInfoResponse = await client.GetUserInfoAsync(new UserInfoRequest
            {
                Address = disco.UserInfoEndpoint,
                Token = tokenResponse.AccessToken
            });

            if (userInfoResponse.IsError)
            {
                Console.WriteLine(userInfoResponse.Error);
            }

            Console.WriteLine("<= User Info: =>");
            foreach (var claim in userInfoResponse.Claims)
            {
                Console.WriteLine($"-{claim.Type}-{claim.Value}");
            }

            return tokenResponse.AccessToken;
        }
        static MethodInfo GetMethodWithMostParams(MethodInfo[] methods)
        {
            MethodInfo? methodWithMostParams = null;
            int maxParams = 0;

            foreach (var method in methods)
            {
                int paramCount = method.GetParameters().Length;

                if (paramCount > maxParams)
                {
                    maxParams = paramCount;
                    methodWithMostParams = method;
                }
            }

            return methodWithMostParams!;
        }
    }
}

