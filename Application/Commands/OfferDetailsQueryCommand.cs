using Poseidon.Application.Dto;

namespace Poseidon.Application.Commands;
public class OfferDetailsQueryCommand : QueryCommand<ProductDto>
{
    public int OfferId { get; set; }
}