using Microsoft.AspNetCore.Builder;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using OpenTelemetry;
using OpenTelemetry.Metrics;
using OpenTelemetry.Trace;
using Poseidon.Metrics;
using Serilog;
using Serilog.Sinks.Datadog.Logs;
using Serilog.Sinks.Elasticsearch;
using Serilog.Sinks.SystemConsole.Themes;
using System.Diagnostics;
using System.Net;
using System.Runtime.CompilerServices;
using ILogger = Microsoft.Extensions.Logging.ILogger;

namespace Poseidon.Logs;

public static partial class LoggerExtension
{
    private const string Empty = "";

    public static void AddCustomLoggerWithTelemetryMetrics(this WebApplicationBuilder builder)
    {

        var dataDogUrl         = builder.Configuration.GetSection("DataDog:Url").Value;
        var dataDogApiKey      = builder.Configuration.GetSection("DataDog:ApiKey").Value;
        var appName            = AppDomain.CurrentDomain.FriendlyName;
        var env                = builder.Environment.EnvironmentName;
        var host               = Dns.GetHostName();

        var elasticSearchUrl   = builder.Configuration.GetSection("ElasticSearchUrl").Get<string>();
        var elasticIndexFormat = $"medusa-logs-{DateTime.UtcNow:yyyy-MM}-{appName}";
        var useOtlpExporter    = !string.IsNullOrWhiteSpace(builder.Configuration["OTEL_EXPORTER_OTLP_ENDPOINT"]);

        var ddConfig = new DatadogConfiguration(
                url: dataDogUrl
            , port: 443
            , useSSL: true
            );

        builder.Logging.ClearProviders();

        builder.Logging.AddOpenTelemetry(logging =>
        {
            logging.IncludeFormattedMessage = true;
            logging.IncludeScopes           = true;
        });

        builder.Services.AddOpenTelemetry() 
            .WithMetrics(metrics =>
            {
                metrics.AddMeter("Poseidon")
                    .AddAspNetCoreInstrumentation()
                    .AddHttpClientInstrumentation()
                    .AddRuntimeInstrumentation();
            })
            .WithTracing(tracing =>
            {
                tracing.AddAspNetCoreInstrumentation()
                    // Uncomment the following line to enable gRPC instrumentation (requires the OpenTelemetry.Instrumentation.GrpcNetClient package)
                    //.AddGrpcClientInstrumentation()
                    .AddHttpClientInstrumentation();
            });

        builder.Services.AddSingleton<PoseidonMetrics>();


        if (useOtlpExporter)
        {
            builder.Services.AddOpenTelemetry().UseOtlpExporter();
        }

        // Uncomment the following lines to enable the Azure Monitor exporter (requires the Azure.Monitor.OpenTelemetry.AspNetCore package)
        //if (!string.IsNullOrEmpty(builder.Configuration["APPLICATIONINSIGHTS_CONNECTION_STRING"]))
        //{
        //    builder.Services.AddOpenTelemetry()
        //       .UseAzureMonitor();
        //}

        if (builder.Environment.IsDevelopment())
        {
            builder.Host.UseSerilog((ctx, lc) => lc
                    .Enrich.WithProperty("ApplicationName", appName)
                    .Enrich.WithRequestHeader("Referer")
                    .Enrich.WithRequestHeader("Origin")
                    .Enrich.WithRequestHeader("UserAgent")
                    .Enrich.WithRequestHeader("Host")
                    .Enrich.WithMachineName()
                    .Enrich.WithThreadId()
                    .Enrich.WithCorrelationIdHeader()
                    .Enrich.WithClientIp()
                    .ReadFrom.Configuration(ctx.Configuration)
                    .WriteTo.Console(outputTemplate:
                    "[{Timestamp:HH:mm:ss} {Level} {CorrelationId}] {SourceContext}{NewLine}{Message:lj}{NewLine}{Exception}{NewLine}", theme: AnsiConsoleTheme.Literate)
                    .WriteTo.OpenTelemetry(options =>
                    {
                        options.Endpoint = builder.Configuration["OTEL_EXPORTER_OTLP_ENDPOINT"];
                        var headers = builder.Configuration["OTEL_EXPORTER_OTLP_HEADERS"]?.Split(',') ?? [];
                        foreach (var header in headers)
                        {
                            var (key, value) = header.Split('=') switch
                            {
                            [string k, string v] => (k, v),
                                var v => throw new Exception($"Invalid header format {v}")
                            };

                            options.Headers.Add(key, value);
                        }
                        options.ResourceAttributes.Add("service.name", appName);
                    }));
        }
        if (!string.IsNullOrWhiteSpace(elasticSearchUrl))
        {
            builder.Host.UseSerilog((ctx, lc) => lc
            .Enrich.WithProperty("ApplicationName", appName)
            .Enrich.WithRequestHeader("Referer")
            .Enrich.WithRequestHeader("Origin")
            .Enrich.WithRequestHeader("UserAgent")
            .Enrich.WithRequestHeader("Host")
            .Enrich.WithMachineName()
            .Enrich.WithThreadId()
            .Enrich.WithCorrelationIdHeader()
            .Enrich.WithClientIp()
            .WriteTo.Elasticsearch(
                new ElasticsearchSinkOptions(new Uri(elasticSearchUrl!))
                {
                      AutoRegisterTemplate = true
                    , IndexFormat          = elasticIndexFormat
                    , NumberOfShards       = 2
                    , NumberOfReplicas     = 1
                }
            ));
        }

        if (!string.IsNullOrWhiteSpace(dataDogApiKey))
        {
            builder.Host.UseSerilog((ctx, lc) => lc
            .Enrich.WithProperty("ApplicationName", appName)
            .Enrich.WithRequestHeader("Referer")
            .Enrich.WithRequestHeader("Origin")
            .Enrich.WithRequestHeader("UserAgent")
            .Enrich.WithRequestHeader("Host")
            .Enrich.WithMachineName()
            .Enrich.WithThreadId()
            .Enrich.WithCorrelationIdHeader()
            .Enrich.WithClientIp()
            .WriteTo.DatadogLogs(
                      apiKey: dataDogApiKey
                    , source: appName
                    , service: appName
                    , host: host
                    , tags: new[]
                    {
                        $"Env:{env}"
                    }
                    , configuration: ddConfig));
        }
    }
    public static void Info(
            this ILogger logger
        , string message
        , [CallerMemberName] string callerName = Empty
        , [CallerFilePath] string callerPath = Empty
        , [CallerLineNumber] int LineNumberNumber = 0
        )
    {
        logger.Log(
            LogLevel.Information
            , "Method: {MethodName} Path: {Path} Line: {LineNumber} Message: {Message}"
            , callerName
            , callerPath
            , LineNumberNumber
            , message
            );
    }
    public static void Warning(
            this ILogger logger
        , string message
        , [CallerMemberName] string callerName = Empty
        , [CallerFilePath] string callerPath = Empty
        , [CallerLineNumber] int LineNumberNumber = 0
        )
    {
        logger.Log(
            LogLevel.Warning
            , "Method: {MethodName} Path: {Path} Line: {LineNumber} Message: {Message}"
            , callerName
            , callerPath
            , LineNumberNumber
            , message
            );
    }
    public static void Error(
            this ILogger logger
        , string message
        , [CallerMemberName] string callerName = Empty
        , [CallerFilePath] string callerPath = Empty
        , [CallerLineNumber] int LineNumberNumber = 0
        )
    {
        logger.Log(
            LogLevel.Error
            , "Method: {MethodName} Path: {Path} Line: {LineNumber} Message: {Message}"
            , callerName
            , callerPath
            , LineNumberNumber
            , message
            );
    }

