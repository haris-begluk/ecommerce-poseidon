using System.ComponentModel;

namespace Poseidon.Application.Commands;

public class QueryCommand<TResponse> : IQueryCommand<TResponse>
    where TResponse : class
{
    [DefaultValue(1)]
    public int Page { get; set; }

    [DefaultValue(1000)]
    public int PageSize { get; set; }

    [DefaultValue(null)]
    public string? Filter { get; set; }

    [DefaultValue("Sys_UpdatedAt")]
    public string? OrderBy { get; set; }
}