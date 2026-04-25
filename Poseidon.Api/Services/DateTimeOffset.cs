using Poseidon.Common;

namespace Poseidon.Api.Services
{
    // NOTE: This class is superseded by Infrastructure.MachineDateTimeOffset which is
    // registered via AddInfrastructure(). Retained only for reference; not registered in DI.
    internal sealed class LegacyDateTimeOffset : IDateTimeOffset
    {
        public System.DateTimeOffset Now => System.DateTimeOffset.UtcNow;
    }
}
