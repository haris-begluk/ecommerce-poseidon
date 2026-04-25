
using MediatR;
using Microsoft.Extensions.DependencyInjection;
using Poseidon.Application;
using Poseidon.Application.CommandHandlers;
using Poseidon.Application.Commands;
using System.Reflection;

namespace Poseidon.Endpoints;

public static partial class DependencyInjection
{
    /// <summary>
    /// Registers the three cross-cutting generic handlers (Query, Upsert, Delete) for every
    /// entity/DTO/command triple discovered by reflection from the Application assembly.
    ///
    /// Discovery rules:
    ///   Upsert : any TCommand : IUpsertCommand&lt;TEntity&gt;
    ///            → UpsertCommandHandler&lt;TEntity, TCommand&gt;
    ///   Delete : for each TEntity found via Upsert registrations
    ///            → DeleteCommandHandler&lt;TEntity, DeleteCommand&lt;TEntity&gt;&gt;
    ///   Query  : for each TDto whose name follows "{EntityName}Dto" convention
    ///            and a matching TEntity exists from the Upsert set
    ///            → QueryDataHandler&lt;TEntity, QueryCommand&lt;TDto&gt;, TDto&gt;
    /// </summary>
    public static void AddCommandHanlers(this IServiceCollection services)
    {
        var appAssembly = typeof(DependencyInjection).Assembly; // Application.dll

        var iUpsertCommandOpen = typeof(IUpsertCommand<>);
        var iRequestHandlerOpen = typeof(IRequestHandler<,>);

        var upsertHandlerOpen  = typeof(UpsertCommandHandler<,>);
        var deleteHandlerOpen  = typeof(DeleteCommandHandler<,>);
        var queryHandlerOpen   = typeof(QueryDataHandler<,,>);
        var deleteCommandOpen  = typeof(DeleteCommand<>);
        var queryCommandOpen   = typeof(QueryCommand<>);
        var responseType       = typeof(Response);
        var responseDataOpen   = typeof(ResponseData<>);

        // Build a map of EntityType → UpsertCommandType from all IUpsertCommand<T> implementors
        var entityToCommand = new Dictionary<Type, Type>();

        foreach (var cmdType in appAssembly.GetTypes()
            .Where(type => type.IsClass && !type.IsAbstract))
        {
            var upsertInterface = cmdType.GetInterfaces()
                .FirstOrDefault(i => i.IsGenericType &&
                                     i.GetGenericTypeDefinition() == iUpsertCommandOpen);

            if (upsertInterface is null) continue;

            var entityType = upsertInterface.GetGenericArguments()[0];
            entityToCommand[entityType] = cmdType;
        }

        // Build a map of EntityName → DtoType for QueryCommand registrations
        var dtoAssembly = typeof(DependencyInjection).Assembly;
        var entityNameToDto = dtoAssembly.GetTypes()
            .Where(t => t.IsClass && !t.IsAbstract && t.Name.EndsWith("Dto", StringComparison.Ordinal))
            .ToDictionary(t => t.Name[..^3]); // strip "Dto" suffix → entity name

        foreach (var (entityType, cmdType) in entityToCommand)
        {
            // ── Upsert handler ──────────────────────────────────────────────
            var upsertHandler      = upsertHandlerOpen.MakeGenericType(entityType, cmdType);
            var upsertHandlerIface = iRequestHandlerOpen.MakeGenericType(cmdType, responseType);
            services.AddTransient(upsertHandlerIface, upsertHandler);

            // ── Delete handler ──────────────────────────────────────────────
            var deleteCmd     = deleteCommandOpen.MakeGenericType(entityType);
            var deleteHandler = deleteHandlerOpen.MakeGenericType(entityType, deleteCmd);
            var deleteIface   = iRequestHandlerOpen.MakeGenericType(deleteCmd, responseType);
            services.AddTransient(deleteIface, deleteHandler);

            // ── Query handler (only when a matching Dto exists by naming convention) ──
            if (!entityNameToDto.TryGetValue(entityType.Name, out var dtoType)) continue;

            var queryCmd        = queryCommandOpen.MakeGenericType(dtoType);
            var responseData    = responseDataOpen.MakeGenericType(dtoType);
            var queryHandler    = queryHandlerOpen.MakeGenericType(entityType, queryCmd, dtoType);
            var queryHandlerIface = iRequestHandlerOpen.MakeGenericType(queryCmd, responseData);
            services.AddTransient(queryHandlerIface, queryHandler);
        }
    }
}
