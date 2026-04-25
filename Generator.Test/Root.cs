using RazorLight;
using System.Globalization;
using System.Reflection;
using System.Text;
using System.Text.RegularExpressions;
using Microsoft.Extensions.Configuration;
using System;
using System.IO;
using System.Linq;
using System.Collections.Generic;

namespace Generator.Test
{
    public static class Root
    {
        // Values now configurable via appsettings.json
        public static string ConnectionString   = "";
        public static string SolutionBasePath   = ""; // default fallback
        public static string GeneratorAppPath   = $"{SolutionBasePath}/Generator.Test";
        public static string PowershellFilePath = $"{GeneratorAppPath}/GenCode/DeleteGenFiles.txt";
        public static string GenCode            = $"{GeneratorAppPath}/GenCode";

        public static string commandPath         = $"{SolutionBasePath}/Application/Commands";
        public static string dtoPath             = $"{SolutionBasePath}/Application/Dtos";
        public static string queryPath           = $"{SolutionBasePath}/Application/Queries";
        public static string commandHandlersPath = $"{SolutionBasePath}/Application/CommandHandlers";
        public static string endpointsPath       = $"{SolutionBasePath}/Poseidon.Api/Endpoints";
        public static string metaModelPath       = $"{SolutionBasePath}/Generator.Test/model.json";
        public static string GenParallelPerformance = $"{SolutionBasePath}/Poseidon.Performance/Benchmarks";

        public static string[] GeneratedFiles = new  string []
        {
             $"{commandPath}/Commands.cs"
            ,$"{dtoPath}/Dtos.cs"
            ,$"{queryPath}/Queries.cs"
            ,$"{commandHandlersPath}/CommandHandlers.cs"
            ,$"{endpointsPath}/Endpoints.cs"
        };

        /// <summary>
        /// Resolves the solution root by walking up from the Generator.Test binary until
        /// we find a .slnx/.sln file, or falls back to the parent of the working directory.
        /// </summary>
        private static string AutoDetectSolutionBasePath()
        {
            // Walk up from the directory containing this running assembly
            var dir = new DirectoryInfo(AppContext.BaseDirectory);
            while (dir != null)
            {
                if (dir.GetFiles("*.slnx").Length > 0 || dir.GetFiles("*.sln").Length > 0)
                    return dir.FullName.Replace('\\', '/');
                dir = dir.Parent;
            }
            // Fallback: parent of current working directory (covers `dotnet run` inside Generator.Test)
            return Path.GetFullPath(Path.Combine(Directory.GetCurrentDirectory(), "..")).Replace('\\', '/');
        }

        public static void Initialize(IConfiguration configuration)
        {
            // 1. Resolve connection string (appsettings → env var ConnectionStrings__Default)
            var configuredConn = configuration.GetConnectionString("Default");

            // Additional fallback for local/dev environments when configuration files are not resolved
            if (string.IsNullOrWhiteSpace(configuredConn))
            {
                configuredConn = Environment.GetEnvironmentVariable("POSEIDON_GENERATOR_CONNECTION")
                              ?? "Server=localhost,1433;Database=PoseidonApiDB;User Id=sa;Password=Pass123$;MultipleActiveResultSets=true;TrustServerCertificate=True;";
            }

            // 2. Optionally remap the SQL host (useful when SQL Server is in docker-compose
            //    and the service name differs from the default "localhost,1433").
            //    Set  Generator__SqlHost  env var or appsettings "Generator:SqlHost" to override.
            var sqlHost = configuration["Generator:SqlHost"];
            if (!string.IsNullOrWhiteSpace(configuredConn) && !string.IsNullOrWhiteSpace(sqlHost))
            {
                // Replace the Server= part of the connection string with the configured host
                configuredConn = System.Text.RegularExpressions.Regex.Replace(
                    configuredConn,
                    @"(?i)Server=[^;]+",
                    $"Server={sqlHost}");
            }

            if (!string.IsNullOrWhiteSpace(configuredConn))
                ConnectionString = configuredConn!;

            // 3. Resolve solution base path: config → auto-detect
            var configuredSolutionPath  = configuration["Paths:SolutionBasePath"];
            var configuredGeneratorPath = configuration["Paths:GeneratorAppPath"];

            if (!string.IsNullOrWhiteSpace(configuredSolutionPath))
                SolutionBasePath = configuredSolutionPath!.Replace('\\', '/');
            else
                SolutionBasePath = AutoDetectSolutionBasePath();

            if (!string.IsNullOrWhiteSpace(configuredGeneratorPath))
                GeneratorAppPath = configuredGeneratorPath!.Replace('\\', '/');
            else
                GeneratorAppPath = $"{SolutionBasePath}/Generator.Test";

            // Recalculate dependent paths
            commandPath         = $"{SolutionBasePath}/Application/Commands";
            dtoPath             = $"{SolutionBasePath}/Application/Dtos";
            queryPath           = $"{SolutionBasePath}/Application/Queries";
            commandHandlersPath = $"{SolutionBasePath}/Application/CommandHandlers";
            endpointsPath       = $"{SolutionBasePath}/Poseidon.Api/Endpoints";
            metaModelPath       = $"{SolutionBasePath}/Generator.Test/model.json";            
            GenParallelPerformance = $"{SolutionBasePath}/Poseidon.Performance/Benchmarks";
            PowershellFilePath  = $"{GeneratorAppPath}/GenCode/DeleteGenFiles.txt";
            GenCode             = $"{GeneratorAppPath}/GenCode";

            GeneratedFiles = new string[]
            {
                $"{commandPath}/Commands.cs",
                $"{dtoPath}/Dtos.cs",
                $"{queryPath}/Queries.cs",
                $"{commandHandlersPath}/CommandHandlers.cs",
                $"{endpointsPath}/Endpoints.cs"
            };
        }

