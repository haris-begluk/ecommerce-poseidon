namespace Poseidon.Endpoints;

using MediatR;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Poseidon.Api.Exceptions;
using Poseidon.Application;
using Poseidon.Application.Commands;
using Poseidon.Application.Dto;
using Poseidon.Enums;
using Swashbuckle.AspNetCore.Annotations;

public static partial class Endpoints
{
    public static void MappCustomEndpoints(this WebApplication app)
    {

        app.MapPost("api/order/create",
        [SwaggerOperation(summary: "New order for cart", description: "This method accepts cart Id  and will create and order and calculate prices. After proccess is done will return order Id")]
        [ProducesResponseType(201, Type = (typeof(OrderDto)))]
        [ProducesResponseType(404, Type = (typeof(long)))]
        [ProducesResponseType(500, Type = (typeof(ErrorResponse)))]
        async ([FromServices] IMediator _mediator
            ,  [AsParameters] OrderCheckoutCommand command
            ) =>
            {
                var (order, status) = await _mediator.Send(command);

                return status == Status.NotFound
                ? Results.NotFound(command.CartId)
                : Results.Created("api/order/create", order);

            }).RequireAuthorization();

        app.MapPost("api/stripe/pay",
        [SwaggerOperation(summary: "Stripe payment for order", description: "Accepts order id and credit card id ")]
        [ProducesResponseType(200, Type = (typeof(string)))]
        [ProducesResponseType(404, Type = (typeof(string)))]
        [ProducesResponseType(400, Type = (typeof(string)))]
        [ProducesResponseType(500, Type = (typeof(ErrorResponse)))]
        async ([FromServices] IMediator _mediator
             , [AsParameters] StripePaymentCommand command
            ) =>
        {
            var (response, status) = await _mediator.Send(command);

            return status switch
            {
                Status.Created => Results.Ok(response),
                Status.NotFound => Results.NotFound(response),
                Status.BadRequest => Results.BadRequest(response),
                Status.Updated => throw new NotImplementedException(),
                _ => Results.BadRequest("Should not happend, contact developers dev@poseidon.com")
            };

        }).RequireAuthorization();

        app.MapGet("api/user/details",
        [SwaggerOperation(summary: "Returns user details based on emil claim", description: "")]
        [ProducesResponseType(200, Type = (typeof(ResponseData<UserDetailsDto>)))]
        [ProducesResponseType(500, Type = (typeof(ErrorResponse)))]
        async ([FromServices] IMediator _mediator
        ) =>
        {
             return Results.Ok(await _mediator.Send(new UserDetailsCommand()));

        }).RequireAuthorization();

        app.MapGet("api/wishlist/details",
        [SwaggerOperation(summary: "Returns user wish list details based by user id", description: "")]
        [ProducesResponseType(200, Type = (typeof(ResponseData<WishListDetailsDto>)))]
        [ProducesResponseType(500, Type = (typeof(ErrorResponse)))]
        async (   [FromServices] IMediator _mediator
                , [AsParameters] WishListDetailsQueryCommand<WishListDetailsDto> command
            ) =>
        {
            return Results.Ok(await _mediator.Send(command));

        }).RequireAuthorization();


        app.MapGet("api/orderitem/details",
        [SwaggerOperation(summary: "Returns more details for order item", description: "")]
        [ProducesResponseType(200, Type = (typeof(ResponseData<OrderItemDetailsDto>)))]
        [ProducesResponseType(500, Type = (typeof(ErrorResponse)))]
        async ([FromServices] IMediator _mediator
             , [AsParameters] QueryCommand<OrderItemDetailsDto> command
        ) =>
        {
            return Results.Ok(await _mediator.Send(command));
        })
        .RequireAuthorization();

        app.MapGet("api/cart/details",
        [SwaggerOperation(summary: "Return users active cart with cart items if exists, if not new cart will be created and returned", description: "")]
        [ProducesResponseType(200, Type = (typeof(ResponseData<CartDetailsDto>)))]
        [ProducesResponseType(500, Type = (typeof(ErrorResponse)))]
        async ([FromServices] IMediator _mediator
        ) =>
        {
            return Results.Ok(await _mediator.Send(new CartDetailsCommand()));
        })
        .RequireAuthorization();


        app.MapGet("api/offer/products",
        [SwaggerOperation(summary: "Return discount offer products", description: "")]
        [ProducesResponseType(200, Type = (typeof(ResponseData<ProductDto>)))]
        [ProducesResponseType(500, Type = (typeof(ErrorResponse)))]
        async ([FromServices] IMediator _mediator
             , [AsParameters] OfferDetailsQueryCommand command
        ) =>
        {
            return Results.Ok(await _mediator.Send(command));
        })
        .RequireAuthorization();

        app.MapGet("api/bestseller/products",
        [SwaggerOperation(summary: "Return best seller products based on ordered quantity", description: "")]
        [ProducesResponseType(200, Type = (typeof(ResponseData<ProductDto>)))]
        [ProducesResponseType(500, Type = (typeof(ErrorResponse)))]
        async ([FromServices] IMediator _mediator
             , [AsParameters] BestSellersQueryCommand command
        ) =>
        {
            return Results.Ok(await _mediator.Send(command));
        })
        .RequireAuthorization();

        app.MapGet("api/recommend/products",
        [SwaggerOperation(summary: "Returns list of recommended products for user that calls endpoint based on the last reviewed product", description: "")]
        [ProducesResponseType(200, Type = (typeof(ResponseData<ProductDto>)))]
        [ProducesResponseType(500, Type = (typeof(ErrorResponse)))]
        async ([FromServices] IMediator _mediator
             , [AsParameters] RecommendedProductsQueryCommand command
        ) =>
        {
            return Results.Ok(await _mediator.Send(command));
        })
        .RequireAuthorization();
    }
}