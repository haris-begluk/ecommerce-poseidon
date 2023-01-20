
using MediatR;
using Microsoft.Extensions.DependencyInjection;
using Poseidon.Application;
using Poseidon.Application.CommandHandlers;
using Poseidon.Application.Commands;
using Poseidon.Application.Dto;
using Poseidon.Domain;
namespace Poseidon.Endpoints; 

public static partial class DependencyInjection
{
    public static void AddCommandHanlers(this IServiceCollection services) 
    {
         services.AddTransient(typeof(IRequestHandler<QueryCommand<AddressDto>, ResponseData<AddressDto>>), typeof(QueryDataHandler<Address, QueryCommand<AddressDto>, AddressDto>));
         services.AddTransient(typeof(IRequestHandler<AddressCommand, Response>) , typeof(UpsertCommandHandler<Address, AddressCommand>));
         services.AddTransient(typeof(IRequestHandler<DeleteCommand<Address>, Response>), typeof(DeleteCommandHandler<Address, DeleteCommand<Address>>));
         services.AddTransient(typeof(IRequestHandler<QueryCommand<CartDto>, ResponseData<CartDto>>), typeof(QueryDataHandler<Cart, QueryCommand<CartDto>, CartDto>));
         services.AddTransient(typeof(IRequestHandler<CartCommand, Response>) , typeof(UpsertCommandHandler<Cart, CartCommand>));
         services.AddTransient(typeof(IRequestHandler<DeleteCommand<Cart>, Response>), typeof(DeleteCommandHandler<Cart, DeleteCommand<Cart>>));
         services.AddTransient(typeof(IRequestHandler<QueryCommand<CartItemDto>, ResponseData<CartItemDto>>), typeof(QueryDataHandler<CartItem, QueryCommand<CartItemDto>, CartItemDto>));
         services.AddTransient(typeof(IRequestHandler<DeleteCommand<CartItem>, Response>), typeof(DeleteCommandHandler<CartItem, DeleteCommand<CartItem>>));
         services.AddTransient(typeof(IRequestHandler<QueryCommand<CategoryDto>, ResponseData<CategoryDto>>), typeof(QueryDataHandler<Category, QueryCommand<CategoryDto>, CategoryDto>));
         services.AddTransient(typeof(IRequestHandler<CategoryCommand, Response>) , typeof(UpsertCommandHandler<Category, CategoryCommand>));
         services.AddTransient(typeof(IRequestHandler<DeleteCommand<Category>, Response>), typeof(DeleteCommandHandler<Category, DeleteCommand<Category>>));
         services.AddTransient(typeof(IRequestHandler<QueryCommand<CountryDto>, ResponseData<CountryDto>>), typeof(QueryDataHandler<Country, QueryCommand<CountryDto>, CountryDto>));
         services.AddTransient(typeof(IRequestHandler<CountryCommand, Response>) , typeof(UpsertCommandHandler<Country, CountryCommand>));
         services.AddTransient(typeof(IRequestHandler<DeleteCommand<Country>, Response>), typeof(DeleteCommandHandler<Country, DeleteCommand<Country>>));
         services.AddTransient(typeof(IRequestHandler<QueryCommand<CreditCardDto>, ResponseData<CreditCardDto>>), typeof(QueryDataHandler<CreditCard, QueryCommand<CreditCardDto>, CreditCardDto>));
         services.AddTransient(typeof(IRequestHandler<CreditCardCommand, Response>) , typeof(UpsertCommandHandler<CreditCard, CreditCardCommand>));
         services.AddTransient(typeof(IRequestHandler<DeleteCommand<CreditCard>, Response>), typeof(DeleteCommandHandler<CreditCard, DeleteCommand<CreditCard>>));
         services.AddTransient(typeof(IRequestHandler<QueryCommand<DeliveryDto>, ResponseData<DeliveryDto>>), typeof(QueryDataHandler<Delivery, QueryCommand<DeliveryDto>, DeliveryDto>));
         services.AddTransient(typeof(IRequestHandler<DeliveryCommand, Response>) , typeof(UpsertCommandHandler<Delivery, DeliveryCommand>));
         services.AddTransient(typeof(IRequestHandler<DeleteCommand<Delivery>, Response>), typeof(DeleteCommandHandler<Delivery, DeleteCommand<Delivery>>));
         services.AddTransient(typeof(IRequestHandler<QueryCommand<DiscountOfferDto>, ResponseData<DiscountOfferDto>>), typeof(QueryDataHandler<DiscountOffer, QueryCommand<DiscountOfferDto>, DiscountOfferDto>));
         services.AddTransient(typeof(IRequestHandler<DiscountOfferCommand, Response>) , typeof(UpsertCommandHandler<DiscountOffer, DiscountOfferCommand>));
         services.AddTransient(typeof(IRequestHandler<DeleteCommand<DiscountOffer>, Response>), typeof(DeleteCommandHandler<DiscountOffer, DeleteCommand<DiscountOffer>>));
         services.AddTransient(typeof(IRequestHandler<QueryCommand<OrderDto>, ResponseData<OrderDto>>), typeof(QueryDataHandler<Order, QueryCommand<OrderDto>, OrderDto>));
         services.AddTransient(typeof(IRequestHandler<OrderCommand, Response>) , typeof(UpsertCommandHandler<Order, OrderCommand>));
         services.AddTransient(typeof(IRequestHandler<DeleteCommand<Order>, Response>), typeof(DeleteCommandHandler<Order, DeleteCommand<Order>>));
         services.AddTransient(typeof(IRequestHandler<QueryCommand<OrderItemDto>, ResponseData<OrderItemDto>>), typeof(QueryDataHandler<OrderItem, QueryCommand<OrderItemDto>, OrderItemDto>));
         services.AddTransient(typeof(IRequestHandler<OrderItemCommand, Response>) , typeof(UpsertCommandHandler<OrderItem, OrderItemCommand>));
         services.AddTransient(typeof(IRequestHandler<DeleteCommand<OrderItem>, Response>), typeof(DeleteCommandHandler<OrderItem, DeleteCommand<OrderItem>>));
         services.AddTransient(typeof(IRequestHandler<QueryCommand<PaymentDto>, ResponseData<PaymentDto>>), typeof(QueryDataHandler<Payment, QueryCommand<PaymentDto>, PaymentDto>));
         services.AddTransient(typeof(IRequestHandler<PaymentCommand, Response>) , typeof(UpsertCommandHandler<Payment, PaymentCommand>));
         services.AddTransient(typeof(IRequestHandler<DeleteCommand<Payment>, Response>), typeof(DeleteCommandHandler<Payment, DeleteCommand<Payment>>));
         services.AddTransient(typeof(IRequestHandler<QueryCommand<PaymentProviderDto>, ResponseData<PaymentProviderDto>>), typeof(QueryDataHandler<PaymentProvider, QueryCommand<PaymentProviderDto>, PaymentProviderDto>));
         services.AddTransient(typeof(IRequestHandler<PaymentProviderCommand, Response>) , typeof(UpsertCommandHandler<PaymentProvider, PaymentProviderCommand>));
         services.AddTransient(typeof(IRequestHandler<DeleteCommand<PaymentProvider>, Response>), typeof(DeleteCommandHandler<PaymentProvider, DeleteCommand<PaymentProvider>>));
         services.AddTransient(typeof(IRequestHandler<QueryCommand<ProductDto>, ResponseData<ProductDto>>), typeof(QueryDataHandler<Product, QueryCommand<ProductDto>, ProductDto>));
         services.AddTransient(typeof(IRequestHandler<ProductCommand, Response>) , typeof(UpsertCommandHandler<Product, ProductCommand>));
         services.AddTransient(typeof(IRequestHandler<DeleteCommand<Product>, Response>), typeof(DeleteCommandHandler<Product, DeleteCommand<Product>>));
         services.AddTransient(typeof(IRequestHandler<QueryCommand<ProductDiscountOfferDto>, ResponseData<ProductDiscountOfferDto>>), typeof(QueryDataHandler<ProductDiscountOffer, QueryCommand<ProductDiscountOfferDto>, ProductDiscountOfferDto>));
         services.AddTransient(typeof(IRequestHandler<ProductDiscountOfferCommand, Response>) , typeof(UpsertCommandHandler<ProductDiscountOffer, ProductDiscountOfferCommand>));
         services.AddTransient(typeof(IRequestHandler<DeleteCommand<ProductDiscountOffer>, Response>), typeof(DeleteCommandHandler<ProductDiscountOffer, DeleteCommand<ProductDiscountOffer>>));
         services.AddTransient(typeof(IRequestHandler<QueryCommand<SettingsDto>, ResponseData<SettingsDto>>), typeof(QueryDataHandler<Settings, QueryCommand<SettingsDto>, SettingsDto>));
         services.AddTransient(typeof(IRequestHandler<SettingsCommand, Response>) , typeof(UpsertCommandHandler<Settings, SettingsCommand>));
         services.AddTransient(typeof(IRequestHandler<DeleteCommand<Settings>, Response>), typeof(DeleteCommandHandler<Settings, DeleteCommand<Settings>>));
         services.AddTransient(typeof(IRequestHandler<QueryCommand<TaxRateDto>, ResponseData<TaxRateDto>>), typeof(QueryDataHandler<TaxRate, QueryCommand<TaxRateDto>, TaxRateDto>));
         services.AddTransient(typeof(IRequestHandler<TaxRateCommand, Response>) , typeof(UpsertCommandHandler<TaxRate, TaxRateCommand>));
         services.AddTransient(typeof(IRequestHandler<DeleteCommand<TaxRate>, Response>), typeof(DeleteCommandHandler<TaxRate, DeleteCommand<TaxRate>>));
         services.AddTransient(typeof(IRequestHandler<QueryCommand<UserDto>, ResponseData<UserDto>>), typeof(QueryDataHandler<User, QueryCommand<UserDto>, UserDto>));
         services.AddTransient(typeof(IRequestHandler<UserCommand, Response>) , typeof(UpsertCommandHandler<User, UserCommand>));
         services.AddTransient(typeof(IRequestHandler<DeleteCommand<User>, Response>), typeof(DeleteCommandHandler<User, DeleteCommand<User>>));
         services.AddTransient(typeof(IRequestHandler<QueryCommand<UserProductReviewDto>, ResponseData<UserProductReviewDto>>), typeof(QueryDataHandler<UserProductReview, QueryCommand<UserProductReviewDto>, UserProductReviewDto>));
         services.AddTransient(typeof(IRequestHandler<UserProductReviewCommand, Response>) , typeof(UpsertCommandHandler<UserProductReview, UserProductReviewCommand>));
         services.AddTransient(typeof(IRequestHandler<DeleteCommand<UserProductReview>, Response>), typeof(DeleteCommandHandler<UserProductReview, DeleteCommand<UserProductReview>>));
         services.AddTransient(typeof(IRequestHandler<QueryCommand<WishListDto>, ResponseData<WishListDto>>), typeof(QueryDataHandler<WishList, QueryCommand<WishListDto>, WishListDto>));
         services.AddTransient(typeof(IRequestHandler<WishListCommand, Response>) , typeof(UpsertCommandHandler<WishList, WishListCommand>));
         services.AddTransient(typeof(IRequestHandler<DeleteCommand<WishList>, Response>), typeof(DeleteCommandHandler<WishList, DeleteCommand<WishList>>));
         services.AddTransient(typeof(IRequestHandler<QueryCommand<WishListItemDto>, ResponseData<WishListItemDto>>), typeof(QueryDataHandler<WishListItem, QueryCommand<WishListItemDto>, WishListItemDto>));
         services.AddTransient(typeof(IRequestHandler<WishListItemCommand, Response>) , typeof(UpsertCommandHandler<WishListItem, WishListItemCommand>));
         services.AddTransient(typeof(IRequestHandler<DeleteCommand<WishListItem>, Response>), typeof(DeleteCommandHandler<WishListItem, DeleteCommand<WishListItem>>));
        
    }
} 
