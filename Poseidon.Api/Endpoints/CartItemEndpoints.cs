
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
public static void MappCartItem(this WebApplication app)
{
    app.MapGet("api/cartitem/query",
    [ProducesResponseType(200, Type = (typeof(ResponseData<CartItemDto>)))]
    [ProducesResponseType(500, Type = (typeof(ErrorResponse)))]
    async (    [FromServices] IMediator _mediator
             , [AsParameters] QueryCommand<CartItemDto> command
    ) =>
    {
        return Results.Ok(await _mediator.Send(command));
    }).RequireAuthorization();
    
    app.MapPost("api/cartitem/upsert", 
    [ProducesResponseType(200, Type = (typeof(int)))]
    [ProducesResponseType(201, Type = (typeof(int)))]
    [ProducesResponseType(500, Type = (typeof(ErrorResponse)))]
    async (  [FromServices] IMediator          _mediator 
           , [FromBody] CartItemCommand   command) =>
    {
        var (id, status) = await _mediator.Send(command);

        return status switch
        {
            Status.Updated => Results.Ok(id),
            Status.Created => Results.Created("api/address/upsert" , id),
            _ => Results.BadRequest("Should not happend, contact developers dev@poseidon.com")
        };

    }).RequireAuthorization();

    app.MapDelete("api/cartitem/delete", 
    [ProducesResponseType(200, Type = (typeof(int)))]
    [ProducesResponseType(404, Type = (typeof(int)))]
    [ProducesResponseType(500, Type = (typeof(ErrorResponse)))]
    async ( [FromServices] IMediator          _mediator
          , [AsParameters] DeleteCommand<CartItem> command) =>
    {
       var (id, status) = await _mediator.Send(command);

       return status is Status.Deleted 
       ? Results.Ok(id) 
       : Results.NotFound(id);
    }).RequireAuthorization();

  }
}
