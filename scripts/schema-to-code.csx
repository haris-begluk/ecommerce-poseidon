#nullable enable
using System.Diagnostics;
using System.Net;
using System.Text;

var options = Options.Parse(args);
if (options.ShowHelp)
{
    Options.PrintHelp();
    return;
}

var flow = new Flow(options);
Environment.ExitCode = await flow.RunAsync();

sealed class Options
{
    public bool ShowHelp { get; init; }
    public string SolutionRoot { get; init; } = Directory.GetCurrentDirectory();
    public string SolutionFile { get; init; } = "poseidon.slnx";
    public string GeneratorProject { get; init; } = "Generator.Test/Generator.Test.csproj";
    public string ApiProject { get; init; } = "Poseidon.Api/Poseidon.Api.csproj";
    public string PersistenceProject { get; init; } = "Persistance/Persistance.csproj";
    public string? MigrationName { get; init; }
    public bool SkipMigration { get; init; }
    public bool SkipGenerator { get; init; }
    public bool SkipNswag { get; init; }
    public bool SkipFlutter { get; init; }
    public string? EfConnection { get; init; }
    public string SwaggerUrl { get; init; } = "https://localhost:5430/swagger/v1/swagger.json";
    public string SwaggerOutput { get; init; } = "artifacts/openapi/poseidon.json";
    public string AspNetCoreUrls { get; init; } = "https://localhost:5430;http://localhost:5431";
    public int SwaggerTimeoutSeconds { get; init; } = 150;
    public string NswagCommand { get; init; } = "nswag";
    public string NswagDirs { get; init; } = "Presentation/Poseidon.WinUI/Swagger/Poseidon;Presentation/Poseidon.WinUI/Swagger/Admin";
    public string FlutterWorkingDir { get; init; } = "Presentation/poseidon_mobile";
    public string? FlutterGenerateCommand { get; init; }
    public bool FlutterUseOpenApiGenerator { get; init; }
    public string FlutterOpenApiGeneratorCommand { get; init; } = "openapi-generator-cli";

    public static void PrintHelp()
    {
        Console.WriteLine("""
Schema-to-Code Automation (Poseidon)

Usage:
    dotnet scripts/schema-to-code.cs [options]
    # Alternative (run from scripts/ directory):
    dotnet run schema-to-code.cs -- [options]

Options:
  --migration=<name>                     EF migration name
  --sm|--skip-migration                  Skip migration add/database update
  --sg|--skip-generator                  Skip custom generator
  --sn|--skip-nswag                      Skip NSwag regeneration
  --sf|--skip-flutter                    Skip Flutter client regeneration
  --connection=<connection-string>       Override EF connection string for dotnet ef database update
  --solutionRoot=<path>                  Repo root (default: current directory)
  --swaggerUrl=<url>                     Swagger endpoint URL
  --swaggerOutput=<path>                 OpenAPI output path
  --nswagDirs=<dir1;dir2>                NSwag directories (each must contain nswag.json)
    --flutterGenerateCommand=<command>     Custom Flutter generation command (overrides default)
    --flutterUseOpenApiGenerator=true      Legacy flag (default behavior already uses OpenAPI Generator)
  --help                                 Show this help

Examples:
    dotnet scripts/schema-to-code.cs --migration=AddProductRating
    dotnet scripts/schema-to-code.cs --sm --sg
    dotnet scripts/schema-to-code.cs --sm
""");
    }

