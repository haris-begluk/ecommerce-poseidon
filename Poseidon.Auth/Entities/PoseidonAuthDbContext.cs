using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;

namespace Poseidon.Auth.Entities
{
    public class PoseidonAuthDbContext : IdentityDbContext<ApplicationUser>
    { 
        public PoseidonAuthDbContext(DbContextOptions<PoseidonAuthDbContext> options)
            : base(options)
        {
        }

        protected override void OnModelCreating(ModelBuilder builder)
        {
            base.OnModelCreating(builder);
        }
    }
}
