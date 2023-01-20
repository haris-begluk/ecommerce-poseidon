
namespace Poseidon.Application;
using Microsoft.EntityFrameworkCore;

public class ResponseData<T>
    {
        public T[] Items { get; }
        public int PageIndex { get; }
        public int TotalPages { get; }
        public int TotalCount { get; }

        public ResponseData(T[] items, int count, int pageIndex, int pageSize)
        {
            PageIndex  = pageIndex;
            TotalPages = (int)Math.Ceiling(count / (double)pageSize);
            TotalCount = count;
            Items      = items;
        }

        public bool HasPreviousPage => PageIndex > 1;

        public bool HasNextPage => PageIndex < TotalPages;

        public static async Task<ResponseData<T>> CreateAsync(IQueryable<T> source, int count,  int pageIndex, int pageSize)
        {
            var items = await source.ToArrayAsync();

            return new ResponseData<T>(items, count, pageIndex, pageSize);
        }
    }