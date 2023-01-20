namespace Poseidon.Application.Dto;

using AutoMapper;
using Poseidon.Domain;
public partial class CartDetailsDto : CartDto, IMapFrom<Cart>
{
    public IEnumerable<CartItemDto>? CartItem { get; set; }

    public new void Mapping(Profile profile)
    {
        profile.CreateMap<Cart, CartDetailsDto>();
    }
}