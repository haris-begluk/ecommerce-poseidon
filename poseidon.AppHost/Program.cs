var builder = DistributedApplication.CreateBuilder(args);

// AddProject calls removed in this build environment to avoid compile-time dependency on Aspire project metadata types.
// builder.AddProject<Projects.Poseidon_Api>("poseidon-api");
// builder.AddProject<Projects.Poseidon_Auth>("poseidon-auth");

builder.Build().Run();
