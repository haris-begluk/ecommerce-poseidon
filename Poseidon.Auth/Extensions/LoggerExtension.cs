using Serilog;
using Serilog.Sinks.Datadog.Logs;
using Serilog.Sinks.SystemConsole.Themes;
using System.Diagnostics;
using System.Net;
using System.Runtime.CompilerServices;
using ILogger = Microsoft.Extensions.Logging.ILogger;

namespace Poseidon.Auth;

public static partial class LoggerExtension
{
    private const string Empty = "";

    public static void AddLogging(this WebApplicationBuilder builder)
    {
        var logConsoleAndSQl = builder.Configuration.GetSection("ConsoleAndSqlLogging").Get<bool>();
        var dataDogUrl       = builder.Configuration.GetSection("DataDog:Url"   ).Value; 
        var dataDogApiKey    = builder.Configuration.GetSection("DataDog:ApiKey").Value;
        var appName = AppDomain.CurrentDomain.FriendlyName;
        var env     = builder.Environment.EnvironmentName;
        var host    = Dns.GetHostName();
    
    
        var ddConfig = new DatadogConfiguration(
                url:   dataDogUrl
            ,   port:   443
            ,   useSSL: true
            );
#if DEBUG 
        if (logConsoleAndSQl)
        {
            builder.Host.UseSerilog((ctx, lc) => lc
                .Enrich.WithProperty("ApplicationName", appName)
                .Enrich.WithMachineName()
                .Enrich.WithThreadId()
                .Enrich.WithCorrelationIdHeader()
                .Enrich.WithClientIp()
                .ReadFrom.Configuration(ctx.Configuration)
                .WriteTo.Console(outputTemplate: 
                "[{Timestamp:HH:mm:ss} {Level}] {SourceContext}{NewLine}{Message:lj}{NewLine}{Exception}{NewLine}", theme: AnsiConsoleTheme.Literate))
                ;
        }
        
#endif
        if (!string.IsNullOrWhiteSpace(dataDogApiKey))
        {
            builder.Host.UseSerilog((ctx, lc) => lc
            .Enrich.WithProperty("ApplicationName", appName)
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
        , [CallerLineNumber] int LineNumberNumber = 0)
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
        , [CallerLineNumber] int LineNumberNumber = 0)
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
        , [CallerLineNumber] int LineNumberNumber = 0)
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
        , [CallerLineNumber] int LineNumberNumber = 0)
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
        , [CallerLineNumber] int LineNumberNumber = 0)
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
        , [CallerLineNumber] int LineNumberNumber = 0)
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
        , [CallerLineNumber] int LineNumberNumber = 0)
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
