using System.Runtime.CompilerServices;

// Allow the Persistence layer to set audit fields via internal setters.
// This keeps audit field writes out of Application/Domain code while still
// permitting EF Core's SaveChangesAsync to stamp them.
[assembly: InternalsVisibleTo("Persistance")]
