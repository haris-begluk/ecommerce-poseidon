using System;

namespace Poseidon.Domain
{
    public class AuditableEntity : IDataGen
    {
        public string         Sys_CreatedBy      { get; internal set; } = string.Empty;
        public DateTimeOffset Sys_CreatedAt      { get; internal set; }
        public string         Sys_UpdatedBy      { get; internal set; } = string.Empty;
        public DateTimeOffset Sys_UpdatedAt      { get; internal set; }
    } 
    public interface IDataGen
    {

    }
}