    public static Options Parse(string[] args)
    {
        var map = new Dictionary<string, string>(StringComparer.OrdinalIgnoreCase);
        var flags = new HashSet<string>(StringComparer.OrdinalIgnoreCase);

        foreach (var arg in args)
        {
            if (!arg.StartsWith("-", StringComparison.Ordinal))
            {
                continue;
            }

            var idx = arg.IndexOf('=');
            if (idx > 0)
            {
                map[arg.Substring(0, idx)] = arg[(idx + 1)..];
            }
            else
            {
                flags.Add(arg);
            }
        }

        var showHelp = flags.Contains("--help") || flags.Contains("-h");
        var skipMigration = flags.Contains("--skip-migration") || flags.Contains("--sm");
        var skipGenerator = flags.Contains("--skip-generator") || flags.Contains("--sg");
        var skipNswag = flags.Contains("--skip-nswag") || flags.Contains("--sn");
        var skipFlutter = flags.Contains("--skip-flutter") || flags.Contains("--sf");

        map.TryGetValue("--migration", out var migrationName);
        map.TryGetValue("--connection", out var efConnection);
        map.TryGetValue("--flutterGenerateCommand", out var flutterGenerateCommand);

        return new Options
        {
            ShowHelp = showHelp,
            SolutionRoot = map.TryGetValue("--solutionRoot", out var root) ? root : Directory.GetCurrentDirectory(),
            SolutionFile = map.TryGetValue("--solutionFile", out var sln) ? sln : "poseidon.slnx",
            GeneratorProject = map.TryGetValue("--generatorProject", out var genProject) ? genProject : "Generator.Test/Generator.Test.csproj",
            ApiProject = map.TryGetValue("--apiProject", out var apiProject) ? apiProject : "Poseidon.Api/Poseidon.Api.csproj",
            PersistenceProject = map.TryGetValue("--persistenceProject", out var persistenceProject) ? persistenceProject : "Persistance/Persistance.csproj",
            MigrationName = migrationName,
            SkipMigration = skipMigration,
            SkipGenerator = skipGenerator,
            SkipNswag = skipNswag,
            SkipFlutter = skipFlutter,
            EfConnection = efConnection,
            SwaggerUrl = map.TryGetValue("--swaggerUrl", out var swaggerUrl) ? swaggerUrl : "https://localhost:5430/swagger/v1/swagger.json",
            SwaggerOutput = map.TryGetValue("--swaggerOutput", out var swaggerOutput) ? swaggerOutput : "artifacts/openapi/poseidon.json",
            AspNetCoreUrls = map.TryGetValue("--aspnetcoreUrls", out var urls) ? urls : "https://localhost:5430;http://localhost:5431",
            SwaggerTimeoutSeconds = map.TryGetValue("--swaggerTimeoutSeconds", out var timeout) && int.TryParse(timeout, out var t) ? t : 150,
            NswagCommand = map.TryGetValue("--nswagCommand", out var nswagCmd) ? nswagCmd : "nswag",
            NswagDirs = map.TryGetValue("--nswagDirs", out var nswagDirs) ? nswagDirs : "Presentation/Poseidon.WinUI/Swagger/Poseidon;Presentation/Poseidon.WinUI/Swagger/Admin",
            FlutterWorkingDir = map.TryGetValue("--flutterWorkingDir", out var flutterDir) ? flutterDir : "Presentation/poseidon_mobile",
            FlutterGenerateCommand = flutterGenerateCommand,
            FlutterUseOpenApiGenerator = map.TryGetValue("--flutterUseOpenApiGenerator", out var autoFlutter)
                && bool.TryParse(autoFlutter, out var parsedAutoFlutter)
                && parsedAutoFlutter,
            FlutterOpenApiGeneratorCommand = map.TryGetValue("--flutterOpenApiGeneratorCommand", out var openApiCmd)
                ? openApiCmd
                : "openapi-generator-cli"
        };
    }
}

sealed class Flow
{
    private readonly Options _o;

    public Flow(Options o)
    {
        _o = o;
    }

