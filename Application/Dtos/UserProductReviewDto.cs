
 
using System;
using AutoMapper;
using Poseidon.Domain;
namespace Poseidon.Application.Dto;
public class UserProductReviewDto : IMapFrom<UserProductReview>
{ 
    public int?            UserProductReviewId   { get; set; }
    public string?         Comment               { get; set; }
    public int             ProductId             { get; set; }
    public short           Rating                { get; set; }
    public DateTimeOffset  Sys_CreatedAt         { get; set; }
    public string          Sys_CreatedBy         { get; set; }
    public DateTimeOffset  Sys_UpdatedAt         { get; set; }
    public string          Sys_UpdatedBy         { get; set; }
    public string?         Title                 { get; set; }
    public int             UserId                { get; set; }



    public void Mapping(Profile profile)
    {  
          profile.CreateMap<UserProductReview, UserProductReviewDto>();
    }
}



