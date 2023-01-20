using Microsoft.EntityFrameworkCore;

namespace Poseidon.Persistence
{
    public class PoseidonDbContextFactory : DesignTimeDbContextFactoryBase<PoseidonDbContext>
    {
        protected override PoseidonDbContext CreateNewInstance(DbContextOptions<PoseidonDbContext> options)
        {
            return new PoseidonDbContext(options);
        }
    }
}