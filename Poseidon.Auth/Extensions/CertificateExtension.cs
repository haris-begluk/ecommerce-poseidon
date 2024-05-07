using Azure.Identity;
using Azure.Security.KeyVault.Certificates;
using Microsoft.Extensions.Configuration;
using System.Security.Cryptography.X509Certificates;

namespace Poseidon.Auth.Extensions
{
    public static class CertificateExtension
    {
        public static (X509Certificate2 PrimaryCert, X509Certificate2[] ExpiredCerts) Certificates { get; private set; } = (null, null);
        
        public static async Task<(X509Certificate2 PrimaryCert, X509Certificate2[])> 
            GetCertificatesAsync(this WebApplicationBuilder builder, Serilog.ILogger logger)
        {
            var loadCertificateFromLocalStore = builder.Configuration.GetValue<bool>("DataProtection:LoadCertificateFromLocalStore");

            

            if (Certificates.PrimaryCert == null)
            {
                logger.Information($"load certificate from local store:{loadCertificateFromLocalStore}");

                if (!loadCertificateFromLocalStore)
                {
                    var certName = builder.Configuration.GetValue<string>("DataProtection:CertificateName");

                    if (string.IsNullOrWhiteSpace(certName))
                    {
                        throw new ArgumentNullException("Certificate name value is null");
                    }
                    var certKeyVaultUrl = builder.Configuration.GetValue<string>("DataProtection:CertificateKeyVaultUrl");

                    if (string.IsNullOrWhiteSpace(certKeyVaultUrl))
                    {
                        throw new ArgumentNullException("Certificate key vault url value is null");
                    }

                    DefaultAzureCredential credential = new();

                    CertificateClient certClient = new(
                        vaultUri: new Uri(certKeyVaultUrl),
                        credential);

                    List<CertificateProperties> certificatesProps = new();

                    await foreach (CertificateProperties certItem in certClient.GetPropertiesOfCertificatesAsync())
                    {
                        certificatesProps.Add(certItem);
                    }
                    var certificatesPropsOrd = certificatesProps
                        .Where(certVersion => certVersion.Enabled.HasValue && certVersion.Enabled.Value)
                        .OrderByDescending(certVersion => certVersion.CreatedOn)
                        .ToArray();

                    if (certificatesPropsOrd.Length == 0)
                    {
                        logger.Error($"Key vault {certKeyVaultUrl} does not have any certificates");

                        throw new Exception("System unable to load any certificate");
                    }

                    var primaryProps = certificatesPropsOrd.First(c => c.Name == certName);

                    var primaryCert = await certClient.DownloadCertificateAsync(certName, primaryProps.Version);

                    var expiredCertificatesProps = certificatesPropsOrd
                        .Where(c => c.ExpiresOn <= DateTime.Now)
                        .OrderByDescending(c => c.ExpiresOn)
                        .ToArray();

                    logger.Information($"Key vault has {expiredCertificatesProps.Length} expired certificates");

                    List<X509Certificate2> expiredCerts = new();

                    if (expiredCertificatesProps.Length != 0)
                    {
                        foreach (var certProp in expiredCertificatesProps)
                        {
                            expiredCerts.Add(await certClient.DownloadCertificateAsync(certProp.Name, certProp.Version));
                        }
                    }
                    Certificates = new(primaryCert, expiredCerts.ToArray());
                }
                else
                {
                    if (builder.Environment.IsStaging())
                    {
                        var certPassword = builder.Configuration.GetValue<string>("Kestrel:Certificates:Default:Password");
                        var certPath = builder.Configuration.GetValue<string>("Kestrel:Certificates:Default:Path");
                        logger.Information($"Certificate path: {certPath} and password: {certPassword}");
                        var primaryCert = new X509Certificate2(certPath!, certPassword);
                        Certificates = new(primaryCert, Array.Empty<X509Certificate2>());
                    }
                    else
                    {
                        var certThumbprint = builder.Configuration.GetValue<string>("DataProtection:CertificateThumbprint");

                        X509Store certStore = new(StoreName.My, StoreLocation.CurrentUser);
                        certStore.Open(OpenFlags.ReadOnly);
                        if(!certStore.Certificates.Find(X509FindType.FindByThumbprint, certThumbprint, false).Any())
                        {
                            logger.Information("Can't find certificate");
                        }
                        var primaryCert = certStore.Certificates
                            .Find(X509FindType.FindByThumbprint, certThumbprint, false) 
                            .First();

                        var certificates = certStore.Certificates
                            .OrderByDescending(c => c.NotBefore)
                            .OrderByDescending(c => c.NotAfter)
                            .ToArray();

                        certStore.Close();

                        if (certificates.Length == 0)
                        {
                            logger.Error($"Found 0 certificates in the current user store, check your settings");
                            throw new Exception("Current user store does not have any certificates");
                        }
                        else
                        {
                            foreach (var cert in certificates)
                            {
                                logger.Information($"Found [{certificates.Length}] certificates certificate name: {cert.FriendlyName}");
                            }
                        }  


                        var expiredCertificates = certificates
                            .Where(c => c.NotAfter <= DateTime.UtcNow)
                            .ToArray();

                        Certificates = new(primaryCert, expiredCertificates!);
                    }
                    
                }
            }
            return Certificates;
        }
    }
}
