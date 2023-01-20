using System;

namespace Poseidon.Domain
{
    public class AuditableEntity : IDataGen
    {
        public string         Sys_CreatedBy      { get; set; }
        public DateTimeOffset Sys_CreatedAt      { get; set; }
        public string         Sys_UpdatedBy      { get; set; }
        public DateTimeOffset Sys_UpdatedAt      { get; set; }
    } 
    public interface IDataGen
    {

    }
}