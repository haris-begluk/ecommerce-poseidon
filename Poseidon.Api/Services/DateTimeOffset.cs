using Poseidon.Common;

namespace Poseidon.Api.Services
{
    public class DateTimeOffset : IDateTimeOffset
    {
        public System.DateTimeOffset Now => System.DateTimeOffset.Now;
    }
}
