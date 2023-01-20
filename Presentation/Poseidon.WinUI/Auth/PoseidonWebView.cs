using IdentityModel.OidcClient.Browser;
using Microsoft.Web.WebView2.WinForms;

namespace Poseidon.WinUI
{
    public class PoseidonWebView : IBrowser
    {
        private readonly Func<Form> _formFactory;
        private BrowserOptions _options;

        public PoseidonWebView(Func<Form> formFactory)
        {
            _formFactory = formFactory;
        }

        public PoseidonWebView(string title = "Poseidon Authentication... ", int width = 1024, int height = 768)
            : this(() => new Form
            {
                Name   = "WebAuthentication",
                Text   = title,
                Width  = width,
                Height = height
            })
        { }

        public async Task<BrowserResult> InvokeAsync(BrowserOptions options, CancellationToken token = default)
        {
            _options = options;

            using (var form = _formFactory.Invoke())
            {
                using (var webView = new WebView2()
                {
                    Dock = DockStyle.Fill
                })
                {
                    var signal = new SemaphoreSlim(0, 1);

                    var browserResult = new BrowserResult
                    {
                        ResultType = BrowserResultType.UserCancel
                    };

                    form.FormClosed += (o, e) =>
                    {
                        signal.Release();
                    };

                    webView.NavigationStarting += (s, e) =>
                    {
                        if (IsBrowserNavigatingToRedirectUri(new Uri(e.Uri)))
                        {
                            e.Cancel = true;

                            browserResult = new BrowserResult()
                            {
                                ResultType = BrowserResultType.Success,
                                Response = new Uri(e.Uri).AbsoluteUri
                            };

                            signal.Release();
                            form.Close();
                        }
                    };

                    try
                    {
                        form.Controls.Add(webView);
                        webView.Show();

                        form.Show();

                        // Initialization
                        await webView.EnsureCoreWebView2Async(null);

                        // Delete existing Cookies so previous logins won't remembered
                        webView.CoreWebView2.CookieManager.DeleteAllCookies();

                        // Navigate
                        webView.CoreWebView2.Navigate(_options.StartUrl);

                        await signal.WaitAsync();
                    }
                    finally
                    {
                        form.Hide();
                        webView.Hide();
                    }

                    return browserResult;
                }
            }
        }

        private bool IsBrowserNavigatingToRedirectUri(Uri uri)
        {
            return uri.AbsoluteUri.StartsWith(_options!.EndUrl);
        }
    }
}