    public async Task<int> RunAsync()
    {
        Process? apiProcess = null;

        try
        {
            Header("Schema-to-Code Automation");

            var root = Resolve(_o.SolutionRoot, ".");
            if (!Directory.Exists(root))
            {
                Fail($"Solution root not found: {root}");
                return 2;
            }

            await RunOrThrow("dotnet", "--version", root, "Check .NET SDK");

            var solution = Resolve(root, _o.SolutionFile);
            await RunOrThrow("dotnet", $"restore \"{solution}\"", root, "Restore solution");

            var apiProject = Resolve(root, _o.ApiProject);
            var persistenceProject = Resolve(root, _o.PersistenceProject);
            var generatorProject = Resolve(root, _o.GeneratorProject);

            if (!_o.SkipMigration)
            {
                if (string.IsNullOrWhiteSpace(_o.MigrationName))
                {
                    throw new InvalidOperationException("Migration name is required when migration step is enabled. Pass --migration=<name> or use --sm.");
                }

                await RunOrThrow(
                    "dotnet",
                    $"ef migrations add {_o.MigrationName} --project \"{persistenceProject}\" --startup-project \"{apiProject}\"",
                    root,
                    "Create EF migration");

                var updateCmd = $"ef database update --project \"{persistenceProject}\" --startup-project \"{apiProject}\"";
                if (!string.IsNullOrWhiteSpace(_o.EfConnection))
                {
                    updateCmd += $" --connection \"{_o.EfConnection}\"";
                }

                await RunOrThrow("dotnet", updateCmd, root, "Update database");
            }
            else
            {
                Warn("Skipping migration step.");
            }

            if (!_o.SkipGenerator)
            {
                await RunOrThrow("dotnet", $"run --project \"{generatorProject}\"", root, "Run custom generator");
            }
            else
            {
                Warn("Skipping generator step.");
            }

            await RunOrThrow("dotnet", $"build \"{apiProject}\" -c Release", root, "Build API");

            apiProcess = StartApi(apiProject, root, _o.AspNetCoreUrls);
            var swaggerOutput = Resolve(root, _o.SwaggerOutput);
            Directory.CreateDirectory(Path.GetDirectoryName(swaggerOutput)!);
            await WaitForSwaggerAndSave(_o.SwaggerUrl, swaggerOutput, _o.SwaggerTimeoutSeconds);

            if (!_o.SkipNswag)
            {
                foreach (var dir in Split(_o.NswagDirs))
                {
                    var folder = Resolve(root, dir);
                    var nswagJson = Path.Combine(folder, "nswag.json");
                    if (!File.Exists(nswagJson))
                    {
                        throw new FileNotFoundException($"Missing nswag.json in folder: {folder}");
                    }

                    // Requested behavior: execute `nswag` in the folder containing nswag.json.
                    await RunOrThrow(_o.NswagCommand, string.Empty, folder, $"Run NSwag in {dir}");
                }
            }
            else
            {
                Warn("Skipping NSwag step.");
            }

            if (!_o.SkipFlutter)
            {
                var flutterDir = Resolve(root, _o.FlutterWorkingDir);
                var openApiPath = Resolve(root, _o.SwaggerOutput);

                if (!string.IsNullOrWhiteSpace(_o.FlutterGenerateCommand))
                {
                    await RunShellOrThrow(_o.FlutterGenerateCommand!, flutterDir, "Run custom Flutter generation command");
                }
                else
                {
                    await RunFlutterOpenApiOrThrow(openApiPath, flutterDir, _o.FlutterOpenApiGeneratorCommand);
                }
            }
            else
            {
                Warn("Skipping Flutter step.");
            }

            Success("Schema-to-code cycle finished.");
            return 0;
        }
        catch (Exception ex)
        {
            Fail(ex.Message);
            return 1;
        }
        finally
        {
            Stop(apiProcess, "API process");
        }
    }

    private static Process StartApi(string apiProject, string workingDirectory, string aspNetCoreUrls)
    {
        Step("Start API for OpenAPI generation");

        var psi = new ProcessStartInfo("dotnet", $"run --project \"{apiProject}\" --no-build")
        {
            WorkingDirectory = workingDirectory,
            UseShellExecute = false,
            RedirectStandardOutput = true,
            RedirectStandardError = true,
            CreateNoWindow = true
        };

        psi.Environment["ASPNETCORE_ENVIRONMENT"] = "Development";
        psi.Environment["DOTNET_ENVIRONMENT"] = "Development";
        psi.Environment["ASPNETCORE_URLS"] = aspNetCoreUrls;

        var process = new Process { StartInfo = psi };
        if (!process.Start())
        {
            throw new InvalidOperationException("Could not start API process.");
        }

        process.BeginOutputReadLine();
        process.BeginErrorReadLine();
        return process;
    }

    private static async Task WaitForSwaggerAndSave(string url, string outputPath, int timeoutSeconds)
    {
        Step($"Wait for Swagger: {url}");

        using var handler = new HttpClientHandler
        {
            ServerCertificateCustomValidationCallback = (_, _, _, _) => true
        };
        using var client = new HttpClient(handler)
        {
            Timeout = TimeSpan.FromSeconds(20)
        };

        var start = DateTimeOffset.UtcNow;
        Exception? lastError = null;

        while ((DateTimeOffset.UtcNow - start).TotalSeconds < timeoutSeconds)
        {
            try
            {
                var response = await client.GetAsync(url);
                if (response.StatusCode == HttpStatusCode.OK)
                {
                    var content = await response.Content.ReadAsStringAsync();
                    await File.WriteAllTextAsync(outputPath, content, Encoding.UTF8);
                    Success($"Swagger exported to: {outputPath}");
                    return;
                }
            }
            catch (Exception ex)
            {
                lastError = ex;
            }

            await Task.Delay(2000);
        }

        throw new TimeoutException($"Swagger endpoint did not become ready in {timeoutSeconds}s. Last error: {lastError?.Message}");
    }

