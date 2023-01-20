//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class PoseidonApiApi {
  PoseidonApiApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Performs an HTTP 'DELETE /api/address/delete' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] id (required):
  Future<Response> apiAddressDeleteDeleteWithHttpInfo(int id,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/address/delete';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

      queryParams.addAll(_queryParams('', 'Id', id));

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'DELETE',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [int] id (required):
  Future<int?> apiAddressDeleteDelete(int id,) async {
    final response = await apiAddressDeleteDeleteWithHttpInfo(id,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'int',) as int;
    
    }
    return null;
  }

  /// Performs an HTTP 'GET /api/address/query' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] page (required):
  ///
  /// * [int] pageSize (required):
  ///
  /// * [String] filter:
  ///
  /// * [String] orderBy:
  Future<Response> apiAddressQueryGetWithHttpInfo(int page, int pageSize, { String? filter, String? orderBy, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/address/query';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

      queryParams.addAll(_queryParams('', 'Page', page));
      queryParams.addAll(_queryParams('', 'PageSize', pageSize));
    if (filter != null) {
      queryParams.addAll(_queryParams('', 'Filter', filter));
    }
    if (orderBy != null) {
      queryParams.addAll(_queryParams('', 'OrderBy', orderBy));
    }

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [int] page (required):
  ///
  /// * [int] pageSize (required):
  ///
  /// * [String] filter:
  ///
  /// * [String] orderBy:
  Future<AddressDtoResponseData?> apiAddressQueryGet(int page, int pageSize, { String? filter, String? orderBy, }) async {
    final response = await apiAddressQueryGetWithHttpInfo(page, pageSize,  filter: filter, orderBy: orderBy, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'AddressDtoResponseData',) as AddressDtoResponseData;
    
    }
    return null;
  }

  /// Performs an HTTP 'POST /api/address/upsert' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [AddressCommand] addressCommand (required):
  Future<Response> apiAddressUpsertPostWithHttpInfo(AddressCommand addressCommand,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/address/upsert';

    // ignore: prefer_final_locals
    Object? postBody = addressCommand;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];


    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [AddressCommand] addressCommand (required):
  Future<int?> apiAddressUpsertPost(AddressCommand addressCommand,) async {
    final response = await apiAddressUpsertPostWithHttpInfo(addressCommand,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'int',) as int;
    
    }
    return null;
  }

  /// Return best seller products based on ordered quantity
  ///
  /// 
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] page (required):
  ///
  /// * [int] pageSize (required):
  ///
  /// * [String] filter:
  ///
  /// * [String] orderBy:
  Future<Response> apiBestsellerProductsGetWithHttpInfo(int page, int pageSize, { String? filter, String? orderBy, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/bestseller/products';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

      queryParams.addAll(_queryParams('', 'Page', page));
      queryParams.addAll(_queryParams('', 'PageSize', pageSize));
    if (filter != null) {
      queryParams.addAll(_queryParams('', 'Filter', filter));
    }
    if (orderBy != null) {
      queryParams.addAll(_queryParams('', 'OrderBy', orderBy));
    }

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Return best seller products based on ordered quantity
  ///
  /// 
  ///
  /// Parameters:
  ///
  /// * [int] page (required):
  ///
  /// * [int] pageSize (required):
  ///
  /// * [String] filter:
  ///
  /// * [String] orderBy:
  Future<ProductDtoResponseData?> apiBestsellerProductsGet(int page, int pageSize, { String? filter, String? orderBy, }) async {
    final response = await apiBestsellerProductsGetWithHttpInfo(page, pageSize,  filter: filter, orderBy: orderBy, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ProductDtoResponseData',) as ProductDtoResponseData;
    
    }
    return null;
  }

  /// Performs an HTTP 'DELETE /api/cart/delete' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] id (required):
  Future<Response> apiCartDeleteDeleteWithHttpInfo(int id,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/cart/delete';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

      queryParams.addAll(_queryParams('', 'Id', id));

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'DELETE',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [int] id (required):
  Future<int?> apiCartDeleteDelete(int id,) async {
    final response = await apiCartDeleteDeleteWithHttpInfo(id,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'int',) as int;
    
    }
    return null;
  }

  /// Return users active cart with cart items if exists, if not new cart will be created and returned
  ///
  /// 
  ///
  /// Note: This method returns the HTTP [Response].
  Future<Response> apiCartDetailsGetWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/api/cart/details';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Return users active cart with cart items if exists, if not new cart will be created and returned
  ///
  /// 
  Future<CartDetailsDtoResponseData?> apiCartDetailsGet() async {
    final response = await apiCartDetailsGetWithHttpInfo();
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'CartDetailsDtoResponseData',) as CartDetailsDtoResponseData;
    
    }
    return null;
  }

  /// Performs an HTTP 'GET /api/cart/query' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] page (required):
  ///
  /// * [int] pageSize (required):
  ///
  /// * [String] filter:
  ///
  /// * [String] orderBy:
  Future<Response> apiCartQueryGetWithHttpInfo(int page, int pageSize, { String? filter, String? orderBy, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/cart/query';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

      queryParams.addAll(_queryParams('', 'Page', page));
      queryParams.addAll(_queryParams('', 'PageSize', pageSize));
    if (filter != null) {
      queryParams.addAll(_queryParams('', 'Filter', filter));
    }
    if (orderBy != null) {
      queryParams.addAll(_queryParams('', 'OrderBy', orderBy));
    }

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [int] page (required):
  ///
  /// * [int] pageSize (required):
  ///
  /// * [String] filter:
  ///
  /// * [String] orderBy:
  Future<CartDtoResponseData?> apiCartQueryGet(int page, int pageSize, { String? filter, String? orderBy, }) async {
    final response = await apiCartQueryGetWithHttpInfo(page, pageSize,  filter: filter, orderBy: orderBy, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'CartDtoResponseData',) as CartDtoResponseData;
    
    }
    return null;
  }

  /// Performs an HTTP 'POST /api/cart/upsert' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [CartCommand] cartCommand (required):
  Future<Response> apiCartUpsertPostWithHttpInfo(CartCommand cartCommand,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/cart/upsert';

    // ignore: prefer_final_locals
    Object? postBody = cartCommand;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];


    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [CartCommand] cartCommand (required):
  Future<int?> apiCartUpsertPost(CartCommand cartCommand,) async {
    final response = await apiCartUpsertPostWithHttpInfo(cartCommand,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'int',) as int;
    
    }
    return null;
  }

  /// Performs an HTTP 'DELETE /api/cartitem/delete' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] id (required):
  Future<Response> apiCartitemDeleteDeleteWithHttpInfo(int id,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/cartitem/delete';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

      queryParams.addAll(_queryParams('', 'Id', id));

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'DELETE',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [int] id (required):
  Future<int?> apiCartitemDeleteDelete(int id,) async {
    final response = await apiCartitemDeleteDeleteWithHttpInfo(id,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'int',) as int;
    
    }
    return null;
  }

  /// Performs an HTTP 'GET /api/cartitem/query' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] page (required):
  ///
  /// * [int] pageSize (required):
  ///
  /// * [String] filter:
  ///
  /// * [String] orderBy:
  Future<Response> apiCartitemQueryGetWithHttpInfo(int page, int pageSize, { String? filter, String? orderBy, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/cartitem/query';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

      queryParams.addAll(_queryParams('', 'Page', page));
      queryParams.addAll(_queryParams('', 'PageSize', pageSize));
    if (filter != null) {
      queryParams.addAll(_queryParams('', 'Filter', filter));
    }
    if (orderBy != null) {
      queryParams.addAll(_queryParams('', 'OrderBy', orderBy));
    }

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [int] page (required):
  ///
  /// * [int] pageSize (required):
  ///
  /// * [String] filter:
  ///
  /// * [String] orderBy:
  Future<CartItemDtoResponseData?> apiCartitemQueryGet(int page, int pageSize, { String? filter, String? orderBy, }) async {
    final response = await apiCartitemQueryGetWithHttpInfo(page, pageSize,  filter: filter, orderBy: orderBy, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'CartItemDtoResponseData',) as CartItemDtoResponseData;
    
    }
    return null;
  }

  /// Performs an HTTP 'POST /api/cartitem/upsert' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [CartItemCommand] cartItemCommand (required):
  Future<Response> apiCartitemUpsertPostWithHttpInfo(CartItemCommand cartItemCommand,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/cartitem/upsert';

    // ignore: prefer_final_locals
    Object? postBody = cartItemCommand;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];


    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [CartItemCommand] cartItemCommand (required):
  Future<int?> apiCartitemUpsertPost(CartItemCommand cartItemCommand,) async {
    final response = await apiCartitemUpsertPostWithHttpInfo(cartItemCommand,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'int',) as int;
    
    }
    return null;
  }

  /// Performs an HTTP 'DELETE /api/category/delete' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] id (required):
  Future<Response> apiCategoryDeleteDeleteWithHttpInfo(int id,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/category/delete';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

      queryParams.addAll(_queryParams('', 'Id', id));

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'DELETE',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [int] id (required):
  Future<int?> apiCategoryDeleteDelete(int id,) async {
    final response = await apiCategoryDeleteDeleteWithHttpInfo(id,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'int',) as int;
    
    }
    return null;
  }

  /// Performs an HTTP 'GET /api/category/query' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] page (required):
  ///
  /// * [int] pageSize (required):
  ///
  /// * [String] filter:
  ///
  /// * [String] orderBy:
  Future<Response> apiCategoryQueryGetWithHttpInfo(int page, int pageSize, { String? filter, String? orderBy, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/category/query';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

      queryParams.addAll(_queryParams('', 'Page', page));
      queryParams.addAll(_queryParams('', 'PageSize', pageSize));
    if (filter != null) {
      queryParams.addAll(_queryParams('', 'Filter', filter));
    }
    if (orderBy != null) {
      queryParams.addAll(_queryParams('', 'OrderBy', orderBy));
    }

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [int] page (required):
  ///
  /// * [int] pageSize (required):
  ///
  /// * [String] filter:
  ///
  /// * [String] orderBy:
  Future<CategoryDtoResponseData?> apiCategoryQueryGet(int page, int pageSize, { String? filter, String? orderBy, }) async {
    final response = await apiCategoryQueryGetWithHttpInfo(page, pageSize,  filter: filter, orderBy: orderBy, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'CategoryDtoResponseData',) as CategoryDtoResponseData;
    
    }
    return null;
  }

  /// Performs an HTTP 'POST /api/category/upsert' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [CategoryCommand] categoryCommand (required):
  Future<Response> apiCategoryUpsertPostWithHttpInfo(CategoryCommand categoryCommand,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/category/upsert';

    // ignore: prefer_final_locals
    Object? postBody = categoryCommand;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];


    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [CategoryCommand] categoryCommand (required):
  Future<int?> apiCategoryUpsertPost(CategoryCommand categoryCommand,) async {
    final response = await apiCategoryUpsertPostWithHttpInfo(categoryCommand,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'int',) as int;
    
    }
    return null;
  }

  /// Performs an HTTP 'DELETE /api/country/delete' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] id (required):
  Future<Response> apiCountryDeleteDeleteWithHttpInfo(int id,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/country/delete';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

      queryParams.addAll(_queryParams('', 'Id', id));

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'DELETE',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [int] id (required):
  Future<int?> apiCountryDeleteDelete(int id,) async {
    final response = await apiCountryDeleteDeleteWithHttpInfo(id,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'int',) as int;
    
    }
    return null;
  }

  /// Performs an HTTP 'GET /api/country/query' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] page (required):
  ///
  /// * [int] pageSize (required):
  ///
  /// * [String] filter:
  ///
  /// * [String] orderBy:
  Future<Response> apiCountryQueryGetWithHttpInfo(int page, int pageSize, { String? filter, String? orderBy, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/country/query';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

      queryParams.addAll(_queryParams('', 'Page', page));
      queryParams.addAll(_queryParams('', 'PageSize', pageSize));
    if (filter != null) {
      queryParams.addAll(_queryParams('', 'Filter', filter));
    }
    if (orderBy != null) {
      queryParams.addAll(_queryParams('', 'OrderBy', orderBy));
    }

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [int] page (required):
  ///
  /// * [int] pageSize (required):
  ///
  /// * [String] filter:
  ///
  /// * [String] orderBy:
  Future<CountryDtoResponseData?> apiCountryQueryGet(int page, int pageSize, { String? filter, String? orderBy, }) async {
    final response = await apiCountryQueryGetWithHttpInfo(page, pageSize,  filter: filter, orderBy: orderBy, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'CountryDtoResponseData',) as CountryDtoResponseData;
    
    }
    return null;
  }

  /// Performs an HTTP 'POST /api/country/upsert' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [CountryCommand] countryCommand (required):
  Future<Response> apiCountryUpsertPostWithHttpInfo(CountryCommand countryCommand,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/country/upsert';

    // ignore: prefer_final_locals
    Object? postBody = countryCommand;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];


    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [CountryCommand] countryCommand (required):
  Future<int?> apiCountryUpsertPost(CountryCommand countryCommand,) async {
    final response = await apiCountryUpsertPostWithHttpInfo(countryCommand,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'int',) as int;
    
    }
    return null;
  }

  /// Performs an HTTP 'DELETE /api/creditcard/delete' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] id (required):
  Future<Response> apiCreditcardDeleteDeleteWithHttpInfo(int id,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/creditcard/delete';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

      queryParams.addAll(_queryParams('', 'Id', id));

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'DELETE',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [int] id (required):
  Future<int?> apiCreditcardDeleteDelete(int id,) async {
    final response = await apiCreditcardDeleteDeleteWithHttpInfo(id,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'int',) as int;
    
    }
    return null;
  }

  /// Performs an HTTP 'GET /api/creditcard/query' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] page (required):
  ///
  /// * [int] pageSize (required):
  ///
  /// * [String] filter:
  ///
  /// * [String] orderBy:
  Future<Response> apiCreditcardQueryGetWithHttpInfo(int page, int pageSize, { String? filter, String? orderBy, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/creditcard/query';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

      queryParams.addAll(_queryParams('', 'Page', page));
      queryParams.addAll(_queryParams('', 'PageSize', pageSize));
    if (filter != null) {
      queryParams.addAll(_queryParams('', 'Filter', filter));
    }
    if (orderBy != null) {
      queryParams.addAll(_queryParams('', 'OrderBy', orderBy));
    }

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [int] page (required):
  ///
  /// * [int] pageSize (required):
  ///
  /// * [String] filter:
  ///
  /// * [String] orderBy:
  Future<CreditCardDtoResponseData?> apiCreditcardQueryGet(int page, int pageSize, { String? filter, String? orderBy, }) async {
    final response = await apiCreditcardQueryGetWithHttpInfo(page, pageSize,  filter: filter, orderBy: orderBy, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'CreditCardDtoResponseData',) as CreditCardDtoResponseData;
    
    }
    return null;
  }

  /// Performs an HTTP 'POST /api/creditcard/upsert' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [CreditCardCommand] creditCardCommand (required):
  Future<Response> apiCreditcardUpsertPostWithHttpInfo(CreditCardCommand creditCardCommand,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/creditcard/upsert';

    // ignore: prefer_final_locals
    Object? postBody = creditCardCommand;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];


    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [CreditCardCommand] creditCardCommand (required):
  Future<int?> apiCreditcardUpsertPost(CreditCardCommand creditCardCommand,) async {
    final response = await apiCreditcardUpsertPostWithHttpInfo(creditCardCommand,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'int',) as int;
    
    }
    return null;
  }

  /// Performs an HTTP 'DELETE /api/delivery/delete' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] id (required):
  Future<Response> apiDeliveryDeleteDeleteWithHttpInfo(int id,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/delivery/delete';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

      queryParams.addAll(_queryParams('', 'Id', id));

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'DELETE',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [int] id (required):
  Future<int?> apiDeliveryDeleteDelete(int id,) async {
    final response = await apiDeliveryDeleteDeleteWithHttpInfo(id,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'int',) as int;
    
    }
    return null;
  }

  /// Performs an HTTP 'GET /api/delivery/query' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] page (required):
  ///
  /// * [int] pageSize (required):
  ///
  /// * [String] filter:
  ///
  /// * [String] orderBy:
  Future<Response> apiDeliveryQueryGetWithHttpInfo(int page, int pageSize, { String? filter, String? orderBy, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/delivery/query';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

      queryParams.addAll(_queryParams('', 'Page', page));
      queryParams.addAll(_queryParams('', 'PageSize', pageSize));
    if (filter != null) {
      queryParams.addAll(_queryParams('', 'Filter', filter));
    }
    if (orderBy != null) {
      queryParams.addAll(_queryParams('', 'OrderBy', orderBy));
    }

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [int] page (required):
  ///
  /// * [int] pageSize (required):
  ///
  /// * [String] filter:
  ///
  /// * [String] orderBy:
  Future<DeliveryDtoResponseData?> apiDeliveryQueryGet(int page, int pageSize, { String? filter, String? orderBy, }) async {
    final response = await apiDeliveryQueryGetWithHttpInfo(page, pageSize,  filter: filter, orderBy: orderBy, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'DeliveryDtoResponseData',) as DeliveryDtoResponseData;
    
    }
    return null;
  }

  /// Performs an HTTP 'POST /api/delivery/upsert' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [DeliveryCommand] deliveryCommand (required):
  Future<Response> apiDeliveryUpsertPostWithHttpInfo(DeliveryCommand deliveryCommand,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/delivery/upsert';

    // ignore: prefer_final_locals
    Object? postBody = deliveryCommand;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];


    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [DeliveryCommand] deliveryCommand (required):
  Future<int?> apiDeliveryUpsertPost(DeliveryCommand deliveryCommand,) async {
    final response = await apiDeliveryUpsertPostWithHttpInfo(deliveryCommand,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'int',) as int;
    
    }
    return null;
  }

  /// Performs an HTTP 'DELETE /api/discountoffer/delete' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] id (required):
  Future<Response> apiDiscountofferDeleteDeleteWithHttpInfo(int id,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/discountoffer/delete';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

      queryParams.addAll(_queryParams('', 'Id', id));

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'DELETE',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [int] id (required):
  Future<int?> apiDiscountofferDeleteDelete(int id,) async {
    final response = await apiDiscountofferDeleteDeleteWithHttpInfo(id,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'int',) as int;
    
    }
    return null;
  }

  /// Performs an HTTP 'GET /api/discountoffer/query' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] page (required):
  ///
  /// * [int] pageSize (required):
  ///
  /// * [String] filter:
  ///
  /// * [String] orderBy:
  Future<Response> apiDiscountofferQueryGetWithHttpInfo(int page, int pageSize, { String? filter, String? orderBy, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/discountoffer/query';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

      queryParams.addAll(_queryParams('', 'Page', page));
      queryParams.addAll(_queryParams('', 'PageSize', pageSize));
    if (filter != null) {
      queryParams.addAll(_queryParams('', 'Filter', filter));
    }
    if (orderBy != null) {
      queryParams.addAll(_queryParams('', 'OrderBy', orderBy));
    }

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [int] page (required):
  ///
  /// * [int] pageSize (required):
  ///
  /// * [String] filter:
  ///
  /// * [String] orderBy:
  Future<DiscountOfferDtoResponseData?> apiDiscountofferQueryGet(int page, int pageSize, { String? filter, String? orderBy, }) async {
    final response = await apiDiscountofferQueryGetWithHttpInfo(page, pageSize,  filter: filter, orderBy: orderBy, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'DiscountOfferDtoResponseData',) as DiscountOfferDtoResponseData;
    
    }
    return null;
  }

  /// Performs an HTTP 'POST /api/discountoffer/upsert' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [DiscountOfferCommand] discountOfferCommand (required):
  Future<Response> apiDiscountofferUpsertPostWithHttpInfo(DiscountOfferCommand discountOfferCommand,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/discountoffer/upsert';

    // ignore: prefer_final_locals
    Object? postBody = discountOfferCommand;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];


    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [DiscountOfferCommand] discountOfferCommand (required):
  Future<int?> apiDiscountofferUpsertPost(DiscountOfferCommand discountOfferCommand,) async {
    final response = await apiDiscountofferUpsertPostWithHttpInfo(discountOfferCommand,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'int',) as int;
    
    }
    return null;
  }

  /// Return discount offer products
  ///
  /// 
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] offerId (required):
  ///
  /// * [int] page (required):
  ///
  /// * [int] pageSize (required):
  ///
  /// * [String] filter:
  ///
  /// * [String] orderBy:
  Future<Response> apiOfferProductsGetWithHttpInfo(int offerId, int page, int pageSize, { String? filter, String? orderBy, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/offer/products';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

      queryParams.addAll(_queryParams('', 'OfferId', offerId));
      queryParams.addAll(_queryParams('', 'Page', page));
      queryParams.addAll(_queryParams('', 'PageSize', pageSize));
    if (filter != null) {
      queryParams.addAll(_queryParams('', 'Filter', filter));
    }
    if (orderBy != null) {
      queryParams.addAll(_queryParams('', 'OrderBy', orderBy));
    }

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Return discount offer products
  ///
  /// 
  ///
  /// Parameters:
  ///
  /// * [int] offerId (required):
  ///
  /// * [int] page (required):
  ///
  /// * [int] pageSize (required):
  ///
  /// * [String] filter:
  ///
  /// * [String] orderBy:
  Future<ProductDtoResponseData?> apiOfferProductsGet(int offerId, int page, int pageSize, { String? filter, String? orderBy, }) async {
    final response = await apiOfferProductsGetWithHttpInfo(offerId, page, pageSize,  filter: filter, orderBy: orderBy, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ProductDtoResponseData',) as ProductDtoResponseData;
    
    }
    return null;
  }

  /// New order for cart
  ///
  /// This method accepts cart Id  and will create and order and calculate prices. After proccess is done will return order Id
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] cartId (required):
  ///
  /// * [int] deliveryId:
  ///
  /// * [String] paymentMethod:
  Future<Response> apiOrderCreatePostWithHttpInfo(int cartId, { int? deliveryId, String? paymentMethod, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/order/create';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

      queryParams.addAll(_queryParams('', 'CartId', cartId));
    if (deliveryId != null) {
      queryParams.addAll(_queryParams('', 'DeliveryId', deliveryId));
    }
    if (paymentMethod != null) {
      queryParams.addAll(_queryParams('', 'PaymentMethod', paymentMethod));
    }

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// New order for cart
  ///
  /// This method accepts cart Id  and will create and order and calculate prices. After proccess is done will return order Id
  ///
  /// Parameters:
  ///
  /// * [int] cartId (required):
  ///
  /// * [int] deliveryId:
  ///
  /// * [String] paymentMethod:
  Future<OrderDto?> apiOrderCreatePost(int cartId, { int? deliveryId, String? paymentMethod, }) async {
    final response = await apiOrderCreatePostWithHttpInfo(cartId,  deliveryId: deliveryId, paymentMethod: paymentMethod, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'OrderDto',) as OrderDto;
    
    }
    return null;
  }

  /// Performs an HTTP 'DELETE /api/order/delete' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] id (required):
  Future<Response> apiOrderDeleteDeleteWithHttpInfo(int id,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/order/delete';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

      queryParams.addAll(_queryParams('', 'Id', id));

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'DELETE',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [int] id (required):
  Future<int?> apiOrderDeleteDelete(int id,) async {
    final response = await apiOrderDeleteDeleteWithHttpInfo(id,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'int',) as int;
    
    }
    return null;
  }

  /// Performs an HTTP 'GET /api/order/query' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] page (required):
  ///
  /// * [int] pageSize (required):
  ///
  /// * [String] filter:
  ///
  /// * [String] orderBy:
  Future<Response> apiOrderQueryGetWithHttpInfo(int page, int pageSize, { String? filter, String? orderBy, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/order/query';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

      queryParams.addAll(_queryParams('', 'Page', page));
      queryParams.addAll(_queryParams('', 'PageSize', pageSize));
    if (filter != null) {
      queryParams.addAll(_queryParams('', 'Filter', filter));
    }
    if (orderBy != null) {
      queryParams.addAll(_queryParams('', 'OrderBy', orderBy));
    }

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [int] page (required):
  ///
  /// * [int] pageSize (required):
  ///
  /// * [String] filter:
  ///
  /// * [String] orderBy:
  Future<OrderDtoResponseData?> apiOrderQueryGet(int page, int pageSize, { String? filter, String? orderBy, }) async {
    final response = await apiOrderQueryGetWithHttpInfo(page, pageSize,  filter: filter, orderBy: orderBy, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'OrderDtoResponseData',) as OrderDtoResponseData;
    
    }
    return null;
  }

  /// Performs an HTTP 'POST /api/order/upsert' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [OrderCommand] orderCommand (required):
  Future<Response> apiOrderUpsertPostWithHttpInfo(OrderCommand orderCommand,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/order/upsert';

    // ignore: prefer_final_locals
    Object? postBody = orderCommand;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];


    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [OrderCommand] orderCommand (required):
  Future<int?> apiOrderUpsertPost(OrderCommand orderCommand,) async {
    final response = await apiOrderUpsertPostWithHttpInfo(orderCommand,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'int',) as int;
    
    }
    return null;
  }

  /// Performs an HTTP 'DELETE /api/orderitem/delete' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] id (required):
  Future<Response> apiOrderitemDeleteDeleteWithHttpInfo(int id,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/orderitem/delete';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

      queryParams.addAll(_queryParams('', 'Id', id));

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'DELETE',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [int] id (required):
  Future<int?> apiOrderitemDeleteDelete(int id,) async {
    final response = await apiOrderitemDeleteDeleteWithHttpInfo(id,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'int',) as int;
    
    }
    return null;
  }

  /// Returns more details for order item
  ///
  /// 
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] page (required):
  ///
  /// * [int] pageSize (required):
  ///
  /// * [String] filter:
  ///
  /// * [String] orderBy:
  Future<Response> apiOrderitemDetailsGetWithHttpInfo(int page, int pageSize, { String? filter, String? orderBy, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/orderitem/details';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

      queryParams.addAll(_queryParams('', 'Page', page));
      queryParams.addAll(_queryParams('', 'PageSize', pageSize));
    if (filter != null) {
      queryParams.addAll(_queryParams('', 'Filter', filter));
    }
    if (orderBy != null) {
      queryParams.addAll(_queryParams('', 'OrderBy', orderBy));
    }

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Returns more details for order item
  ///
  /// 
  ///
  /// Parameters:
  ///
  /// * [int] page (required):
  ///
  /// * [int] pageSize (required):
  ///
  /// * [String] filter:
  ///
  /// * [String] orderBy:
  Future<OrderItemDetailsDtoResponseData?> apiOrderitemDetailsGet(int page, int pageSize, { String? filter, String? orderBy, }) async {
    final response = await apiOrderitemDetailsGetWithHttpInfo(page, pageSize,  filter: filter, orderBy: orderBy, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'OrderItemDetailsDtoResponseData',) as OrderItemDetailsDtoResponseData;
    
    }
    return null;
  }

  /// Performs an HTTP 'GET /api/orderitem/query' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] page (required):
  ///
  /// * [int] pageSize (required):
  ///
  /// * [String] filter:
  ///
  /// * [String] orderBy:
  Future<Response> apiOrderitemQueryGetWithHttpInfo(int page, int pageSize, { String? filter, String? orderBy, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/orderitem/query';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

      queryParams.addAll(_queryParams('', 'Page', page));
      queryParams.addAll(_queryParams('', 'PageSize', pageSize));
    if (filter != null) {
      queryParams.addAll(_queryParams('', 'Filter', filter));
    }
    if (orderBy != null) {
      queryParams.addAll(_queryParams('', 'OrderBy', orderBy));
    }

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [int] page (required):
  ///
  /// * [int] pageSize (required):
  ///
  /// * [String] filter:
  ///
  /// * [String] orderBy:
  Future<OrderItemDtoResponseData?> apiOrderitemQueryGet(int page, int pageSize, { String? filter, String? orderBy, }) async {
    final response = await apiOrderitemQueryGetWithHttpInfo(page, pageSize,  filter: filter, orderBy: orderBy, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'OrderItemDtoResponseData',) as OrderItemDtoResponseData;
    
    }
    return null;
  }

  /// Performs an HTTP 'POST /api/orderitem/upsert' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [OrderItemCommand] orderItemCommand (required):
  Future<Response> apiOrderitemUpsertPostWithHttpInfo(OrderItemCommand orderItemCommand,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/orderitem/upsert';

    // ignore: prefer_final_locals
    Object? postBody = orderItemCommand;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];


    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [OrderItemCommand] orderItemCommand (required):
  Future<int?> apiOrderitemUpsertPost(OrderItemCommand orderItemCommand,) async {
    final response = await apiOrderitemUpsertPostWithHttpInfo(orderItemCommand,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'int',) as int;
    
    }
    return null;
  }

  /// Performs an HTTP 'DELETE /api/payment/delete' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] id (required):
  Future<Response> apiPaymentDeleteDeleteWithHttpInfo(int id,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/payment/delete';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

      queryParams.addAll(_queryParams('', 'Id', id));

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'DELETE',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [int] id (required):
  Future<int?> apiPaymentDeleteDelete(int id,) async {
    final response = await apiPaymentDeleteDeleteWithHttpInfo(id,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'int',) as int;
    
    }
    return null;
  }

  /// Performs an HTTP 'GET /api/payment/query' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] page (required):
  ///
  /// * [int] pageSize (required):
  ///
  /// * [String] filter:
  ///
  /// * [String] orderBy:
  Future<Response> apiPaymentQueryGetWithHttpInfo(int page, int pageSize, { String? filter, String? orderBy, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/payment/query';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

      queryParams.addAll(_queryParams('', 'Page', page));
      queryParams.addAll(_queryParams('', 'PageSize', pageSize));
    if (filter != null) {
      queryParams.addAll(_queryParams('', 'Filter', filter));
    }
    if (orderBy != null) {
      queryParams.addAll(_queryParams('', 'OrderBy', orderBy));
    }

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [int] page (required):
  ///
  /// * [int] pageSize (required):
  ///
  /// * [String] filter:
  ///
  /// * [String] orderBy:
  Future<PaymentDtoResponseData?> apiPaymentQueryGet(int page, int pageSize, { String? filter, String? orderBy, }) async {
    final response = await apiPaymentQueryGetWithHttpInfo(page, pageSize,  filter: filter, orderBy: orderBy, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'PaymentDtoResponseData',) as PaymentDtoResponseData;
    
    }
    return null;
  }

  /// Performs an HTTP 'POST /api/payment/upsert' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [PaymentCommand] paymentCommand (required):
  Future<Response> apiPaymentUpsertPostWithHttpInfo(PaymentCommand paymentCommand,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/payment/upsert';

    // ignore: prefer_final_locals
    Object? postBody = paymentCommand;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];


    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [PaymentCommand] paymentCommand (required):
  Future<int?> apiPaymentUpsertPost(PaymentCommand paymentCommand,) async {
    final response = await apiPaymentUpsertPostWithHttpInfo(paymentCommand,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'int',) as int;
    
    }
    return null;
  }

  /// Performs an HTTP 'DELETE /api/paymentprovider/delete' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] id (required):
  Future<Response> apiPaymentproviderDeleteDeleteWithHttpInfo(int id,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/paymentprovider/delete';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

      queryParams.addAll(_queryParams('', 'Id', id));

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'DELETE',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [int] id (required):
  Future<int?> apiPaymentproviderDeleteDelete(int id,) async {
    final response = await apiPaymentproviderDeleteDeleteWithHttpInfo(id,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'int',) as int;
    
    }
    return null;
  }

  /// Performs an HTTP 'GET /api/paymentprovider/query' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] page (required):
  ///
  /// * [int] pageSize (required):
  ///
  /// * [String] filter:
  ///
  /// * [String] orderBy:
  Future<Response> apiPaymentproviderQueryGetWithHttpInfo(int page, int pageSize, { String? filter, String? orderBy, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/paymentprovider/query';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

      queryParams.addAll(_queryParams('', 'Page', page));
      queryParams.addAll(_queryParams('', 'PageSize', pageSize));
    if (filter != null) {
      queryParams.addAll(_queryParams('', 'Filter', filter));
    }
    if (orderBy != null) {
      queryParams.addAll(_queryParams('', 'OrderBy', orderBy));
    }

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [int] page (required):
  ///
  /// * [int] pageSize (required):
  ///
  /// * [String] filter:
  ///
  /// * [String] orderBy:
  Future<PaymentProviderDtoResponseData?> apiPaymentproviderQueryGet(int page, int pageSize, { String? filter, String? orderBy, }) async {
    final response = await apiPaymentproviderQueryGetWithHttpInfo(page, pageSize,  filter: filter, orderBy: orderBy, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'PaymentProviderDtoResponseData',) as PaymentProviderDtoResponseData;
    
    }
    return null;
  }

  /// Performs an HTTP 'POST /api/paymentprovider/upsert' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [PaymentProviderCommand] paymentProviderCommand (required):
  Future<Response> apiPaymentproviderUpsertPostWithHttpInfo(PaymentProviderCommand paymentProviderCommand,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/paymentprovider/upsert';

    // ignore: prefer_final_locals
    Object? postBody = paymentProviderCommand;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];


    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [PaymentProviderCommand] paymentProviderCommand (required):
  Future<int?> apiPaymentproviderUpsertPost(PaymentProviderCommand paymentProviderCommand,) async {
    final response = await apiPaymentproviderUpsertPostWithHttpInfo(paymentProviderCommand,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'int',) as int;
    
    }
    return null;
  }

  /// Performs an HTTP 'DELETE /api/product/delete' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] id (required):
  Future<Response> apiProductDeleteDeleteWithHttpInfo(int id,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/product/delete';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

      queryParams.addAll(_queryParams('', 'Id', id));

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'DELETE',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [int] id (required):
  Future<int?> apiProductDeleteDelete(int id,) async {
    final response = await apiProductDeleteDeleteWithHttpInfo(id,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'int',) as int;
    
    }
    return null;
  }

  /// Performs an HTTP 'GET /api/product/query' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] page (required):
  ///
  /// * [int] pageSize (required):
  ///
  /// * [String] filter:
  ///
  /// * [String] orderBy:
  Future<Response> apiProductQueryGetWithHttpInfo(int page, int pageSize, { String? filter, String? orderBy, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/product/query';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

      queryParams.addAll(_queryParams('', 'Page', page));
      queryParams.addAll(_queryParams('', 'PageSize', pageSize));
    if (filter != null) {
      queryParams.addAll(_queryParams('', 'Filter', filter));
    }
    if (orderBy != null) {
      queryParams.addAll(_queryParams('', 'OrderBy', orderBy));
    }

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [int] page (required):
  ///
  /// * [int] pageSize (required):
  ///
  /// * [String] filter:
  ///
  /// * [String] orderBy:
  Future<ProductDtoResponseData?> apiProductQueryGet(int page, int pageSize, { String? filter, String? orderBy, }) async {
    final response = await apiProductQueryGetWithHttpInfo(page, pageSize,  filter: filter, orderBy: orderBy, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ProductDtoResponseData',) as ProductDtoResponseData;
    
    }
    return null;
  }

  /// Performs an HTTP 'POST /api/product/upsert' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [ProductCommand] productCommand (required):
  Future<Response> apiProductUpsertPostWithHttpInfo(ProductCommand productCommand,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/product/upsert';

    // ignore: prefer_final_locals
    Object? postBody = productCommand;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];


    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [ProductCommand] productCommand (required):
  Future<int?> apiProductUpsertPost(ProductCommand productCommand,) async {
    final response = await apiProductUpsertPostWithHttpInfo(productCommand,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'int',) as int;
    
    }
    return null;
  }

  /// Performs an HTTP 'DELETE /api/productdiscountoffer/delete' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] id (required):
  Future<Response> apiProductdiscountofferDeleteDeleteWithHttpInfo(int id,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/productdiscountoffer/delete';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

      queryParams.addAll(_queryParams('', 'Id', id));

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'DELETE',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [int] id (required):
  Future<int?> apiProductdiscountofferDeleteDelete(int id,) async {
    final response = await apiProductdiscountofferDeleteDeleteWithHttpInfo(id,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'int',) as int;
    
    }
    return null;
  }

  /// Performs an HTTP 'GET /api/productdiscountoffer/query' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] page (required):
  ///
  /// * [int] pageSize (required):
  ///
  /// * [String] filter:
  ///
  /// * [String] orderBy:
  Future<Response> apiProductdiscountofferQueryGetWithHttpInfo(int page, int pageSize, { String? filter, String? orderBy, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/productdiscountoffer/query';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

      queryParams.addAll(_queryParams('', 'Page', page));
      queryParams.addAll(_queryParams('', 'PageSize', pageSize));
    if (filter != null) {
      queryParams.addAll(_queryParams('', 'Filter', filter));
    }
    if (orderBy != null) {
      queryParams.addAll(_queryParams('', 'OrderBy', orderBy));
    }

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [int] page (required):
  ///
  /// * [int] pageSize (required):
  ///
  /// * [String] filter:
  ///
  /// * [String] orderBy:
  Future<ProductDiscountOfferDtoResponseData?> apiProductdiscountofferQueryGet(int page, int pageSize, { String? filter, String? orderBy, }) async {
    final response = await apiProductdiscountofferQueryGetWithHttpInfo(page, pageSize,  filter: filter, orderBy: orderBy, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ProductDiscountOfferDtoResponseData',) as ProductDiscountOfferDtoResponseData;
    
    }
    return null;
  }

  /// Performs an HTTP 'POST /api/productdiscountoffer/upsert' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [ProductDiscountOfferCommand] productDiscountOfferCommand (required):
  Future<Response> apiProductdiscountofferUpsertPostWithHttpInfo(ProductDiscountOfferCommand productDiscountOfferCommand,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/productdiscountoffer/upsert';

    // ignore: prefer_final_locals
    Object? postBody = productDiscountOfferCommand;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];


    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [ProductDiscountOfferCommand] productDiscountOfferCommand (required):
  Future<int?> apiProductdiscountofferUpsertPost(ProductDiscountOfferCommand productDiscountOfferCommand,) async {
    final response = await apiProductdiscountofferUpsertPostWithHttpInfo(productDiscountOfferCommand,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'int',) as int;
    
    }
    return null;
  }

  /// Returns list of recommended products for user that calls endpoint based on the last reviewed product
  ///
  /// 
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] page (required):
  ///
  /// * [int] pageSize (required):
  ///
  /// * [String] filter:
  ///
  /// * [String] orderBy:
  Future<Response> apiRecommendProductsGetWithHttpInfo(int page, int pageSize, { String? filter, String? orderBy, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/recommend/products';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

      queryParams.addAll(_queryParams('', 'Page', page));
      queryParams.addAll(_queryParams('', 'PageSize', pageSize));
    if (filter != null) {
      queryParams.addAll(_queryParams('', 'Filter', filter));
    }
    if (orderBy != null) {
      queryParams.addAll(_queryParams('', 'OrderBy', orderBy));
    }

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Returns list of recommended products for user that calls endpoint based on the last reviewed product
  ///
  /// 
  ///
  /// Parameters:
  ///
  /// * [int] page (required):
  ///
  /// * [int] pageSize (required):
  ///
  /// * [String] filter:
  ///
  /// * [String] orderBy:
  Future<ProductDtoResponseData?> apiRecommendProductsGet(int page, int pageSize, { String? filter, String? orderBy, }) async {
    final response = await apiRecommendProductsGetWithHttpInfo(page, pageSize,  filter: filter, orderBy: orderBy, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ProductDtoResponseData',) as ProductDtoResponseData;
    
    }
    return null;
  }

  /// Performs an HTTP 'DELETE /api/settings/delete' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] id (required):
  Future<Response> apiSettingsDeleteDeleteWithHttpInfo(int id,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/settings/delete';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

      queryParams.addAll(_queryParams('', 'Id', id));

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'DELETE',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [int] id (required):
  Future<int?> apiSettingsDeleteDelete(int id,) async {
    final response = await apiSettingsDeleteDeleteWithHttpInfo(id,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'int',) as int;
    
    }
    return null;
  }

  /// Performs an HTTP 'GET /api/settings/query' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] page (required):
  ///
  /// * [int] pageSize (required):
  ///
  /// * [String] filter:
  ///
  /// * [String] orderBy:
  Future<Response> apiSettingsQueryGetWithHttpInfo(int page, int pageSize, { String? filter, String? orderBy, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/settings/query';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

      queryParams.addAll(_queryParams('', 'Page', page));
      queryParams.addAll(_queryParams('', 'PageSize', pageSize));
    if (filter != null) {
      queryParams.addAll(_queryParams('', 'Filter', filter));
    }
    if (orderBy != null) {
      queryParams.addAll(_queryParams('', 'OrderBy', orderBy));
    }

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [int] page (required):
  ///
  /// * [int] pageSize (required):
  ///
  /// * [String] filter:
  ///
  /// * [String] orderBy:
  Future<SettingsDtoResponseData?> apiSettingsQueryGet(int page, int pageSize, { String? filter, String? orderBy, }) async {
    final response = await apiSettingsQueryGetWithHttpInfo(page, pageSize,  filter: filter, orderBy: orderBy, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'SettingsDtoResponseData',) as SettingsDtoResponseData;
    
    }
    return null;
  }

  /// Performs an HTTP 'POST /api/settings/upsert' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [SettingsCommand] settingsCommand (required):
  Future<Response> apiSettingsUpsertPostWithHttpInfo(SettingsCommand settingsCommand,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/settings/upsert';

    // ignore: prefer_final_locals
    Object? postBody = settingsCommand;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];


    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [SettingsCommand] settingsCommand (required):
  Future<int?> apiSettingsUpsertPost(SettingsCommand settingsCommand,) async {
    final response = await apiSettingsUpsertPostWithHttpInfo(settingsCommand,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'int',) as int;
    
    }
    return null;
  }

  /// Stripe payment for order
  ///
  /// Accepts order id and credit card id 
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] orderId (required):
  ///
  /// * [int] cardId (required):
  ///
  /// * [int] deliveryId (required):
  Future<Response> apiStripePayPostWithHttpInfo(int orderId, int cardId, int deliveryId,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/stripe/pay';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

      queryParams.addAll(_queryParams('', 'OrderId', orderId));
      queryParams.addAll(_queryParams('', 'CardId', cardId));
      queryParams.addAll(_queryParams('', 'DeliveryId', deliveryId));

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Stripe payment for order
  ///
  /// Accepts order id and credit card id 
  ///
  /// Parameters:
  ///
  /// * [int] orderId (required):
  ///
  /// * [int] cardId (required):
  ///
  /// * [int] deliveryId (required):
  Future<String?> apiStripePayPost(int orderId, int cardId, int deliveryId,) async {
    final response = await apiStripePayPostWithHttpInfo(orderId, cardId, deliveryId,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'String',) as String;
    
    }
    return null;
  }

  /// Performs an HTTP 'DELETE /api/taxrate/delete' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] id (required):
  Future<Response> apiTaxrateDeleteDeleteWithHttpInfo(int id,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/taxrate/delete';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

      queryParams.addAll(_queryParams('', 'Id', id));

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'DELETE',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [int] id (required):
  Future<int?> apiTaxrateDeleteDelete(int id,) async {
    final response = await apiTaxrateDeleteDeleteWithHttpInfo(id,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'int',) as int;
    
    }
    return null;
  }

  /// Performs an HTTP 'GET /api/taxrate/query' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] page (required):
  ///
  /// * [int] pageSize (required):
  ///
  /// * [String] filter:
  ///
  /// * [String] orderBy:
  Future<Response> apiTaxrateQueryGetWithHttpInfo(int page, int pageSize, { String? filter, String? orderBy, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/taxrate/query';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

      queryParams.addAll(_queryParams('', 'Page', page));
      queryParams.addAll(_queryParams('', 'PageSize', pageSize));
    if (filter != null) {
      queryParams.addAll(_queryParams('', 'Filter', filter));
    }
    if (orderBy != null) {
      queryParams.addAll(_queryParams('', 'OrderBy', orderBy));
    }

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [int] page (required):
  ///
  /// * [int] pageSize (required):
  ///
  /// * [String] filter:
  ///
  /// * [String] orderBy:
  Future<TaxRateDtoResponseData?> apiTaxrateQueryGet(int page, int pageSize, { String? filter, String? orderBy, }) async {
    final response = await apiTaxrateQueryGetWithHttpInfo(page, pageSize,  filter: filter, orderBy: orderBy, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'TaxRateDtoResponseData',) as TaxRateDtoResponseData;
    
    }
    return null;
  }

  /// Performs an HTTP 'POST /api/taxrate/upsert' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [TaxRateCommand] taxRateCommand (required):
  Future<Response> apiTaxrateUpsertPostWithHttpInfo(TaxRateCommand taxRateCommand,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/taxrate/upsert';

    // ignore: prefer_final_locals
    Object? postBody = taxRateCommand;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];


    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [TaxRateCommand] taxRateCommand (required):
  Future<int?> apiTaxrateUpsertPost(TaxRateCommand taxRateCommand,) async {
    final response = await apiTaxrateUpsertPostWithHttpInfo(taxRateCommand,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'int',) as int;
    
    }
    return null;
  }

  /// Performs an HTTP 'DELETE /api/user/delete' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] id (required):
  Future<Response> apiUserDeleteDeleteWithHttpInfo(int id,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/user/delete';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

      queryParams.addAll(_queryParams('', 'Id', id));

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'DELETE',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [int] id (required):
  Future<int?> apiUserDeleteDelete(int id,) async {
    final response = await apiUserDeleteDeleteWithHttpInfo(id,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'int',) as int;
    
    }
    return null;
  }

  /// Returns user details based on emil claim
  ///
  /// 
  ///
  /// Note: This method returns the HTTP [Response].
  Future<Response> apiUserDetailsGetWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/api/user/details';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Returns user details based on emil claim
  ///
  /// 
  Future<UserDetailsDtoResponseData?> apiUserDetailsGet() async {
    final response = await apiUserDetailsGetWithHttpInfo();
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'UserDetailsDtoResponseData',) as UserDetailsDtoResponseData;
    
    }
    return null;
  }

  /// Performs an HTTP 'GET /api/user/query' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] page (required):
  ///
  /// * [int] pageSize (required):
  ///
  /// * [String] filter:
  ///
  /// * [String] orderBy:
  Future<Response> apiUserQueryGetWithHttpInfo(int page, int pageSize, { String? filter, String? orderBy, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/user/query';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

      queryParams.addAll(_queryParams('', 'Page', page));
      queryParams.addAll(_queryParams('', 'PageSize', pageSize));
    if (filter != null) {
      queryParams.addAll(_queryParams('', 'Filter', filter));
    }
    if (orderBy != null) {
      queryParams.addAll(_queryParams('', 'OrderBy', orderBy));
    }

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [int] page (required):
  ///
  /// * [int] pageSize (required):
  ///
  /// * [String] filter:
  ///
  /// * [String] orderBy:
  Future<UserDtoResponseData?> apiUserQueryGet(int page, int pageSize, { String? filter, String? orderBy, }) async {
    final response = await apiUserQueryGetWithHttpInfo(page, pageSize,  filter: filter, orderBy: orderBy, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'UserDtoResponseData',) as UserDtoResponseData;
    
    }
    return null;
  }

  /// Performs an HTTP 'POST /api/user/upsert' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [UserCommand] userCommand (required):
  Future<Response> apiUserUpsertPostWithHttpInfo(UserCommand userCommand,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/user/upsert';

    // ignore: prefer_final_locals
    Object? postBody = userCommand;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];


    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [UserCommand] userCommand (required):
  Future<int?> apiUserUpsertPost(UserCommand userCommand,) async {
    final response = await apiUserUpsertPostWithHttpInfo(userCommand,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'int',) as int;
    
    }
    return null;
  }

  /// Performs an HTTP 'DELETE /api/userproductreview/delete' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] id (required):
  Future<Response> apiUserproductreviewDeleteDeleteWithHttpInfo(int id,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/userproductreview/delete';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

      queryParams.addAll(_queryParams('', 'Id', id));

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'DELETE',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [int] id (required):
  Future<int?> apiUserproductreviewDeleteDelete(int id,) async {
    final response = await apiUserproductreviewDeleteDeleteWithHttpInfo(id,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'int',) as int;
    
    }
    return null;
  }

  /// Performs an HTTP 'GET /api/userproductreview/query' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] page (required):
  ///
  /// * [int] pageSize (required):
  ///
  /// * [String] filter:
  ///
  /// * [String] orderBy:
  Future<Response> apiUserproductreviewQueryGetWithHttpInfo(int page, int pageSize, { String? filter, String? orderBy, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/userproductreview/query';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

      queryParams.addAll(_queryParams('', 'Page', page));
      queryParams.addAll(_queryParams('', 'PageSize', pageSize));
    if (filter != null) {
      queryParams.addAll(_queryParams('', 'Filter', filter));
    }
    if (orderBy != null) {
      queryParams.addAll(_queryParams('', 'OrderBy', orderBy));
    }

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [int] page (required):
  ///
  /// * [int] pageSize (required):
  ///
  /// * [String] filter:
  ///
  /// * [String] orderBy:
  Future<UserProductReviewDtoResponseData?> apiUserproductreviewQueryGet(int page, int pageSize, { String? filter, String? orderBy, }) async {
    final response = await apiUserproductreviewQueryGetWithHttpInfo(page, pageSize,  filter: filter, orderBy: orderBy, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'UserProductReviewDtoResponseData',) as UserProductReviewDtoResponseData;
    
    }
    return null;
  }

  /// Performs an HTTP 'POST /api/userproductreview/upsert' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [UserProductReviewCommand] userProductReviewCommand (required):
  Future<Response> apiUserproductreviewUpsertPostWithHttpInfo(UserProductReviewCommand userProductReviewCommand,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/userproductreview/upsert';

    // ignore: prefer_final_locals
    Object? postBody = userProductReviewCommand;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];


    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [UserProductReviewCommand] userProductReviewCommand (required):
  Future<int?> apiUserproductreviewUpsertPost(UserProductReviewCommand userProductReviewCommand,) async {
    final response = await apiUserproductreviewUpsertPostWithHttpInfo(userProductReviewCommand,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'int',) as int;
    
    }
    return null;
  }

  /// Performs an HTTP 'DELETE /api/wishlist/delete' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] id (required):
  Future<Response> apiWishlistDeleteDeleteWithHttpInfo(int id,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/wishlist/delete';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

      queryParams.addAll(_queryParams('', 'Id', id));

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'DELETE',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [int] id (required):
  Future<int?> apiWishlistDeleteDelete(int id,) async {
    final response = await apiWishlistDeleteDeleteWithHttpInfo(id,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'int',) as int;
    
    }
    return null;
  }

  /// Returns user wish list details based by user id
  ///
  /// 
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] userId:
  Future<Response> apiWishlistDetailsGetWithHttpInfo({ int? userId, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/wishlist/details';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (userId != null) {
      queryParams.addAll(_queryParams('', 'UserId', userId));
    }

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Returns user wish list details based by user id
  ///
  /// 
  ///
  /// Parameters:
  ///
  /// * [int] userId:
  Future<WishListDetailsDtoResponseData?> apiWishlistDetailsGet({ int? userId, }) async {
    final response = await apiWishlistDetailsGetWithHttpInfo( userId: userId, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'WishListDetailsDtoResponseData',) as WishListDetailsDtoResponseData;
    
    }
    return null;
  }

  /// Performs an HTTP 'GET /api/wishlist/query' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] page (required):
  ///
  /// * [int] pageSize (required):
  ///
  /// * [String] filter:
  ///
  /// * [String] orderBy:
  Future<Response> apiWishlistQueryGetWithHttpInfo(int page, int pageSize, { String? filter, String? orderBy, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/wishlist/query';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

      queryParams.addAll(_queryParams('', 'Page', page));
      queryParams.addAll(_queryParams('', 'PageSize', pageSize));
    if (filter != null) {
      queryParams.addAll(_queryParams('', 'Filter', filter));
    }
    if (orderBy != null) {
      queryParams.addAll(_queryParams('', 'OrderBy', orderBy));
    }

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [int] page (required):
  ///
  /// * [int] pageSize (required):
  ///
  /// * [String] filter:
  ///
  /// * [String] orderBy:
  Future<WishListDtoResponseData?> apiWishlistQueryGet(int page, int pageSize, { String? filter, String? orderBy, }) async {
    final response = await apiWishlistQueryGetWithHttpInfo(page, pageSize,  filter: filter, orderBy: orderBy, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'WishListDtoResponseData',) as WishListDtoResponseData;
    
    }
    return null;
  }

  /// Performs an HTTP 'POST /api/wishlist/upsert' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [WishListCommand] wishListCommand (required):
  Future<Response> apiWishlistUpsertPostWithHttpInfo(WishListCommand wishListCommand,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/wishlist/upsert';

    // ignore: prefer_final_locals
    Object? postBody = wishListCommand;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];


    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [WishListCommand] wishListCommand (required):
  Future<int?> apiWishlistUpsertPost(WishListCommand wishListCommand,) async {
    final response = await apiWishlistUpsertPostWithHttpInfo(wishListCommand,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'int',) as int;
    
    }
    return null;
  }

  /// Performs an HTTP 'DELETE /api/wishlistitem/delete' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] id (required):
  Future<Response> apiWishlistitemDeleteDeleteWithHttpInfo(int id,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/wishlistitem/delete';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

      queryParams.addAll(_queryParams('', 'Id', id));

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'DELETE',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [int] id (required):
  Future<int?> apiWishlistitemDeleteDelete(int id,) async {
    final response = await apiWishlistitemDeleteDeleteWithHttpInfo(id,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'int',) as int;
    
    }
    return null;
  }

  /// Performs an HTTP 'GET /api/wishlistitem/query' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] page (required):
  ///
  /// * [int] pageSize (required):
  ///
  /// * [String] filter:
  ///
  /// * [String] orderBy:
  Future<Response> apiWishlistitemQueryGetWithHttpInfo(int page, int pageSize, { String? filter, String? orderBy, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/wishlistitem/query';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

      queryParams.addAll(_queryParams('', 'Page', page));
      queryParams.addAll(_queryParams('', 'PageSize', pageSize));
    if (filter != null) {
      queryParams.addAll(_queryParams('', 'Filter', filter));
    }
    if (orderBy != null) {
      queryParams.addAll(_queryParams('', 'OrderBy', orderBy));
    }

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [int] page (required):
  ///
  /// * [int] pageSize (required):
  ///
  /// * [String] filter:
  ///
  /// * [String] orderBy:
  Future<WishListItemDtoResponseData?> apiWishlistitemQueryGet(int page, int pageSize, { String? filter, String? orderBy, }) async {
    final response = await apiWishlistitemQueryGetWithHttpInfo(page, pageSize,  filter: filter, orderBy: orderBy, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'WishListItemDtoResponseData',) as WishListItemDtoResponseData;
    
    }
    return null;
  }

  /// Performs an HTTP 'POST /api/wishlistitem/upsert' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [WishListItemCommand] wishListItemCommand (required):
  Future<Response> apiWishlistitemUpsertPostWithHttpInfo(WishListItemCommand wishListItemCommand,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/wishlistitem/upsert';

    // ignore: prefer_final_locals
    Object? postBody = wishListItemCommand;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];


    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [WishListItemCommand] wishListItemCommand (required):
  Future<int?> apiWishlistitemUpsertPost(WishListItemCommand wishListItemCommand,) async {
    final response = await apiWishlistitemUpsertPostWithHttpInfo(wishListItemCommand,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'int',) as int;
    
    }
    return null;
  }
}
