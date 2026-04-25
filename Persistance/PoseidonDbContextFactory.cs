using Microsoft.EntityFrameworkCore;
using Poseidon.Application;
using Poseidon.Common;
using Poseidon.Infrastructure;

namespace Poseidon.Persistence
{
    /// <summary>
    /// Used by EF Core tooling (migrations) only. Uses no-op stubs for auditing services.
    /// </summary>
    public class PoseidonDbContextFactory : DesignTimeDbContextFactoryBase<PoseidonDbContext>
    {
        protected override PoseidonDbContext CreateNewInstance(DbContextOptions<PoseidonDbContext> options)
        {
            return new PoseidonDbContext(options, new DesignTimeUserService(), new MachineDateTimeOffset());
        }

        private sealed class DesignTimeUserService : ICurrentUserService
        {
            public string UserId         => "design-time";
            public bool   IsAuthenticated => false;
        }
    }
}
