using AutoMapper;
using AutoMapper.QueryableExtensions;
using Microsoft.EntityFrameworkCore;

namespace Poseidon.Application
{
    public static class MappingExtensions
    {
        public static Task<ResponseData<TDestination>> 
            ResponseDataAsync<TDestination>(
              this IQueryable<TDestination> queryable 
            , int count 
            , int pageNumber
            , int pageSize)
            => ResponseData<TDestination>.CreateAsync(
                queryable 
                , count 
                , pageNumber
                , pageSize);

        public static Task<List<TDestination>> ProjectToListAsync<TDestination>(
              this IQueryable queryable
            , IConfigurationProvider configuration)
            => queryable
            .ProjectTo<TDestination>(configuration)
            .ToListAsync();

        public static IMappingExpression<TSource, TDestination> MapOnlyIfChanged<TSource, TDestination>(this IMappingExpression<TSource, TDestination> map)
        {
            map.ForAllMembers(opt => opt.Condition((sourceObject, destObject, sourceProperty, destProperty) =>
            {
                if (sourceProperty == null)
                    return false;
                if (long.TryParse(sourceProperty.ToString(), out long outVal))
                {
                    if (outVal == default)
                        return false;
                }
                return !sourceProperty.Equals(destProperty);
            }));
            return map;
        }
    }
}
