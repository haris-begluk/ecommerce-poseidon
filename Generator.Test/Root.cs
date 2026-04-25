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

        public static void Initialize(IConfiguration configuration)
        {
            // Override from configuration if present
            var configuredSolutionPath = configuration["Paths:SolutionBasePath"];            
            var configuredGeneratorPath = configuration["Paths:GeneratorAppPath"];            
            var configuredConn          = configuration.GetConnectionString("Default");

            if (!string.IsNullOrWhiteSpace(configuredSolutionPath))
                SolutionBasePath = configuredSolutionPath!;

            if (!string.IsNullOrWhiteSpace(configuredGeneratorPath))
                GeneratorAppPath = configuredGeneratorPath!;
            else
                GeneratorAppPath = $"{SolutionBasePath}/Generator.Test"; // recompute if solution base changed

            if (!string.IsNullOrWhiteSpace(configuredConn))
                ConnectionString = configuredConn!;

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
