namespace Poseidon.Common;

using Microsoft.Extensions.Logging;
using System;
using System.Diagnostics;
using System.Runtime.CompilerServices;


public static class LoggerExtension
{
    private const string Empty = "";
    public static void Info(
            this ILogger logger
        ,   string message
        ,   [CallerMemberName] string callerName    = Empty
        ,   [CallerFilePath]   string callerPath    = Empty
        ,   [CallerLineNumber] int LineNumberNumber = 0     )
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
        ,   string message
        ,   [CallerMemberName] string callerName    = Empty
        ,   [CallerFilePath]   string callerPath    = Empty
        ,   [CallerLineNumber] int LineNumberNumber = 0     )
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
        ,   string message
        ,   [CallerMemberName] string callerName    = Empty
        ,   [CallerFilePath]   string callerPath    = Empty
        ,   [CallerLineNumber] int LineNumberNumber = 0     )
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
        ,   Exception exception
        ,   string message
        ,   [CallerMemberName] string callerName    = Empty
        ,   [CallerFilePath]   string callerPath    = Empty
        ,   [CallerLineNumber] int LineNumberNumber = 0     )
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
        , [CallerMemberName] string callerName       = Empty
        , [CallerFilePath]   string callerPath       = Empty
        , [CallerLineNumber] int    LineNumberNumber = 0    )
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
        , [CallerMemberName] string callerName       = Empty
        , [CallerFilePath]   string callerPath       = Empty
        , [CallerLineNumber] int    LineNumberNumber = 0    )
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
        , [CallerMemberName] string callerName       = Empty
        , [CallerFilePath]   string callerPath       = Empty
        , [CallerLineNumber] int    LineNumberNumber = 0    )
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

