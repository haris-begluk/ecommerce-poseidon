namespace Poseidon.Common
{
    public interface IDateTime
    {
        DateTime Now { get; }
    }
    public interface IDateTimeOffset
    {
        DateTimeOffset Now { get; }
    }
}