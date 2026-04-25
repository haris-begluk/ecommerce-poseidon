# Poseidon Core Pilot Instructions

This file is the authoritative operating guide for all human and AI contributors.

## 1. Source-of-Truth Flow

The only accepted pipeline is:

1. Database schema (SQL migrations / EF Core model)
2. Custom generator output (Application commands, DTOs, handlers, API endpoints)
3. API OpenAPI export (Swagger JSON from running Poseidon API)
4. Client SDK generation (NSwag for Windows, OpenAPI generator or equivalent for Flutter)
5. Client UI integration (WinUI/WPF and Flutter)

Rules:
- No manual edits in generated files unless explicitly marked as partial/custom extension files.
- Any schema change must be propagated through the full chain in one regeneration cycle.
- Generated outputs are committed together with schema changes to avoid version skew.

## 2. Naming Conventions

### DTO Naming
- Query DTO: `{Entity}Dto`
- Upsert request: `Upsert{Entity}Command`
- Delete request: `Delete{Entity}Command`
- Query request: `Query{Entity}Command`
- List response: `List<{Entity}Dto>` or `{Entity}ListDto` (single approach per module; do not mix)

### Endpoint Naming
- Route root: `/api/{entityPlural}` in lowercase kebab-case.
- GET list: `GET /api/{entityPlural}`
- GET by id: `GET /api/{entityPlural}/{id}`
- POST upsert/create: `POST /api/{entityPlural}`
- DELETE: `DELETE /api/{entityPlural}/{id}`
- Endpoint operation ids must be stable and unique: `{Entity}_{Action}` (example: `Product_GetById`).

### C# Type and File Naming
- One public type per file.
- File name must match the primary type name.
- Never abbreviate entity names inconsistently across layers.

## 3. Generation Boundaries

Generated folders in this repo:
- `Application/Commands`
- `Application/Dtos`
- `Application/Queries`
- `Application/CommandHandlers`
- `Poseidon.Api/Endpoints`
- `Presentation/Poseidon.WinUI/Swagger/**`

Manual customization belongs in non-generated extension files only (for example `*Custom.cs`, partial classes, or separate service files).

## 4. .NET 10 Performance Guardrails

- Keep all projects on `net10.0` (or `net10.0-windows` for desktop UI).
- Keep nullable reference types enabled.
- Prefer async I/O end-to-end (DB, HTTP, file).
- Avoid sync-over-async (`.Result`, `.Wait()`) in runtime code.
- For APIs, prefer pooled `HttpClient` via `IHttpClientFactory` and resilience handlers.
- Avoid unnecessary allocations in hot paths; use `readonly` where applicable.
- Measure before tuning: keep benchmark/test evidence for changes that claim performance wins.

## 5. Aspire Integration Rules

- `poseidon.AppHost` must remain the orchestration entrypoint for local distributed runs.
- `poseidon.ServiceDefaults` is mandatory for service discovery, resilience, and health endpoints.
- API/Auth services must expose health endpoints and participate in service discovery.
- Legacy Docker Compose support is allowed, but Aspire is the default dev orchestration model.

## 6. Package Management Rules

- Central package management is required via `Directory.Packages.props`.
- Project files must not pin package versions directly unless there is a documented exception.
- Version updates are done centrally and validated with full solution restore/build.

## 7. Definition of Done for Schema Changes

A schema change is done only when all checks pass:

1. Migration/model update committed.
2. Custom generator run completed successfully.
3. API builds and exposes updated OpenAPI document.
4. NSwag/OpenAPI client generation completed for Windows and Flutter.
5. Client compile checks pass for both desktop and mobile targets.
6. Contract-breaking changes are documented in changelog/release notes.
