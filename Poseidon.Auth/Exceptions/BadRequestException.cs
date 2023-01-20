namespace Poseidon.Auth;

public class BadRequestException : Exception
{
    public BadRequestException(string message)
        : base(message)
    {
    }
}