using Microsoft.AspNetCore.DataProtection.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;

namespace Poseidon.Auth;

public class ProtectionContext : DbContext, IDataProtectionKeyContext
{
    public ProtectionContext(DbContextOptions<ProtectionContext> options)
        : base(options) { }

    public DbSet<DataProtectionKey> DataProtectionKeys { get; set; }
}
