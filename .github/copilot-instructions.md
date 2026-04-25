# Poseidon Copilot Instructions

STOP — READ EVERY RULE BEFORE WRITING OR EDITING ANY CODE.

---

## PROJECT CONTEXT

**Poseidon** is a .NET 10 e-commerce platform (C# latest) with a clean/layered architecture and multi-client presentation:

| Layer | Project | Responsibility |
|---|---|---|
| Domain | `Domain/` | Entities, `AuditableEntity` base, domain interfaces |
| Application | `Application/` | CQRS commands, queries, DTOs, MediatR handlers, pipeline behaviours |
| Persistence | `Persistance/` | `PoseidonDbContext`, EF Core 10 (SQL Server), migrations, entity configurations |
| Infrastructure | `Infrastructure/` | `IDateTimeOffset` implementation, machine services |
| Common | `Common/` | Shared interfaces (`IDateTime`, `IDateTimeOffset`) |
| API | `Poseidon.Api/` | ASP.NET Core Minimal API (MapGroup + static extensions), Swagger |
| Auth | `Poseidon.Auth/` | Duende IdentityServer with ASP.NET Identity, Razor Pages UI |
| AppHost | `poseidon.AppHost/` | .NET Aspire orchestration entrypoint for local distributed runs |
| ServiceDefaults | `poseidon.ServiceDefaults/` | Service discovery, resilience, health checks, OpenTelemetry |
| Generator | `Generator.Test/` | RazorLight + T4 code generator — produces commands, DTOs, handlers, endpoints |
| WinUI Client | `Presentation/Poseidon.WinUI/` | Windows desktop client (NSwag-generated SDK) |
| Mobile Client | `Presentation/poseidon_mobile/` | Flutter mobile client (OpenAPI-generated SDK) |
| Tests | `Poseidon.Tests/` | Unit and integration tests |

**Core libraries**: MediatR 14, AutoMapper, FluentValidation, Gridify, EF Core 10 SQL Server, Serilog, OpenTelemetry, Stripe.net, Microsoft.ML, Duende IdentityServer, .NET Aspire.

---

## PRE-FLIGHT CHECKLIST

Before writing or editing any code, verify:

- **Editing a generated file?** → STOP. Files in `Application/Commands`, `Application/Dtos`, `Application/Queries`, `Application/CommandHandlers`, `Poseidon.Api/Endpoints`, `Presentation/Poseidon.WinUI/Swagger/**` are generated. Use `*Custom.cs` extension files or partial classes instead.
- **Changing an Entity or DbContext?** → Follow the **Schema Change Workflow** below. Never run raw `dotnet ef` commands manually.
- **Adding a NuGet package?** → Add the version to `Directory.Packages.props` first. Never add `Version=` attributes in individual `.csproj` files.
- **Using `double` or `float` for money/prices?** → STOP. Use `decimal` for all financial values, configured with `HasPrecision(19, 4)`.
- **Returning an Entity from an API endpoint?** → STOP. Return a DTO. Map via AutoMapper.
- **Writing a Controller class?** → STOP. Use Minimal API with static extension methods (`MapGroup` + static `Map{Entity}` method).
- **Deleting a table or column?** → STOP. Use soft-delete conventions or confirm with the user first. Never drop schema without explicit approval.
- **Writing raw SQL or DDL?** → STOP. Use EF Core migrations only.
- **Logging with `Console.WriteLine`?** → STOP. Use `ILogger<T>` with Serilog structured logging.
- **Hardcoding secrets, keys, or connection strings?** → STOP. Use User Secrets (dev) or environment variables (prod).
- **Injecting `DbContext` into a singleton?** → STOP. Use `IDbContextFactory<PoseidonDbContext>` instead.
- **Upgrading a NuGet major version?** → STOP. Explain breaking changes and verify .NET 10 compatibility first.
- **Writing sync-over-async (`.Result`, `.Wait()`)?** → STOP. Use `await` end-to-end.

---

## SCHEMA CHANGE WORKFLOW (MANDATORY)

Any change to an Entity class or `PoseidonDbContext` **must** be propagated through the full automation pipeline. Never execute manual `dotnet ef` commands.

```bash
# Full pipeline: new migration + generator + OpenAPI + NSwag + Flutter
dotnet scripts/schema-to-code.cs --migration=<MigrationName>

# Skip migration (regenerate code only)
dotnet scripts/schema-to-code.cs --sm

# Skip migration and generator (OpenAPI + clients only)
dotnet scripts/schema-to-code.cs --sm --sg

# Skip everything except compile check
dotnet scripts/schema-to-code.cs --sm --sg --sn --sf

# All options
dotnet scripts/schema-to-code.cs --help
```

A schema change is **done** only when:
1. Migration committed (or skipped with justification).
2. Generator ran successfully — generated files match the new schema.
3. API builds and exposes an updated OpenAPI document.
4. NSwag client regenerated for `Presentation/Poseidon.WinUI/`.
5. Flutter client regenerated for `Presentation/poseidon_mobile/`.
6. Full solution builds with 0 errors and 0 warnings.
7. Breaking contract changes are documented.

---

## NAMING CONVENTIONS

### DTOs
| Purpose | Pattern | Example |
|---|---|---|
| Query response | `{Entity}Dto` | `ProductDto` |
| Upsert request | `{Entity}Command` | `ProductCommand` |
| Delete request | `DeleteCommand<TEntity>` | `DeleteCommand<Product>` |
| Query request | `QueryCommand<TResponse>` | `QueryCommand<ProductDto>` |
| Custom query | `{CustomAction}QueryCommand` | `CartDetailsCommand` |

### Endpoints (routes)
- Route: `api/{entityPlural}` in lowercase (e.g., `api/product`, `api/order-item`).
- GET list/query: `GET api/{entityPlural}/query`
- POST upsert: `POST api/{entityPlural}/upsert`
- DELETE: `DELETE api/{entityPlural}/delete`
- Operation IDs: `{Entity}_{Action}` e.g. `Product_Query`, `Product_Upsert`, `Product_Delete`.

### C# types and files
- One public type per file; file name must match the primary type name.
- Namespace matches folder structure: e.g. `Poseidon.Domain`, `Poseidon.Application.Commands`, `Poseidon.Endpoints`.
- Never abbreviate entity names inconsistently across layers.

---

## CODE STYLE

### Indentation and braces
- 4 spaces. No tabs.
- Allman style: opening brace on its own line for classes, methods, `if`, `for`, etc.

### Namespaces and usings
- File-scoped namespaces preferred (`namespace Foo;`).
- Non-global `using` directives at the top of the file, before the namespace.
- Global usings in `GlobalUsings.cs`.

### Modern C# (net10.0 / C# latest)
- Use `var` for all local variable declarations.
- Primary constructors for DI and simple classes.
- Target-typed `new()` when the type is clear from the declaration.
- Pattern matching: `is null`, `is not null`, `is Type t` — not `== null` or `!= null`.
- Expression bodies (`=>`) for simple one-liner properties and methods.
- `readonly` fields where applicable; avoid unnecessary allocations in hot paths.
- Nullable reference types: always enabled; never suppress `#nullable` without justification.
- Omit `internal` (it is the default). Use `public` and `private` explicitly.
- Prefix private fields with `_underscore`. Never use `this.`.

### Column alignment
Align `=`, `=>`, `:`, and field names vertically using spaces for readability, matching the style used in `PoseidonDbContext.cs` and entity files.

---

## DEPENDENCY INJECTION RULES

- All services register via extension methods:
  - `AddApplication()` in `Application/DependencyInjection.cs`
  - `AddPersistence()` in `Persistance/DependencyInjection.cs`
  - `AddInfrastructure()` in `Infrastructure/DependencyInjection.cs`
  - `AddServiceDefaults()` in `poseidon.ServiceDefaults/Extensions.cs`
- **Lifetime**: default to `Scoped` for services that use `DbContext`; `Singleton` only for stateless services.
- **Singleton + DbContext**: use `IDbContextFactory<PoseidonDbContext>`, never capture a scoped `DbContext`.
- **Options pattern**: new config sections use `IOptions<T>` with `.BindConfiguration()`, `.ValidateDataAnnotations()`, and `.ValidateOnStart()`.
- **HTTP clients**: use named `HttpClient` via `IHttpClientFactory` with standard resilience handler from `ServiceDefaults`.
- **FluentValidation**: register with `AddFluentValidationAutoValidation()` + `AddValidatorsFromAssembly(...)`.
- **AutoMapper**: register with `AddAutoMapper(Assembly.GetExecutingAssembly())`.
- **MediatR**: register with `AddMediatR(cfg => cfg.RegisterServicesFromAssembly(...))`.
- Do not add dead registrations (no-impl, no call-site).

---

## DOMAIN AND PERSISTENCE RULES

### Entities
- All entities inherit from `AuditableEntity` (provides `Sys_CreatedBy`, `Sys_CreatedAt`, `Sys_UpdatedBy`, `Sys_UpdatedAt`).
- Primary key convention: `{EntityName}Id` (e.g., `ProductId`, `OrderId`).
- Navigation properties marked `virtual`.
- Collections initialised via `virtual ICollection<T>` (no constructor init needed with EF Core lazy loading).

### DbContext
- `PoseidonDbContext` intercepts `SaveChangesAsync` to stamp audit fields from `ICurrentUserService` and `IDateTimeOffset`.
- All financial/numeric `decimal` columns: `HasPrecision(19, 4)`.
- Entity configurations live in `Persistance/Configuration/` and are applied via `ApplyConfigurationsFromAssembly(...)`.

### Migrations
- Created and applied only through `scripts/schema-to-code.cs`.
- Never manually edit a migration that has already been applied — create a corrective migration instead.
- Prefer additive migrations (new columns with defaults) over renaming or dropping.
- Commit migration files separately from application code when possible.

---

## CQRS PATTERN

### Commands (in `Application/Commands/`)
- Entity upsert: `{Entity}Command` — implements `IUpsertCommand<TEntity>`.
- Generic delete: `DeleteCommand<TEntity>` — implements `IDeleteCommand<TEntity>`.
- Generic query: `QueryCommand<TResponse>` — implements `IQueryCommand<TResponse>` (pagination + Gridify filter).

### Handlers (in `Application/CommandHandlers/`)
- Generic upsert: `UpsertCommandHandler<TEntity, TCommand>`.
- Generic delete: `DeleteCommandHandler`.
- Generic query: `QueryCommandHandler`.
- Custom business logic handlers live in `Application/CommandHandlers/Custom/`.

### Pipeline behaviours
- `RequestValidationBehavior<TRequest, TResponse>` — FluentValidation.
- `RequestPerformanceBehaviour<TRequest, TResponse>` — performance logging.
- Both registered in `Application/DependencyInjection.cs` as `IPipelineBehavior<,>`.

---

## API ENDPOINT RULES

- **Minimal API only.** Never introduce MVC controllers.
- Each entity has a static `Map{Entity}` method in `Poseidon.Api/Endpoints/{Entity}Endpoints.cs` called from `MappEndpoints.cs`.
- All endpoints call `RequireAuthorization()`.
- Response types declared with `[ProducesResponseType]` attributes.
- Parameters injected with `[FromServices]`, `[FromBody]`, or `[AsParameters]`.
- Return entity DTOs, never domain entity types.
- Custom/non-generated endpoints go in `Poseidon.Api/Endpoints/CustomEndpoints.cs` or a named `*Custom.cs` file.
- Standard responses:
  - Query: `Results.Ok(ResponseData<TDto>)`
  - Upsert: `Results.Ok(id)` for update; `Results.Created(location, id)` for insert.
  - Delete: `Results.Ok(id)` or `Results.NotFound(id)`.
  - Error: `Results.Problem(...)` or `ErrorResponse` for unhandled cases.

---

## AUTHENTICATION AND SECURITY

- **Auth server**: Duende IdentityServer in `Poseidon.Auth/` with ASP.NET Identity and EF Core stores.
- **API**: JWT Bearer authentication (`Microsoft.AspNetCore.Authentication.JwtBearer`).
- All endpoints call `RequireAuthorization()` — no anonymous endpoints without explicit justification.
- **No secrets in code**: use User Secrets (dev) or environment variables (prod). Never commit `appsettings` with real credentials.
- **HTTPS enforced** in all environments except where Aspire/Docker internal networking is involved.
- Never disable SSL validation in non-debug builds (the `#if DEBUG` guard in `Poseidon.Auth/Program.cs` is intentional — do not widen it).
- Parameterised queries only — EF Core handles this by default. Any raw SQL must use `FromSqlInterpolated` or `SqlParameter`.
- Data Protection keys must be persisted (do not change the DataProtection setup without approval).

---

## LOGGING AND OBSERVABILITY

- **Serilog only** via `ILogger<T>`. Never use `Console.WriteLine`, `Debug.WriteLine`, or `Trace`.
- Structured logging: use named parameters `{Entity}`, `{Id}`, `{UserId}` — never string interpolation in log messages.
- Log levels:
  - `Information` — significant business events.
  - `Warning` — recoverable issues or unexpected-but-handled states.
  - `Error` — failures requiring attention.
  - `Debug` — diagnostic detail for troubleshooting.
- Bootstrap logger initialised before `WebApplication.CreateBuilder` in `Program.cs`.
- `AddCustomLoggerWithTelemetryMetrics()` called in `ConfigureServices`.
- Serilog sinks in use: Console, Elasticsearch, Datadog, Debug, OpenTelemetry — do not remove without approval.
- **OpenTelemetry**: traces (ASP.NET Core, HttpClient, EF Core), metrics (runtime, Prometheus), logs via OTLP. Do not break the OTel pipeline.

---

## ERROR HANDLING

- `ErrorResponse` type used for 500-level responses — returned from endpoints in the `[ProducesResponseType(500)]` declaration.
- Pipeline behaviours handle validation (`ValidationException`) before reaching handlers.
- Unhandled exceptions surface through the global exception middleware — do not bypass it.
- External service failures must be caught, logged with full context (structured), and handled gracefully.
- Always propagate `CancellationToken` through all async call chains.

---

## PACKAGE MANAGEMENT

- Central package management: `Directory.Packages.props` is the single source of truth for all versions.
- **Never** add `Version=` in individual `.csproj` files.
- Prefer stable releases.
- After any NuGet change: `dotnet build poseidon.slnx` must return 0 errors and 0 warnings.
- Upgrading a major version: explain breaking changes and verify .NET 10 compatibility before proceeding.

---

## ASPIRE AND SERVICE DEFAULTS

- `poseidon.AppHost` is the orchestration entrypoint for local distributed runs.
- All API/Auth services must call `builder.AddServiceDefaults()` which wires service discovery, resilience, and health checks.
- Health endpoints `/health` and `/alive` must remain functional after changes.
- Docker Compose (`docker-compose.yml`) is supported as a legacy alternative but Aspire is the default for local dev.

---

## GENERATION BOUNDARIES

**Generated — do not edit directly:**
- `Application/Commands/` (except `*Custom.cs`)
- `Application/Dtos/` (except `*Custom.cs`)
- `Application/Queries/`
- `Application/CommandHandlers/` (except files in `Custom/`)
- `Poseidon.Api/Endpoints/` (except `CustomEndpoints.cs` and `*Custom.cs`)
- `Presentation/Poseidon.WinUI/Swagger/**`

**Safe to edit:**
- `Application/CommandHandlers/Custom/`
- `Application/Custom/`
- `Poseidon.Api/Endpoints/CustomEndpoints.cs`
- Any file suffixed `*Custom.cs` or declared as a `partial` class meant for extension.

When the generator is re-run, all non-custom generated files will be overwritten.

---

## ENGINEERING PRINCIPLES

- **Stability first.** Prioritise maintainability over shortcuts or cleverness.
- **No breaking changes** without explicit user approval.
- **Ask when ambiguous.** When a request is unclear or risky, ask before proceeding.
- **Small reversible steps.** One logical change per commit.
- **Public API stability.** Interfaces, routes, and operation IDs must not be renamed or removed without confirmation.
- **No god classes.** Favour modular, decoupled design.
- **Interface-first.** Define an interface for new services; implement in the correct layer.
- **Business logic belongs** in `Application` handlers or `Domain` — not in endpoint lambdas.

---

## POST-CHANGE VERIFICATION CHECKLIST

A task is **Done** only when all of the following pass:

- [ ] `dotnet build poseidon.slnx` → 0 errors, 0 warnings.
- [ ] All nullable reference type warnings resolved — no suppressions without justification.
- [ ] Generated files not manually edited (use custom extension points).
- [ ] Schema changes propagated via `scripts/schema-to-code.cs`.
- [ ] No secrets, credentials, or connection strings in code or committed config files.
- [ ] Existing tests still pass for affected code paths.
- [ ] Commit message describes what changed, why, and any implications for other layers or clients.

---

## GIT CONVENTIONS

- One logical change per commit.
- Commit migration files separately from application code when possible.
- Never `git push --force`, `git reset --hard`, or amend published commits without explicit user instruction.
- Never commit `bin/`, `obj/`, `.vs/`, or user-specific IDE files or files that contain secrets.
- `Directory.Packages.props` changes committed together with the code that requires the new package.
