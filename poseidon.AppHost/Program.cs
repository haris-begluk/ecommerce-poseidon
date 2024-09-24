var builder = DistributedApplication.CreateBuilder(args);

builder.AddProject<Projects.Poseidon_Api>("poseidon-api");

builder.AddProject<Projects.Poseidon_Auth>("poseidon-auth");

builder.Build().Run();
