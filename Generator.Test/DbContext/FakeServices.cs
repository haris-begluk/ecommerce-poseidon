using Poseidon.Application;
using Poseidon.Common;

namespace Fake.Services;

public class FakeUserService : ICurrentUserService
{
    public string UserId { get; }
    public bool IsAuthenticated { get; }
    public FakeUserService()
    {
        UserId = "DevUser";
        IsAuthenticated = true;
    }
}
public class FakeDateTime : IDateTimeOffset
{
    public System.DateTimeOffset Now => System.DateTimeOffset.Now;
}