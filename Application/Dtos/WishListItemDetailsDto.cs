namespace Poseidon.Application.Dto;
using AutoMapper;
using Poseidon.Domain;
public partial class WishListDetailsDto : WishListDto, IMapFrom<WishList>
{
    public List<WishListItemDetailsDto>? WishListItem { get; set; }

    public new void Mapping(Profile profile)
    {
        profile.CreateMap<WishList, WishListDetailsDto>();
    }

}
public partial class WishListItemDetailsDto : WishListItemDto, IMapFrom<WishListItem>
{ 
    public ProductDto? Product { get; set; }
    public new void Mapping(Profile profile)
    {
        profile.CreateMap<WishListItem, WishListItemDetailsDto>();
    }

    public void CustomMapping(Profile profile)
    {
        profile.CreateMap<WishListItem, WishListItemDetailsDto>()
            .ForMember(d => d.Product, opt => opt.MapFrom(s => s.Product))
           ;
    }
}