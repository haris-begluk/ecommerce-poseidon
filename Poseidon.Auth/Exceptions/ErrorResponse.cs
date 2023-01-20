namespace Poseidon.Auth;

public class ErrorResponse
{
    public string? Message { get; set; }
    public string? InnerMessage { get; set; }
    public string? CorelationId { get; set; }
}
