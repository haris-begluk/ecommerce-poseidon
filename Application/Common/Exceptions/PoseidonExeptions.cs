using System.Globalization;

namespace Application.Common.Exceptions;

public class PoseidonException : Exception
{
    public PoseidonException() : base() { }

    public PoseidonException(string message) : base(message) { }

    public PoseidonException(string message, params object[] args)
        : base(string.Format(CultureInfo.InvariantCulture, message, args))
    {
    }
}