        public static string GetSpaces(int totalLength)
        {
            string result = string.Empty;
            for (int i = 0; i < totalLength; i++)
            {
                result += " ";
            }
            return result;
        }
    } 

    public static class CodeGenerator
    {
        public static async Task GenerateUsingTemplate<TModel>(string templateName, string outputFile, TModel model)
        {
                await GenerateAndSaveCode(@$"{Root.GeneratorAppPath}\Templates\{templateName}",outputFile, model);
        }
      
        public static async Task GenerateAndSaveCode<TModel>(string templatePath, string outputFile, TModel model)
        {  
            var destinationFileInfo = new FileInfo(@$"{outputFile}")!;

            try
            {
                    var engine = new RazorLightEngineBuilder()
                    .UseEmbeddedResourcesProject(typeof(Root)) 
                    .SetOperatingAssembly(typeof(Root).Assembly)
                    .UseMemoryCachingProvider()
                    .Build(); 

                    using StreamReader reader = new(templatePath);
                    string templateString     = reader.ReadToEnd();
                    string content            = await engine.CompileRenderStringAsync("Model", templateString, model);
                    Console.WriteLine(content);

                    Save(destinationFileInfo!, content);
                
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Failed to process template {templatePath} with destination {destinationFileInfo.FullName} {ex.Message}");
                throw;
            }
        }
        
        public static string ToPascalCase(string identifier)
        {
            if (string.IsNullOrWhiteSpace(identifier))
                return string.Empty;

            identifier = string.Join(' ', Regex.Split(identifier, @"(?<!^)(?=[A-Z])"));
            var resultBuilder = new StringBuilder();
            var appendedSpace = false;

            foreach (char c in identifier)
            {
                if (!char.IsLetterOrDigit(c))
                {
                    resultBuilder.Append(" ");
                    appendedSpace = true;
                }
                else
                    resultBuilder.Append(c);
            }

            if (!appendedSpace)
            {
                var res = resultBuilder.ToString();
                return $"{ char.ToUpperInvariant(res[0]) }{ res.Substring(1) }";
            }

            var result = resultBuilder.ToString().ToLower();
            return CultureInfo.InvariantCulture.TextInfo.ToTitleCase(result).Replace(" ", String.Empty);
        }

       
        public static void Save(FileInfo destinationFile, string content)
        {
            destinationFile!.Directory.Create();
            File.WriteAllText(destinationFile.FullName, content);
        }
        public static void Save(string filePath, string content)
        => File.WriteAllText(filePath , content);

        public static string CreatePowerShellFunction(string[] genFiles)
        {
            var sb = new StringBuilder()
            .Append("function DeleteGenFiles {\n");
            foreach (var file in genFiles)
            {
                sb.Append($"Remove-Item -Path  {file} -Force;\n");
            }

            sb.Append("}\n");
            sb.Append("DeleteGenFiles;");

            return sb.ToString();
        }
    }
}