    public static void Error(
            this ILogger logger
        , Exception exception
        , string message
        , [CallerMemberName] string callerName = Empty
        , [CallerFilePath] string callerPath = Empty
        , [CallerLineNumber] int LineNumberNumber = 0
        )
    {
        logger.Log(
            LogLevel.Error
            , exception
            , "Method: {MethodName} Path: {Path} Line: {LineNumber} Message: {Message}"
            , callerName
            , callerPath
            , LineNumberNumber
            , message
            );
    }
    [Conditional("DEBUG")]
    public static void Debug(
            this ILogger logger
        , string message
        , [CallerMemberName] string callerName = Empty
        , [CallerFilePath] string callerPath = Empty
        , [CallerLineNumber] int LineNumberNumber = 0
        )
    {
        logger.Log(
            LogLevel.Debug
            , "Method: {MethodName} Path: {Path} Line: {LineNumber} Message: {Message}"
            , callerName
            , callerPath
            , LineNumberNumber
            , message
            );
    }
    public static void Trace(
            this ILogger logger
        , string message
        , [CallerMemberName] string callerName = Empty
        , [CallerFilePath] string callerPath = Empty
        , [CallerLineNumber] int LineNumberNumber = 0
        )
    {
        logger.Log(
            LogLevel.Trace
            , "Method: {MethodName} Path: {Path} Line: {LineNumber} Message: {Message}"
            , callerName
            , callerPath
            , LineNumberNumber
            , message
            );
    }
    public static void Critical(
            this ILogger logger
        , string message
        , [CallerMemberName] string callerName = Empty
        , [CallerFilePath] string callerPath = Empty
        , [CallerLineNumber] int LineNumberNumber = 0
        )
    {
        logger.Log(
            LogLevel.Critical
            , "Method: {MethodName} Path: {Path} Line: {LineNumber} Message: {Message}"
            , callerName
            , callerPath
            , LineNumberNumber
            , message
            );
    }
}

