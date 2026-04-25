# openapi.api.PoseidonApiApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *https://localhost:5430*

Method | HTTP request | Description
------------- | ------------- | -------------
[**apiAddressDeleteDelete**](PoseidonApiApi.md#apiaddressdeletedelete) | **DELETE** /api/address/delete | 
[**apiAddressQueryGet**](PoseidonApiApi.md#apiaddressqueryget) | **GET** /api/address/query | 
[**apiAddressUpsertPost**](PoseidonApiApi.md#apiaddressupsertpost) | **POST** /api/address/upsert | 
[**apiBestsellerProductsGet**](PoseidonApiApi.md#apibestsellerproductsget) | **GET** /api/bestseller/products | Return best seller products based on ordered quantity
[**apiCartDeleteDelete**](PoseidonApiApi.md#apicartdeletedelete) | **DELETE** /api/cart/delete | 
[**apiCartDetailsGet**](PoseidonApiApi.md#apicartdetailsget) | **GET** /api/cart/details | Return users active cart with cart items if exists, if not new cart will be created and returned
[**apiCartQueryGet**](PoseidonApiApi.md#apicartqueryget) | **GET** /api/cart/query | 
[**apiCartUpsertPost**](PoseidonApiApi.md#apicartupsertpost) | **POST** /api/cart/upsert | 
[**apiCartitemDeleteDelete**](PoseidonApiApi.md#apicartitemdeletedelete) | **DELETE** /api/cartitem/delete | 
[**apiCartitemQueryGet**](PoseidonApiApi.md#apicartitemqueryget) | **GET** /api/cartitem/query | 
[**apiCartitemUpsertPost**](PoseidonApiApi.md#apicartitemupsertpost) | **POST** /api/cartitem/upsert | 
[**apiCategoryDeleteDelete**](PoseidonApiApi.md#apicategorydeletedelete) | **DELETE** /api/category/delete | 
[**apiCategoryQueryGet**](PoseidonApiApi.md#apicategoryqueryget) | **GET** /api/category/query | 
[**apiCategoryUpsertPost**](PoseidonApiApi.md#apicategoryupsertpost) | **POST** /api/category/upsert | 
[**apiCountryDeleteDelete**](PoseidonApiApi.md#apicountrydeletedelete) | **DELETE** /api/country/delete | 
[**apiCountryQueryGet**](PoseidonApiApi.md#apicountryqueryget) | **GET** /api/country/query | 
[**apiCountryUpsertPost**](PoseidonApiApi.md#apicountryupsertpost) | **POST** /api/country/upsert | 
[**apiCreditcardDeleteDelete**](PoseidonApiApi.md#apicreditcarddeletedelete) | **DELETE** /api/creditcard/delete | 
[**apiCreditcardQueryGet**](PoseidonApiApi.md#apicreditcardqueryget) | **GET** /api/creditcard/query | 
[**apiCreditcardUpsertPost**](PoseidonApiApi.md#apicreditcardupsertpost) | **POST** /api/creditcard/upsert | 
[**apiDeliveryDeleteDelete**](PoseidonApiApi.md#apideliverydeletedelete) | **DELETE** /api/delivery/delete | 
[**apiDeliveryQueryGet**](PoseidonApiApi.md#apideliveryqueryget) | **GET** /api/delivery/query | 
[**apiDeliveryUpsertPost**](PoseidonApiApi.md#apideliveryupsertpost) | **POST** /api/delivery/upsert | 
[**apiDiscountofferDeleteDelete**](PoseidonApiApi.md#apidiscountofferdeletedelete) | **DELETE** /api/discountoffer/delete | 
[**apiDiscountofferQueryGet**](PoseidonApiApi.md#apidiscountofferqueryget) | **GET** /api/discountoffer/query | 
[**apiDiscountofferUpsertPost**](PoseidonApiApi.md#apidiscountofferupsertpost) | **POST** /api/discountoffer/upsert | 
[**apiOfferProductsGet**](PoseidonApiApi.md#apiofferproductsget) | **GET** /api/offer/products | Return discount offer products
[**apiOrderCreatePost**](PoseidonApiApi.md#apiordercreatepost) | **POST** /api/order/create | New order for cart
[**apiOrderDeleteDelete**](PoseidonApiApi.md#apiorderdeletedelete) | **DELETE** /api/order/delete | 
[**apiOrderQueryGet**](PoseidonApiApi.md#apiorderqueryget) | **GET** /api/order/query | 
[**apiOrderUpsertPost**](PoseidonApiApi.md#apiorderupsertpost) | **POST** /api/order/upsert | 
[**apiOrderitemDeleteDelete**](PoseidonApiApi.md#apiorderitemdeletedelete) | **DELETE** /api/orderitem/delete | 
[**apiOrderitemDetailsGet**](PoseidonApiApi.md#apiorderitemdetailsget) | **GET** /api/orderitem/details | Returns more details for order item
[**apiOrderitemQueryGet**](PoseidonApiApi.md#apiorderitemqueryget) | **GET** /api/orderitem/query | 
[**apiOrderitemUpsertPost**](PoseidonApiApi.md#apiorderitemupsertpost) | **POST** /api/orderitem/upsert | 
[**apiPaymentDeleteDelete**](PoseidonApiApi.md#apipaymentdeletedelete) | **DELETE** /api/payment/delete | 
[**apiPaymentQueryGet**](PoseidonApiApi.md#apipaymentqueryget) | **GET** /api/payment/query | 
[**apiPaymentUpsertPost**](PoseidonApiApi.md#apipaymentupsertpost) | **POST** /api/payment/upsert | 
[**apiPaymentproviderDeleteDelete**](PoseidonApiApi.md#apipaymentproviderdeletedelete) | **DELETE** /api/paymentprovider/delete | 
[**apiPaymentproviderQueryGet**](PoseidonApiApi.md#apipaymentproviderqueryget) | **GET** /api/paymentprovider/query | 
[**apiPaymentproviderUpsertPost**](PoseidonApiApi.md#apipaymentproviderupsertpost) | **POST** /api/paymentprovider/upsert | 
[**apiProductDeleteDelete**](PoseidonApiApi.md#apiproductdeletedelete) | **DELETE** /api/product/delete | 
[**apiProductQueryGet**](PoseidonApiApi.md#apiproductqueryget) | **GET** /api/product/query | 
[**apiProductUpsertPost**](PoseidonApiApi.md#apiproductupsertpost) | **POST** /api/product/upsert | 
[**apiProductdiscountofferDeleteDelete**](PoseidonApiApi.md#apiproductdiscountofferdeletedelete) | **DELETE** /api/productdiscountoffer/delete | 
[**apiProductdiscountofferQueryGet**](PoseidonApiApi.md#apiproductdiscountofferqueryget) | **GET** /api/productdiscountoffer/query | 
[**apiProductdiscountofferUpsertPost**](PoseidonApiApi.md#apiproductdiscountofferupsertpost) | **POST** /api/productdiscountoffer/upsert | 
[**apiRecommendProductsGet**](PoseidonApiApi.md#apirecommendproductsget) | **GET** /api/recommend/products | Returns list of recommended products for user that calls endpoint based on the last reviewed product
[**apiSettingsDeleteDelete**](PoseidonApiApi.md#apisettingsdeletedelete) | **DELETE** /api/settings/delete | 
[**apiSettingsQueryGet**](PoseidonApiApi.md#apisettingsqueryget) | **GET** /api/settings/query | 
[**apiSettingsUpsertPost**](PoseidonApiApi.md#apisettingsupsertpost) | **POST** /api/settings/upsert | 
[**apiStripePayPost**](PoseidonApiApi.md#apistripepaypost) | **POST** /api/stripe/pay | Stripe payment for order
[**apiTaxrateDeleteDelete**](PoseidonApiApi.md#apitaxratedeletedelete) | **DELETE** /api/taxrate/delete | 
[**apiTaxrateQueryGet**](PoseidonApiApi.md#apitaxratequeryget) | **GET** /api/taxrate/query | 
[**apiTaxrateUpsertPost**](PoseidonApiApi.md#apitaxrateupsertpost) | **POST** /api/taxrate/upsert | 
[**apiUserDeleteDelete**](PoseidonApiApi.md#apiuserdeletedelete) | **DELETE** /api/user/delete | 
[**apiUserDetailsGet**](PoseidonApiApi.md#apiuserdetailsget) | **GET** /api/user/details | Returns user details based on emil claim
[**apiUserQueryGet**](PoseidonApiApi.md#apiuserqueryget) | **GET** /api/user/query | 
[**apiUserUpsertPost**](PoseidonApiApi.md#apiuserupsertpost) | **POST** /api/user/upsert | 
[**apiUserproductreviewDeleteDelete**](PoseidonApiApi.md#apiuserproductreviewdeletedelete) | **DELETE** /api/userproductreview/delete | 
[**apiUserproductreviewQueryGet**](PoseidonApiApi.md#apiuserproductreviewqueryget) | **GET** /api/userproductreview/query | 
[**apiUserproductreviewUpsertPost**](PoseidonApiApi.md#apiuserproductreviewupsertpost) | **POST** /api/userproductreview/upsert | 
[**apiWishlistDeleteDelete**](PoseidonApiApi.md#apiwishlistdeletedelete) | **DELETE** /api/wishlist/delete | 
[**apiWishlistDetailsGet**](PoseidonApiApi.md#apiwishlistdetailsget) | **GET** /api/wishlist/details | Returns user wish list details based by user id
[**apiWishlistQueryGet**](PoseidonApiApi.md#apiwishlistqueryget) | **GET** /api/wishlist/query | 
[**apiWishlistUpsertPost**](PoseidonApiApi.md#apiwishlistupsertpost) | **POST** /api/wishlist/upsert | 
[**apiWishlistitemDeleteDelete**](PoseidonApiApi.md#apiwishlistitemdeletedelete) | **DELETE** /api/wishlistitem/delete | 
[**apiWishlistitemQueryGet**](PoseidonApiApi.md#apiwishlistitemqueryget) | **GET** /api/wishlistitem/query | 
[**apiWishlistitemUpsertPost**](PoseidonApiApi.md#apiwishlistitemupsertpost) | **POST** /api/wishlistitem/upsert | 


# **apiAddressDeleteDelete**
> int apiAddressDeleteDelete(id)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = PoseidonApiApi();
final id = 56; // int | 

try {
    final result = api_instance.apiAddressDeleteDelete(id);
    print(result);
} catch (e) {
    print('Exception when calling PoseidonApiApi->apiAddressDeleteDelete: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

**int**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiAddressQueryGet**
> AddressDtoResponseData apiAddressQueryGet(page, pageSize, filter, orderBy)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = PoseidonApiApi();
final page = 56; // int | 
final pageSize = 56; // int | 
final filter = filter_example; // String | 
final orderBy = orderBy_example; // String | 

try {
    final result = api_instance.apiAddressQueryGet(page, pageSize, filter, orderBy);
    print(result);
} catch (e) {
    print('Exception when calling PoseidonApiApi->apiAddressQueryGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **int**|  | [default to 1]
 **pageSize** | **int**|  | [default to 1000]
 **filter** | **String**|  | [optional] 
 **orderBy** | **String**|  | [optional] [default to 'Sys_UpdatedAt']

### Return type

[**AddressDtoResponseData**](AddressDtoResponseData.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiAddressUpsertPost**
> int apiAddressUpsertPost(addressCommand)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = PoseidonApiApi();
final addressCommand = AddressCommand(); // AddressCommand | 

try {
    final result = api_instance.apiAddressUpsertPost(addressCommand);
    print(result);
} catch (e) {
    print('Exception when calling PoseidonApiApi->apiAddressUpsertPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **addressCommand** | [**AddressCommand**](AddressCommand.md)|  | 

### Return type

**int**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiBestsellerProductsGet**
> ProductDtoResponseData apiBestsellerProductsGet(page, pageSize, filter, orderBy)

Return best seller products based on ordered quantity



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = PoseidonApiApi();
final page = 56; // int | 
final pageSize = 56; // int | 
final filter = filter_example; // String | 
final orderBy = orderBy_example; // String | 

try {
    final result = api_instance.apiBestsellerProductsGet(page, pageSize, filter, orderBy);
    print(result);
} catch (e) {
    print('Exception when calling PoseidonApiApi->apiBestsellerProductsGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **int**|  | [default to 1]
 **pageSize** | **int**|  | [default to 1000]
 **filter** | **String**|  | [optional] 
 **orderBy** | **String**|  | [optional] [default to 'Sys_UpdatedAt']

### Return type

[**ProductDtoResponseData**](ProductDtoResponseData.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiCartDeleteDelete**
> int apiCartDeleteDelete(id)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = PoseidonApiApi();
final id = 56; // int | 

try {
    final result = api_instance.apiCartDeleteDelete(id);
    print(result);
} catch (e) {
    print('Exception when calling PoseidonApiApi->apiCartDeleteDelete: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

**int**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiCartDetailsGet**
> CartDetailsDtoResponseData apiCartDetailsGet()

Return users active cart with cart items if exists, if not new cart will be created and returned



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = PoseidonApiApi();

try {
    final result = api_instance.apiCartDetailsGet();
    print(result);
} catch (e) {
    print('Exception when calling PoseidonApiApi->apiCartDetailsGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**CartDetailsDtoResponseData**](CartDetailsDtoResponseData.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiCartQueryGet**
> CartDtoResponseData apiCartQueryGet(page, pageSize, filter, orderBy)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = PoseidonApiApi();
final page = 56; // int | 
final pageSize = 56; // int | 
final filter = filter_example; // String | 
final orderBy = orderBy_example; // String | 

try {
    final result = api_instance.apiCartQueryGet(page, pageSize, filter, orderBy);
    print(result);
} catch (e) {
    print('Exception when calling PoseidonApiApi->apiCartQueryGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **int**|  | [default to 1]
 **pageSize** | **int**|  | [default to 1000]
 **filter** | **String**|  | [optional] 
 **orderBy** | **String**|  | [optional] [default to 'Sys_UpdatedAt']

### Return type

[**CartDtoResponseData**](CartDtoResponseData.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiCartUpsertPost**
> int apiCartUpsertPost(cartCommand)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = PoseidonApiApi();
final cartCommand = CartCommand(); // CartCommand | 

try {
    final result = api_instance.apiCartUpsertPost(cartCommand);
    print(result);
} catch (e) {
    print('Exception when calling PoseidonApiApi->apiCartUpsertPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **cartCommand** | [**CartCommand**](CartCommand.md)|  | 

### Return type

**int**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiCartitemDeleteDelete**
> int apiCartitemDeleteDelete(id)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = PoseidonApiApi();
final id = 56; // int | 

try {
    final result = api_instance.apiCartitemDeleteDelete(id);
    print(result);
} catch (e) {
    print('Exception when calling PoseidonApiApi->apiCartitemDeleteDelete: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

**int**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiCartitemQueryGet**
> CartItemDtoResponseData apiCartitemQueryGet(page, pageSize, filter, orderBy)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = PoseidonApiApi();
final page = 56; // int | 
final pageSize = 56; // int | 
final filter = filter_example; // String | 
final orderBy = orderBy_example; // String | 

try {
    final result = api_instance.apiCartitemQueryGet(page, pageSize, filter, orderBy);
    print(result);
} catch (e) {
    print('Exception when calling PoseidonApiApi->apiCartitemQueryGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **int**|  | [default to 1]
 **pageSize** | **int**|  | [default to 1000]
 **filter** | **String**|  | [optional] 
 **orderBy** | **String**|  | [optional] [default to 'Sys_UpdatedAt']

### Return type

[**CartItemDtoResponseData**](CartItemDtoResponseData.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiCartitemUpsertPost**
> int apiCartitemUpsertPost(cartItemCommand)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = PoseidonApiApi();
final cartItemCommand = CartItemCommand(); // CartItemCommand | 

try {
    final result = api_instance.apiCartitemUpsertPost(cartItemCommand);
    print(result);
} catch (e) {
    print('Exception when calling PoseidonApiApi->apiCartitemUpsertPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **cartItemCommand** | [**CartItemCommand**](CartItemCommand.md)|  | 

### Return type

**int**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiCategoryDeleteDelete**
> int apiCategoryDeleteDelete(id)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = PoseidonApiApi();
final id = 56; // int | 

try {
    final result = api_instance.apiCategoryDeleteDelete(id);
    print(result);
} catch (e) {
    print('Exception when calling PoseidonApiApi->apiCategoryDeleteDelete: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

**int**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiCategoryQueryGet**
> CategoryDtoResponseData apiCategoryQueryGet(page, pageSize, filter, orderBy)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = PoseidonApiApi();
final page = 56; // int | 
final pageSize = 56; // int | 
final filter = filter_example; // String | 
final orderBy = orderBy_example; // String | 

try {
    final result = api_instance.apiCategoryQueryGet(page, pageSize, filter, orderBy);
    print(result);
} catch (e) {
    print('Exception when calling PoseidonApiApi->apiCategoryQueryGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **int**|  | [default to 1]
 **pageSize** | **int**|  | [default to 1000]
 **filter** | **String**|  | [optional] 
 **orderBy** | **String**|  | [optional] [default to 'Sys_UpdatedAt']

### Return type

[**CategoryDtoResponseData**](CategoryDtoResponseData.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiCategoryUpsertPost**
> int apiCategoryUpsertPost(categoryCommand)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = PoseidonApiApi();
final categoryCommand = CategoryCommand(); // CategoryCommand | 

try {
    final result = api_instance.apiCategoryUpsertPost(categoryCommand);
    print(result);
} catch (e) {
    print('Exception when calling PoseidonApiApi->apiCategoryUpsertPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **categoryCommand** | [**CategoryCommand**](CategoryCommand.md)|  | 

### Return type

**int**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiCountryDeleteDelete**
> int apiCountryDeleteDelete(id)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = PoseidonApiApi();
final id = 56; // int | 

try {
    final result = api_instance.apiCountryDeleteDelete(id);
    print(result);
} catch (e) {
    print('Exception when calling PoseidonApiApi->apiCountryDeleteDelete: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

**int**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiCountryQueryGet**
> CountryDtoResponseData apiCountryQueryGet(page, pageSize, filter, orderBy)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = PoseidonApiApi();
final page = 56; // int | 
final pageSize = 56; // int | 
final filter = filter_example; // String | 
final orderBy = orderBy_example; // String | 

try {
    final result = api_instance.apiCountryQueryGet(page, pageSize, filter, orderBy);
    print(result);
} catch (e) {
    print('Exception when calling PoseidonApiApi->apiCountryQueryGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **int**|  | [default to 1]
 **pageSize** | **int**|  | [default to 1000]
 **filter** | **String**|  | [optional] 
 **orderBy** | **String**|  | [optional] [default to 'Sys_UpdatedAt']

### Return type

[**CountryDtoResponseData**](CountryDtoResponseData.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiCountryUpsertPost**
> int apiCountryUpsertPost(countryCommand)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = PoseidonApiApi();
final countryCommand = CountryCommand(); // CountryCommand | 

try {
    final result = api_instance.apiCountryUpsertPost(countryCommand);
    print(result);
} catch (e) {
    print('Exception when calling PoseidonApiApi->apiCountryUpsertPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **countryCommand** | [**CountryCommand**](CountryCommand.md)|  | 

### Return type

**int**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiCreditcardDeleteDelete**
> int apiCreditcardDeleteDelete(id)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = PoseidonApiApi();
final id = 56; // int | 

try {
    final result = api_instance.apiCreditcardDeleteDelete(id);
    print(result);
} catch (e) {
    print('Exception when calling PoseidonApiApi->apiCreditcardDeleteDelete: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

**int**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiCreditcardQueryGet**
> CreditCardDtoResponseData apiCreditcardQueryGet(page, pageSize, filter, orderBy)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = PoseidonApiApi();
final page = 56; // int | 
final pageSize = 56; // int | 
final filter = filter_example; // String | 
final orderBy = orderBy_example; // String | 

try {
    final result = api_instance.apiCreditcardQueryGet(page, pageSize, filter, orderBy);
    print(result);
} catch (e) {
    print('Exception when calling PoseidonApiApi->apiCreditcardQueryGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **int**|  | [default to 1]
 **pageSize** | **int**|  | [default to 1000]
 **filter** | **String**|  | [optional] 
 **orderBy** | **String**|  | [optional] [default to 'Sys_UpdatedAt']

### Return type

[**CreditCardDtoResponseData**](CreditCardDtoResponseData.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiCreditcardUpsertPost**
> int apiCreditcardUpsertPost(creditCardCommand)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = PoseidonApiApi();
final creditCardCommand = CreditCardCommand(); // CreditCardCommand | 

try {
    final result = api_instance.apiCreditcardUpsertPost(creditCardCommand);
    print(result);
} catch (e) {
    print('Exception when calling PoseidonApiApi->apiCreditcardUpsertPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **creditCardCommand** | [**CreditCardCommand**](CreditCardCommand.md)|  | 

### Return type

**int**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiDeliveryDeleteDelete**
> int apiDeliveryDeleteDelete(id)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = PoseidonApiApi();
final id = 56; // int | 

try {
    final result = api_instance.apiDeliveryDeleteDelete(id);
    print(result);
} catch (e) {
    print('Exception when calling PoseidonApiApi->apiDeliveryDeleteDelete: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

**int**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiDeliveryQueryGet**
> DeliveryDtoResponseData apiDeliveryQueryGet(page, pageSize, filter, orderBy)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = PoseidonApiApi();
final page = 56; // int | 
final pageSize = 56; // int | 
final filter = filter_example; // String | 
final orderBy = orderBy_example; // String | 

try {
    final result = api_instance.apiDeliveryQueryGet(page, pageSize, filter, orderBy);
    print(result);
} catch (e) {
    print('Exception when calling PoseidonApiApi->apiDeliveryQueryGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **int**|  | [default to 1]
 **pageSize** | **int**|  | [default to 1000]
 **filter** | **String**|  | [optional] 
 **orderBy** | **String**|  | [optional] [default to 'Sys_UpdatedAt']

### Return type

[**DeliveryDtoResponseData**](DeliveryDtoResponseData.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiDeliveryUpsertPost**
> int apiDeliveryUpsertPost(deliveryCommand)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = PoseidonApiApi();
final deliveryCommand = DeliveryCommand(); // DeliveryCommand | 

try {
    final result = api_instance.apiDeliveryUpsertPost(deliveryCommand);
    print(result);
} catch (e) {
    print('Exception when calling PoseidonApiApi->apiDeliveryUpsertPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **deliveryCommand** | [**DeliveryCommand**](DeliveryCommand.md)|  | 

### Return type

**int**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiDiscountofferDeleteDelete**
> int apiDiscountofferDeleteDelete(id)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = PoseidonApiApi();
final id = 56; // int | 

try {
    final result = api_instance.apiDiscountofferDeleteDelete(id);
    print(result);
} catch (e) {
    print('Exception when calling PoseidonApiApi->apiDiscountofferDeleteDelete: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

**int**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiDiscountofferQueryGet**
> DiscountOfferDtoResponseData apiDiscountofferQueryGet(page, pageSize, filter, orderBy)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = PoseidonApiApi();
final page = 56; // int | 
final pageSize = 56; // int | 
final filter = filter_example; // String | 
final orderBy = orderBy_example; // String | 

try {
    final result = api_instance.apiDiscountofferQueryGet(page, pageSize, filter, orderBy);
    print(result);
} catch (e) {
    print('Exception when calling PoseidonApiApi->apiDiscountofferQueryGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **int**|  | [default to 1]
 **pageSize** | **int**|  | [default to 1000]
 **filter** | **String**|  | [optional] 
 **orderBy** | **String**|  | [optional] [default to 'Sys_UpdatedAt']

### Return type

[**DiscountOfferDtoResponseData**](DiscountOfferDtoResponseData.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiDiscountofferUpsertPost**
> int apiDiscountofferUpsertPost(discountOfferCommand)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = PoseidonApiApi();
final discountOfferCommand = DiscountOfferCommand(); // DiscountOfferCommand | 

try {
    final result = api_instance.apiDiscountofferUpsertPost(discountOfferCommand);
    print(result);
} catch (e) {
    print('Exception when calling PoseidonApiApi->apiDiscountofferUpsertPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **discountOfferCommand** | [**DiscountOfferCommand**](DiscountOfferCommand.md)|  | 

### Return type

**int**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiOfferProductsGet**
> ProductDtoResponseData apiOfferProductsGet(offerId, page, pageSize, filter, orderBy)

Return discount offer products



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = PoseidonApiApi();
final offerId = 56; // int | 
final page = 56; // int | 
final pageSize = 56; // int | 
final filter = filter_example; // String | 
final orderBy = orderBy_example; // String | 

try {
    final result = api_instance.apiOfferProductsGet(offerId, page, pageSize, filter, orderBy);
    print(result);
} catch (e) {
    print('Exception when calling PoseidonApiApi->apiOfferProductsGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **offerId** | **int**|  | 
 **page** | **int**|  | [default to 1]
 **pageSize** | **int**|  | [default to 1000]
 **filter** | **String**|  | [optional] 
 **orderBy** | **String**|  | [optional] [default to 'Sys_UpdatedAt']

### Return type

[**ProductDtoResponseData**](ProductDtoResponseData.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiOrderCreatePost**
> OrderDto apiOrderCreatePost(cartId, deliveryId, paymentMethod)

New order for cart

This method accepts cart Id  and will create and order and calculate prices. After proccess is done will return order Id

### Example
```dart
import 'package:openapi/api.dart';

final api_instance = PoseidonApiApi();
final cartId = 56; // int | 
final deliveryId = 56; // int | 
final paymentMethod = paymentMethod_example; // String | 

try {
    final result = api_instance.apiOrderCreatePost(cartId, deliveryId, paymentMethod);
    print(result);
} catch (e) {
    print('Exception when calling PoseidonApiApi->apiOrderCreatePost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **cartId** | **int**|  | 
 **deliveryId** | **int**|  | [optional] 
 **paymentMethod** | **String**|  | [optional] 

### Return type

[**OrderDto**](OrderDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiOrderDeleteDelete**
> int apiOrderDeleteDelete(id)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = PoseidonApiApi();
final id = 56; // int | 

try {
    final result = api_instance.apiOrderDeleteDelete(id);
    print(result);
} catch (e) {
    print('Exception when calling PoseidonApiApi->apiOrderDeleteDelete: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

**int**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiOrderQueryGet**
> OrderDtoResponseData apiOrderQueryGet(page, pageSize, filter, orderBy)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = PoseidonApiApi();
final page = 56; // int | 
final pageSize = 56; // int | 
final filter = filter_example; // String | 
final orderBy = orderBy_example; // String | 

try {
    final result = api_instance.apiOrderQueryGet(page, pageSize, filter, orderBy);
    print(result);
} catch (e) {
    print('Exception when calling PoseidonApiApi->apiOrderQueryGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **int**|  | [default to 1]
 **pageSize** | **int**|  | [default to 1000]
 **filter** | **String**|  | [optional] 
 **orderBy** | **String**|  | [optional] [default to 'Sys_UpdatedAt']

### Return type

[**OrderDtoResponseData**](OrderDtoResponseData.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiOrderUpsertPost**
> int apiOrderUpsertPost(orderCommand)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = PoseidonApiApi();
final orderCommand = OrderCommand(); // OrderCommand | 

try {
    final result = api_instance.apiOrderUpsertPost(orderCommand);
    print(result);
} catch (e) {
    print('Exception when calling PoseidonApiApi->apiOrderUpsertPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **orderCommand** | [**OrderCommand**](OrderCommand.md)|  | 

### Return type

**int**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiOrderitemDeleteDelete**
> int apiOrderitemDeleteDelete(id)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = PoseidonApiApi();
final id = 56; // int | 

try {
    final result = api_instance.apiOrderitemDeleteDelete(id);
    print(result);
} catch (e) {
    print('Exception when calling PoseidonApiApi->apiOrderitemDeleteDelete: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

**int**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiOrderitemDetailsGet**
> OrderItemDetailsDtoResponseData apiOrderitemDetailsGet(page, pageSize, filter, orderBy)

Returns more details for order item



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = PoseidonApiApi();
final page = 56; // int | 
final pageSize = 56; // int | 
final filter = filter_example; // String | 
final orderBy = orderBy_example; // String | 

try {
    final result = api_instance.apiOrderitemDetailsGet(page, pageSize, filter, orderBy);
    print(result);
} catch (e) {
    print('Exception when calling PoseidonApiApi->apiOrderitemDetailsGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **int**|  | [default to 1]
 **pageSize** | **int**|  | [default to 1000]
 **filter** | **String**|  | [optional] 
 **orderBy** | **String**|  | [optional] [default to 'Sys_UpdatedAt']

### Return type

[**OrderItemDetailsDtoResponseData**](OrderItemDetailsDtoResponseData.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiOrderitemQueryGet**
> OrderItemDtoResponseData apiOrderitemQueryGet(page, pageSize, filter, orderBy)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = PoseidonApiApi();
final page = 56; // int | 
final pageSize = 56; // int | 
final filter = filter_example; // String | 
final orderBy = orderBy_example; // String | 

try {
    final result = api_instance.apiOrderitemQueryGet(page, pageSize, filter, orderBy);
    print(result);
} catch (e) {
    print('Exception when calling PoseidonApiApi->apiOrderitemQueryGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **int**|  | [default to 1]
 **pageSize** | **int**|  | [default to 1000]
 **filter** | **String**|  | [optional] 
 **orderBy** | **String**|  | [optional] [default to 'Sys_UpdatedAt']

### Return type

[**OrderItemDtoResponseData**](OrderItemDtoResponseData.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiOrderitemUpsertPost**
> int apiOrderitemUpsertPost(orderItemCommand)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = PoseidonApiApi();
final orderItemCommand = OrderItemCommand(); // OrderItemCommand | 

try {
    final result = api_instance.apiOrderitemUpsertPost(orderItemCommand);
    print(result);
} catch (e) {
    print('Exception when calling PoseidonApiApi->apiOrderitemUpsertPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **orderItemCommand** | [**OrderItemCommand**](OrderItemCommand.md)|  | 

### Return type

**int**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiPaymentDeleteDelete**
> int apiPaymentDeleteDelete(id)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = PoseidonApiApi();
final id = 56; // int | 

try {
    final result = api_instance.apiPaymentDeleteDelete(id);
    print(result);
} catch (e) {
    print('Exception when calling PoseidonApiApi->apiPaymentDeleteDelete: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

**int**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiPaymentQueryGet**
> PaymentDtoResponseData apiPaymentQueryGet(page, pageSize, filter, orderBy)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = PoseidonApiApi();
final page = 56; // int | 
final pageSize = 56; // int | 
final filter = filter_example; // String | 
final orderBy = orderBy_example; // String | 

try {
    final result = api_instance.apiPaymentQueryGet(page, pageSize, filter, orderBy);
    print(result);
} catch (e) {
    print('Exception when calling PoseidonApiApi->apiPaymentQueryGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **int**|  | [default to 1]
 **pageSize** | **int**|  | [default to 1000]
 **filter** | **String**|  | [optional] 
 **orderBy** | **String**|  | [optional] [default to 'Sys_UpdatedAt']

### Return type

[**PaymentDtoResponseData**](PaymentDtoResponseData.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiPaymentUpsertPost**
> int apiPaymentUpsertPost(paymentCommand)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = PoseidonApiApi();
final paymentCommand = PaymentCommand(); // PaymentCommand | 

try {
    final result = api_instance.apiPaymentUpsertPost(paymentCommand);
    print(result);
} catch (e) {
    print('Exception when calling PoseidonApiApi->apiPaymentUpsertPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **paymentCommand** | [**PaymentCommand**](PaymentCommand.md)|  | 

### Return type

**int**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiPaymentproviderDeleteDelete**
> int apiPaymentproviderDeleteDelete(id)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = PoseidonApiApi();
final id = 56; // int | 

try {
    final result = api_instance.apiPaymentproviderDeleteDelete(id);
    print(result);
} catch (e) {
    print('Exception when calling PoseidonApiApi->apiPaymentproviderDeleteDelete: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

**int**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiPaymentproviderQueryGet**
> PaymentProviderDtoResponseData apiPaymentproviderQueryGet(page, pageSize, filter, orderBy)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = PoseidonApiApi();
final page = 56; // int | 
final pageSize = 56; // int | 
final filter = filter_example; // String | 
final orderBy = orderBy_example; // String | 

try {
    final result = api_instance.apiPaymentproviderQueryGet(page, pageSize, filter, orderBy);
    print(result);
} catch (e) {
    print('Exception when calling PoseidonApiApi->apiPaymentproviderQueryGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **int**|  | [default to 1]
 **pageSize** | **int**|  | [default to 1000]
 **filter** | **String**|  | [optional] 
 **orderBy** | **String**|  | [optional] [default to 'Sys_UpdatedAt']

### Return type

[**PaymentProviderDtoResponseData**](PaymentProviderDtoResponseData.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiPaymentproviderUpsertPost**
> int apiPaymentproviderUpsertPost(paymentProviderCommand)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = PoseidonApiApi();
final paymentProviderCommand = PaymentProviderCommand(); // PaymentProviderCommand | 

try {
    final result = api_instance.apiPaymentproviderUpsertPost(paymentProviderCommand);
    print(result);
} catch (e) {
    print('Exception when calling PoseidonApiApi->apiPaymentproviderUpsertPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **paymentProviderCommand** | [**PaymentProviderCommand**](PaymentProviderCommand.md)|  | 

### Return type

**int**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiProductDeleteDelete**
> int apiProductDeleteDelete(id)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = PoseidonApiApi();
final id = 56; // int | 

try {
    final result = api_instance.apiProductDeleteDelete(id);
    print(result);
} catch (e) {
    print('Exception when calling PoseidonApiApi->apiProductDeleteDelete: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

**int**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiProductQueryGet**
> ProductDtoResponseData apiProductQueryGet(page, pageSize, filter, orderBy)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = PoseidonApiApi();
final page = 56; // int | 
final pageSize = 56; // int | 
final filter = filter_example; // String | 
final orderBy = orderBy_example; // String | 

try {
    final result = api_instance.apiProductQueryGet(page, pageSize, filter, orderBy);
    print(result);
} catch (e) {
    print('Exception when calling PoseidonApiApi->apiProductQueryGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **int**|  | [default to 1]
 **pageSize** | **int**|  | [default to 1000]
 **filter** | **String**|  | [optional] 
 **orderBy** | **String**|  | [optional] [default to 'Sys_UpdatedAt']

### Return type

[**ProductDtoResponseData**](ProductDtoResponseData.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiProductUpsertPost**
> int apiProductUpsertPost(productCommand)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = PoseidonApiApi();
final productCommand = ProductCommand(); // ProductCommand | 

try {
    final result = api_instance.apiProductUpsertPost(productCommand);
    print(result);
} catch (e) {
    print('Exception when calling PoseidonApiApi->apiProductUpsertPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **productCommand** | [**ProductCommand**](ProductCommand.md)|  | 

### Return type

**int**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiProductdiscountofferDeleteDelete**
> int apiProductdiscountofferDeleteDelete(id)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = PoseidonApiApi();
final id = 56; // int | 

try {
    final result = api_instance.apiProductdiscountofferDeleteDelete(id);
    print(result);
} catch (e) {
    print('Exception when calling PoseidonApiApi->apiProductdiscountofferDeleteDelete: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

**int**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiProductdiscountofferQueryGet**
> ProductDiscountOfferDtoResponseData apiProductdiscountofferQueryGet(page, pageSize, filter, orderBy)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = PoseidonApiApi();
final page = 56; // int | 
final pageSize = 56; // int | 
final filter = filter_example; // String | 
final orderBy = orderBy_example; // String | 

try {
    final result = api_instance.apiProductdiscountofferQueryGet(page, pageSize, filter, orderBy);
    print(result);
} catch (e) {
    print('Exception when calling PoseidonApiApi->apiProductdiscountofferQueryGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **int**|  | [default to 1]
 **pageSize** | **int**|  | [default to 1000]
 **filter** | **String**|  | [optional] 
 **orderBy** | **String**|  | [optional] [default to 'Sys_UpdatedAt']

### Return type

[**ProductDiscountOfferDtoResponseData**](ProductDiscountOfferDtoResponseData.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiProductdiscountofferUpsertPost**
> int apiProductdiscountofferUpsertPost(productDiscountOfferCommand)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = PoseidonApiApi();
final productDiscountOfferCommand = ProductDiscountOfferCommand(); // ProductDiscountOfferCommand | 

try {
    final result = api_instance.apiProductdiscountofferUpsertPost(productDiscountOfferCommand);
    print(result);
} catch (e) {
    print('Exception when calling PoseidonApiApi->apiProductdiscountofferUpsertPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **productDiscountOfferCommand** | [**ProductDiscountOfferCommand**](ProductDiscountOfferCommand.md)|  | 

### Return type

**int**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiRecommendProductsGet**
> ProductDtoResponseData apiRecommendProductsGet(page, pageSize, filter, orderBy)

Returns list of recommended products for user that calls endpoint based on the last reviewed product



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = PoseidonApiApi();
final page = 56; // int | 
final pageSize = 56; // int | 
final filter = filter_example; // String | 
final orderBy = orderBy_example; // String | 

try {
    final result = api_instance.apiRecommendProductsGet(page, pageSize, filter, orderBy);
    print(result);
} catch (e) {
    print('Exception when calling PoseidonApiApi->apiRecommendProductsGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **int**|  | [default to 1]
 **pageSize** | **int**|  | [default to 1000]
 **filter** | **String**|  | [optional] 
 **orderBy** | **String**|  | [optional] [default to 'Sys_UpdatedAt']

### Return type

[**ProductDtoResponseData**](ProductDtoResponseData.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiSettingsDeleteDelete**
> int apiSettingsDeleteDelete(id)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = PoseidonApiApi();
final id = 56; // int | 

try {
    final result = api_instance.apiSettingsDeleteDelete(id);
    print(result);
} catch (e) {
    print('Exception when calling PoseidonApiApi->apiSettingsDeleteDelete: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

**int**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiSettingsQueryGet**
> SettingsDtoResponseData apiSettingsQueryGet(page, pageSize, filter, orderBy)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = PoseidonApiApi();
final page = 56; // int | 
final pageSize = 56; // int | 
final filter = filter_example; // String | 
final orderBy = orderBy_example; // String | 

try {
    final result = api_instance.apiSettingsQueryGet(page, pageSize, filter, orderBy);
    print(result);
} catch (e) {
    print('Exception when calling PoseidonApiApi->apiSettingsQueryGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **int**|  | [default to 1]
 **pageSize** | **int**|  | [default to 1000]
 **filter** | **String**|  | [optional] 
 **orderBy** | **String**|  | [optional] [default to 'Sys_UpdatedAt']

### Return type

[**SettingsDtoResponseData**](SettingsDtoResponseData.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiSettingsUpsertPost**
> int apiSettingsUpsertPost(settingsCommand)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = PoseidonApiApi();
final settingsCommand = SettingsCommand(); // SettingsCommand | 

try {
    final result = api_instance.apiSettingsUpsertPost(settingsCommand);
    print(result);
} catch (e) {
    print('Exception when calling PoseidonApiApi->apiSettingsUpsertPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **settingsCommand** | [**SettingsCommand**](SettingsCommand.md)|  | 

### Return type

**int**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiStripePayPost**
> String apiStripePayPost(orderId, cardId, deliveryId)

Stripe payment for order

Accepts order id and credit card id 

### Example
```dart
import 'package:openapi/api.dart';

final api_instance = PoseidonApiApi();
final orderId = 56; // int | 
final cardId = 56; // int | 
final deliveryId = 56; // int | 

try {
    final result = api_instance.apiStripePayPost(orderId, cardId, deliveryId);
    print(result);
} catch (e) {
    print('Exception when calling PoseidonApiApi->apiStripePayPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **orderId** | **int**|  | 
 **cardId** | **int**|  | 
 **deliveryId** | **int**|  | 

### Return type

**String**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiTaxrateDeleteDelete**
> int apiTaxrateDeleteDelete(id)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = PoseidonApiApi();
final id = 56; // int | 

try {
    final result = api_instance.apiTaxrateDeleteDelete(id);
    print(result);
} catch (e) {
    print('Exception when calling PoseidonApiApi->apiTaxrateDeleteDelete: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

**int**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiTaxrateQueryGet**
> TaxRateDtoResponseData apiTaxrateQueryGet(page, pageSize, filter, orderBy)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = PoseidonApiApi();
final page = 56; // int | 
final pageSize = 56; // int | 
final filter = filter_example; // String | 
final orderBy = orderBy_example; // String | 

try {
    final result = api_instance.apiTaxrateQueryGet(page, pageSize, filter, orderBy);
    print(result);
} catch (e) {
    print('Exception when calling PoseidonApiApi->apiTaxrateQueryGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **int**|  | [default to 1]
 **pageSize** | **int**|  | [default to 1000]
 **filter** | **String**|  | [optional] 
 **orderBy** | **String**|  | [optional] [default to 'Sys_UpdatedAt']

### Return type

[**TaxRateDtoResponseData**](TaxRateDtoResponseData.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiTaxrateUpsertPost**
> int apiTaxrateUpsertPost(taxRateCommand)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = PoseidonApiApi();
final taxRateCommand = TaxRateCommand(); // TaxRateCommand | 

try {
    final result = api_instance.apiTaxrateUpsertPost(taxRateCommand);
    print(result);
} catch (e) {
    print('Exception when calling PoseidonApiApi->apiTaxrateUpsertPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **taxRateCommand** | [**TaxRateCommand**](TaxRateCommand.md)|  | 

### Return type

**int**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiUserDeleteDelete**
> int apiUserDeleteDelete(id)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = PoseidonApiApi();
final id = 56; // int | 

try {
    final result = api_instance.apiUserDeleteDelete(id);
    print(result);
} catch (e) {
    print('Exception when calling PoseidonApiApi->apiUserDeleteDelete: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

**int**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiUserDetailsGet**
> UserDetailsDtoResponseData apiUserDetailsGet()

Returns user details based on emil claim



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = PoseidonApiApi();

try {
    final result = api_instance.apiUserDetailsGet();
    print(result);
} catch (e) {
    print('Exception when calling PoseidonApiApi->apiUserDetailsGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**UserDetailsDtoResponseData**](UserDetailsDtoResponseData.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiUserQueryGet**
> UserDtoResponseData apiUserQueryGet(page, pageSize, filter, orderBy)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = PoseidonApiApi();
final page = 56; // int | 
final pageSize = 56; // int | 
final filter = filter_example; // String | 
final orderBy = orderBy_example; // String | 

try {
    final result = api_instance.apiUserQueryGet(page, pageSize, filter, orderBy);
    print(result);
} catch (e) {
    print('Exception when calling PoseidonApiApi->apiUserQueryGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **int**|  | [default to 1]
 **pageSize** | **int**|  | [default to 1000]
 **filter** | **String**|  | [optional] 
 **orderBy** | **String**|  | [optional] [default to 'Sys_UpdatedAt']

### Return type

[**UserDtoResponseData**](UserDtoResponseData.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiUserUpsertPost**
> int apiUserUpsertPost(userCommand)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = PoseidonApiApi();
final userCommand = UserCommand(); // UserCommand | 

try {
    final result = api_instance.apiUserUpsertPost(userCommand);
    print(result);
} catch (e) {
    print('Exception when calling PoseidonApiApi->apiUserUpsertPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userCommand** | [**UserCommand**](UserCommand.md)|  | 

### Return type

**int**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiUserproductreviewDeleteDelete**
> int apiUserproductreviewDeleteDelete(id)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = PoseidonApiApi();
final id = 56; // int | 

try {
    final result = api_instance.apiUserproductreviewDeleteDelete(id);
    print(result);
} catch (e) {
    print('Exception when calling PoseidonApiApi->apiUserproductreviewDeleteDelete: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

**int**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiUserproductreviewQueryGet**
> UserProductReviewDtoResponseData apiUserproductreviewQueryGet(page, pageSize, filter, orderBy)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = PoseidonApiApi();
final page = 56; // int | 
final pageSize = 56; // int | 
final filter = filter_example; // String | 
final orderBy = orderBy_example; // String | 

try {
    final result = api_instance.apiUserproductreviewQueryGet(page, pageSize, filter, orderBy);
    print(result);
} catch (e) {
    print('Exception when calling PoseidonApiApi->apiUserproductreviewQueryGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **int**|  | [default to 1]
 **pageSize** | **int**|  | [default to 1000]
 **filter** | **String**|  | [optional] 
 **orderBy** | **String**|  | [optional] [default to 'Sys_UpdatedAt']

### Return type

[**UserProductReviewDtoResponseData**](UserProductReviewDtoResponseData.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiUserproductreviewUpsertPost**
> int apiUserproductreviewUpsertPost(userProductReviewCommand)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = PoseidonApiApi();
final userProductReviewCommand = UserProductReviewCommand(); // UserProductReviewCommand | 

try {
    final result = api_instance.apiUserproductreviewUpsertPost(userProductReviewCommand);
    print(result);
} catch (e) {
    print('Exception when calling PoseidonApiApi->apiUserproductreviewUpsertPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userProductReviewCommand** | [**UserProductReviewCommand**](UserProductReviewCommand.md)|  | 

### Return type

**int**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiWishlistDeleteDelete**
> int apiWishlistDeleteDelete(id)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = PoseidonApiApi();
final id = 56; // int | 

try {
    final result = api_instance.apiWishlistDeleteDelete(id);
    print(result);
} catch (e) {
    print('Exception when calling PoseidonApiApi->apiWishlistDeleteDelete: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

**int**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiWishlistDetailsGet**
> WishListDetailsDtoResponseData apiWishlistDetailsGet(userId)

Returns user wish list details based by user id



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = PoseidonApiApi();
final userId = 56; // int | 

try {
    final result = api_instance.apiWishlistDetailsGet(userId);
    print(result);
} catch (e) {
    print('Exception when calling PoseidonApiApi->apiWishlistDetailsGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userId** | **int**|  | [optional] 

### Return type

[**WishListDetailsDtoResponseData**](WishListDetailsDtoResponseData.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiWishlistQueryGet**
> WishListDtoResponseData apiWishlistQueryGet(page, pageSize, filter, orderBy)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = PoseidonApiApi();
final page = 56; // int | 
final pageSize = 56; // int | 
final filter = filter_example; // String | 
final orderBy = orderBy_example; // String | 

try {
    final result = api_instance.apiWishlistQueryGet(page, pageSize, filter, orderBy);
    print(result);
} catch (e) {
    print('Exception when calling PoseidonApiApi->apiWishlistQueryGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **int**|  | [default to 1]
 **pageSize** | **int**|  | [default to 1000]
 **filter** | **String**|  | [optional] 
 **orderBy** | **String**|  | [optional] [default to 'Sys_UpdatedAt']

### Return type

[**WishListDtoResponseData**](WishListDtoResponseData.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiWishlistUpsertPost**
> int apiWishlistUpsertPost(wishListCommand)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = PoseidonApiApi();
final wishListCommand = WishListCommand(); // WishListCommand | 

try {
    final result = api_instance.apiWishlistUpsertPost(wishListCommand);
    print(result);
} catch (e) {
    print('Exception when calling PoseidonApiApi->apiWishlistUpsertPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **wishListCommand** | [**WishListCommand**](WishListCommand.md)|  | 

### Return type

**int**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiWishlistitemDeleteDelete**
> int apiWishlistitemDeleteDelete(id)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = PoseidonApiApi();
final id = 56; // int | 

try {
    final result = api_instance.apiWishlistitemDeleteDelete(id);
    print(result);
} catch (e) {
    print('Exception when calling PoseidonApiApi->apiWishlistitemDeleteDelete: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

**int**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiWishlistitemQueryGet**
> WishListItemDtoResponseData apiWishlistitemQueryGet(page, pageSize, filter, orderBy)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = PoseidonApiApi();
final page = 56; // int | 
final pageSize = 56; // int | 
final filter = filter_example; // String | 
final orderBy = orderBy_example; // String | 

try {
    final result = api_instance.apiWishlistitemQueryGet(page, pageSize, filter, orderBy);
    print(result);
} catch (e) {
    print('Exception when calling PoseidonApiApi->apiWishlistitemQueryGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **int**|  | [default to 1]
 **pageSize** | **int**|  | [default to 1000]
 **filter** | **String**|  | [optional] 
 **orderBy** | **String**|  | [optional] [default to 'Sys_UpdatedAt']

### Return type

[**WishListItemDtoResponseData**](WishListItemDtoResponseData.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiWishlistitemUpsertPost**
> int apiWishlistitemUpsertPost(wishListItemCommand)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = PoseidonApiApi();
final wishListItemCommand = WishListItemCommand(); // WishListItemCommand | 

try {
    final result = api_instance.apiWishlistitemUpsertPost(wishListItemCommand);
    print(result);
} catch (e) {
    print('Exception when calling PoseidonApiApi->apiWishlistitemUpsertPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **wishListItemCommand** | [**WishListItemCommand**](WishListItemCommand.md)|  | 

### Return type

**int**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

