using Poseidon.Common;

namespace Poseidon.Infrastructure
{
    public class MachineDateTimeOffset : IDateTimeOffset
    {
        public DateTimeOffset Now => DateTimeOffset.UtcNow;
    }
}