    private static async Task RunOrThrow(string fileName, string args, string cwd, string title)
    {
        Step(title);

        var psi = new ProcessStartInfo(fileName, args)
        {
            WorkingDirectory = cwd,
            UseShellExecute = false,
            RedirectStandardOutput = true,
            RedirectStandardError = true,
            CreateNoWindow = true
        };

        psi.Environment["ASPNETCORE_ENVIRONMENT"] = "Development";
        psi.Environment["DOTNET_ENVIRONMENT"] = "Development";

        using var p = new Process { StartInfo = psi };
        p.Start();

        var stdout = await p.StandardOutput.ReadToEndAsync();
        var stderr = await p.StandardError.ReadToEndAsync();
        await p.WaitForExitAsync();

        if (!string.IsNullOrWhiteSpace(stdout))
        {
            Console.WriteLine(stdout.TrimEnd());
        }

        if (!string.IsNullOrWhiteSpace(stderr))
        {
            Console.Error.WriteLine(stderr.TrimEnd());
        }

        if (p.ExitCode != 0)
        {
            throw new InvalidOperationException($"Command failed ({p.ExitCode}): {fileName} {args}");
        }
    }

    private static Task RunShellOrThrow(string command, string cwd, string title)
    {
        if (OperatingSystem.IsWindows())
        {
            return RunOrThrow("powershell", $"-NoProfile -Command \"{command}\"", cwd, title);
        }

        return RunOrThrow("bash", $"-lc \"{command}\"", cwd, title);
    }

    private static async Task RunFlutterOpenApiOrThrow(string openApiPath, string flutterDir, string configuredCommand)
    {
        var additionalProperties = "--additional-properties=pubName=openapi,pubDescription=OpenAPI API client,pubVersion=1.0.0";
        var arguments = $"generate -g dart -i \"{openApiPath}\" -o . {additionalProperties}";

        var candidates = new List<(string FileName, string Args, string Label)>
        {
            ("npx", $"--yes @openapitools/openapi-generator-cli {arguments}", "Generate Flutter client with npx @openapitools/openapi-generator-cli")
        };

        if (!string.IsNullOrWhiteSpace(configuredCommand) &&
            !configuredCommand.Equals("npx", StringComparison.OrdinalIgnoreCase))
        {
            candidates.Add((configuredCommand, arguments, $"Generate Flutter client with {configuredCommand}"));
        }

        var errors = new List<string>();
        foreach (var candidate in candidates)
        {
            try
            {
                await RunOrThrow(candidate.FileName, candidate.Args, flutterDir, candidate.Label);
                return;
            }
            catch (Exception ex)
            {
                errors.Add($"- {candidate.FileName}: {ex.Message}");
            }
        }

        var details = string.Join(Environment.NewLine, errors);
        throw new InvalidOperationException(
            "Flutter client generation failed using all known commands. " +
            "Pass --flutterGenerateCommand to provide an explicit command." +
            Environment.NewLine + details);
    }

    private static string Resolve(string root, string path)
    {
        return Path.GetFullPath(Path.IsPathRooted(path) ? path : Path.Combine(root, path));
    }

    private static IEnumerable<string> Split(string values)
    {
        return values
            .Split(';', StringSplitOptions.TrimEntries | StringSplitOptions.RemoveEmptyEntries)
            .Where(v => !string.IsNullOrWhiteSpace(v));
    }

    private static void Stop(Process? process, string label)
    {
        if (process is null || process.HasExited)
        {
            return;
        }

        try
        {
            process.Kill(entireProcessTree: true);
            process.WaitForExit(5000);
            Step($"Stopped {label}");
        }
        catch
        {
            Warn($"Failed to stop {label} cleanly.");
        }
    }

    private static void Header(string message) => Console.WriteLine($"\n=== {message} ===");
    private static void Step(string message) => Console.WriteLine($"[STEP] {message}");
    private static void Success(string message) => Console.WriteLine($"[OK] {message}");
    private static void Warn(string message) => Console.WriteLine($"[WARN] {message}");
    private static void Fail(string message) => Console.WriteLine($"[FAIL] {message}");
}
