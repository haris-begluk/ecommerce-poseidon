
namespace Poseidon.Endpoints;
using MediatR;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Poseidon.Api.Exceptions;
using Poseidon.Application;
using Poseidon.Application.Commands;
using Poseidon.Application.Dto;
using Poseidon.Domain;
using Poseidon.Enums;

public static partial class Endpoints
{
public static void MappWishListItem(this WebApplication app)
{
    app.MapGet("api/wishlistitem/query",
    [ProducesResponseType(200, Type = (typeof(ResponseData<WishListItemDto>)))]
    [ProducesResponseType(500, Type = (typeof(ErrorResponse)))]
    async (    [FromServices] IMediator _mediator
             , [AsParameters] QueryCommand<WishListItemDto> command
    ) =>
    {
        return Results.Ok(await _mediator.Send(command));
    }).RequireAuthorization();
    
    app.MapPost("api/wishlistitem/upsert", 
    [ProducesResponseType(200, Type = (typeof(int)))]
    [ProducesResponseType(201, Type = (typeof(int)))]
    [ProducesResponseType(500, Type = (typeof(ErrorResponse)))]
    async (  [FromServices] IMediator          _mediator 
           , [FromBody] WishListItemCommand   command) =>
    {
        var (id, status) = await _mediator.Send(command);

        return status switch
        {
            Status.Updated => Results.Ok(id),
            Status.Created => Results.Created("api/address/upsert" , id),
            _ => Results.BadRequest("Should not happend, contact developers dev@poseidon.com")
        };

    }).RequireAuthorization();

    app.MapDelete("api/wishlistitem/delete", 
    [ProducesResponseType(200, Type = (typeof(int)))]
    [ProducesResponseType(404, Type = (typeof(int)))]
    [ProducesResponseType(500, Type = (typeof(ErrorResponse)))]
    async ( [FromServices] IMediator          _mediator
          , [AsParameters] DeleteCommand<WishListItem> command) =>
    {
       var (id, status) = await _mediator.Send(command);

       return status is Status.Deleted 
       ? Results.Ok(id) 
       : Results.NotFound(id);
    }).RequireAuthorization();

  }
}
