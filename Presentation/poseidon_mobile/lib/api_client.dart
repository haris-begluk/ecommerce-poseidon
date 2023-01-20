//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ApiClient {
  ApiClient({this.basePath = 'http://localhost:5100', this.authentication});

  final String basePath;

  var _client = Client();

  /// Returns the current HTTP [Client] instance to use in this class.
  ///
  /// The return value is guaranteed to never be null.
  Client get client => _client;

  /// Requests to use a new HTTP [Client] in this class.
  set client(Client newClient) {
    _client = newClient;
  }

  final _defaultHeaderMap = <String, String>{};
  final Authentication? authentication;

  void addDefaultHeader(String key, String value) {
     _defaultHeaderMap[key] = value;
  }

  Map<String,String> get defaultHeaderMap => _defaultHeaderMap;

  // We don't use a Map<String, String> for queryParams.
  // If collectionFormat is 'multi', a key might appear multiple times.
  Future<Response> invokeAPI(
    String path,
    String method,
    List<QueryParam> queryParams,
    Object? body,
    Map<String, String> headerParams,
    Map<String, String> formParams,
    String? contentType,
  ) async {
    _updateParamsForAuth(queryParams, headerParams);

    headerParams.addAll(_defaultHeaderMap);
    if (contentType != null) {
      headerParams['Content-Type'] = contentType;
    }

    final urlEncodedQueryParams = queryParams.map((param) => '$param');
    final queryString = urlEncodedQueryParams.isNotEmpty ? '?${urlEncodedQueryParams.join('&')}' : '';
    final uri = Uri.parse('$basePath$path$queryString');

    try {
      // Special case for uploading a single file which isn't a 'multipart/form-data'.
      if (
        body is MultipartFile && (contentType == null ||
        !contentType.toLowerCase().startsWith('multipart/form-data'))
      ) {
        final request = StreamedRequest(method, uri);
        request.headers.addAll(headerParams);
        request.contentLength = body.length;
        body.finalize().listen(
          request.sink.add,
          onDone: request.sink.close,
          // ignore: avoid_types_on_closure_parameters
          onError: (Object error, StackTrace trace) => request.sink.close(),
          cancelOnError: true,
        );
        final response = await _client.send(request);
        return Response.fromStream(response);
      }

      if (body is MultipartRequest) {
        final request = MultipartRequest(method, uri);
        request.fields.addAll(body.fields);
        request.files.addAll(body.files);
        request.headers.addAll(body.headers);
        request.headers.addAll(headerParams);
        final response = await _client.send(request);
        return Response.fromStream(response);
      }

      final msgBody = contentType == 'application/x-www-form-urlencoded'
        ? formParams
        : await serializeAsync(body);
      final nullableHeaderParams = headerParams.isEmpty ? null : headerParams;

      switch(method) {
        case 'POST': return await _client.post(uri, headers: nullableHeaderParams, body: msgBody,);
        case 'PUT': return await _client.put(uri, headers: nullableHeaderParams, body: msgBody,);
        case 'DELETE': return await _client.delete(uri, headers: nullableHeaderParams, body: msgBody,);
        case 'PATCH': return await _client.patch(uri, headers: nullableHeaderParams, body: msgBody,);
        case 'HEAD': return await _client.head(uri, headers: nullableHeaderParams,);
        case 'GET': return await _client.get(uri, headers: nullableHeaderParams,);
      }
    } on SocketException catch (error, trace) {
      throw ApiException.withInner(
        HttpStatus.badRequest,
        'Socket operation failed: $method $path',
        error,
        trace,
      );
    } on TlsException catch (error, trace) {
      throw ApiException.withInner(
        HttpStatus.badRequest,
        'TLS/SSL communication failed: $method $path',
        error,
        trace,
      );
    } on IOException catch (error, trace) {
      throw ApiException.withInner(
        HttpStatus.badRequest,
        'I/O operation failed: $method $path',
        error,
        trace,
      );
    } on ClientException catch (error, trace) {
      throw ApiException.withInner(
        HttpStatus.badRequest,
        'HTTP connection failed: $method $path',
        error,
        trace,
      );
    } on Exception catch (error, trace) {
      throw ApiException.withInner(
        HttpStatus.badRequest,
        'Exception occurred: $method $path',
        error,
        trace,
      );
    }

    throw ApiException(
      HttpStatus.badRequest,
      'Invalid HTTP operation: $method $path',
    );
  }

  Future<dynamic> deserializeAsync(String json, String targetType, {bool growable = false,}) async =>
    // ignore: deprecated_member_use_from_same_package
    deserialize(json, targetType, growable: growable);

  @Deprecated('Scheduled for removal in OpenAPI Generator 6.x. Use deserializeAsync() instead.')
  dynamic deserialize(String json, String targetType, {bool growable = false,}) {
    // Remove all spaces. Necessary for regular expressions as well.
    targetType = targetType.replaceAll(' ', ''); // ignore: parameter_assignments

    // If the expected target type is String, nothing to do...
    return targetType == 'String'
      ? json
      : _deserialize(jsonDecode(json), targetType, growable: growable);
  }

  // ignore: deprecated_member_use_from_same_package
  Future<String> serializeAsync(Object? value) async => serialize(value);

  @Deprecated('Scheduled for removal in OpenAPI Generator 6.x. Use serializeAsync() instead.')
  String serialize(Object? value) => value == null ? '' : json.encode(value);

  /// Update query and header parameters based on authentication settings.
  void _updateParamsForAuth(
    List<QueryParam> queryParams,
    Map<String, String> headerParams,
  ) {
    if (authentication != null) {
      authentication!.applyToParams(queryParams, headerParams);
    }
  }

  static dynamic _deserialize(dynamic value, String targetType, {bool growable = false}) {
    try {
      switch (targetType) {
        case 'String':
          return value is String ? value : value.toString();
        case 'int':
          return value is int ? value : int.parse('$value');
        case 'double':
          return value is double ? value : double.parse('$value');
        case 'bool':
          if (value is bool) {
            return value;
          }
          final valueString = '$value'.toLowerCase();
          return valueString == 'true' || valueString == '1';
        case 'AddressCommand':
          return AddressCommand.fromJson(value);
        case 'AddressDto':
          return AddressDto.fromJson(value);
        case 'AddressDtoResponseData':
          return AddressDtoResponseData.fromJson(value);
        case 'CartCommand':
          return CartCommand.fromJson(value);
        case 'CartDetailsDto':
          return CartDetailsDto.fromJson(value);
        case 'CartDetailsDtoResponseData':
          return CartDetailsDtoResponseData.fromJson(value);
        case 'CartDto':
          return CartDto.fromJson(value);
        case 'CartDtoResponseData':
          return CartDtoResponseData.fromJson(value);
        case 'CartItemCommand':
          return CartItemCommand.fromJson(value);
        case 'CartItemDto':
          return CartItemDto.fromJson(value);
        case 'CartItemDtoResponseData':
          return CartItemDtoResponseData.fromJson(value);
        case 'CategoryCommand':
          return CategoryCommand.fromJson(value);
        case 'CategoryDto':
          return CategoryDto.fromJson(value);
        case 'CategoryDtoResponseData':
          return CategoryDtoResponseData.fromJson(value);
        case 'CountryCommand':
          return CountryCommand.fromJson(value);
        case 'CountryDto':
          return CountryDto.fromJson(value);
        case 'CountryDtoResponseData':
          return CountryDtoResponseData.fromJson(value);
        case 'CreditCardCommand':
          return CreditCardCommand.fromJson(value);
        case 'CreditCardDto':
          return CreditCardDto.fromJson(value);
        case 'CreditCardDtoResponseData':
          return CreditCardDtoResponseData.fromJson(value);
        case 'DeliveryCommand':
          return DeliveryCommand.fromJson(value);
        case 'DeliveryDto':
          return DeliveryDto.fromJson(value);
        case 'DeliveryDtoResponseData':
          return DeliveryDtoResponseData.fromJson(value);
        case 'DiscountOfferCommand':
          return DiscountOfferCommand.fromJson(value);
        case 'DiscountOfferDto':
          return DiscountOfferDto.fromJson(value);
        case 'DiscountOfferDtoResponseData':
          return DiscountOfferDtoResponseData.fromJson(value);
        case 'ErrorResponse':
          return ErrorResponse.fromJson(value);
        case 'OrderCommand':
          return OrderCommand.fromJson(value);
        case 'OrderDto':
          return OrderDto.fromJson(value);
        case 'OrderDtoResponseData':
          return OrderDtoResponseData.fromJson(value);
        case 'OrderItemCommand':
          return OrderItemCommand.fromJson(value);
        case 'OrderItemDetailsDto':
          return OrderItemDetailsDto.fromJson(value);
        case 'OrderItemDetailsDtoResponseData':
          return OrderItemDetailsDtoResponseData.fromJson(value);
        case 'OrderItemDto':
          return OrderItemDto.fromJson(value);
        case 'OrderItemDtoResponseData':
          return OrderItemDtoResponseData.fromJson(value);
        case 'PaymentCommand':
          return PaymentCommand.fromJson(value);
        case 'PaymentDto':
          return PaymentDto.fromJson(value);
        case 'PaymentDtoResponseData':
          return PaymentDtoResponseData.fromJson(value);
        case 'PaymentProviderCommand':
          return PaymentProviderCommand.fromJson(value);
        case 'PaymentProviderDto':
          return PaymentProviderDto.fromJson(value);
        case 'PaymentProviderDtoResponseData':
          return PaymentProviderDtoResponseData.fromJson(value);
        case 'ProductCommand':
          return ProductCommand.fromJson(value);
        case 'ProductDiscountOfferCommand':
          return ProductDiscountOfferCommand.fromJson(value);
        case 'ProductDiscountOfferDto':
          return ProductDiscountOfferDto.fromJson(value);
        case 'ProductDiscountOfferDtoResponseData':
          return ProductDiscountOfferDtoResponseData.fromJson(value);
        case 'ProductDto':
          return ProductDto.fromJson(value);
        case 'ProductDtoResponseData':
          return ProductDtoResponseData.fromJson(value);
        case 'SettingsCommand':
          return SettingsCommand.fromJson(value);
        case 'SettingsDto':
          return SettingsDto.fromJson(value);
        case 'SettingsDtoResponseData':
          return SettingsDtoResponseData.fromJson(value);
        case 'TaxRateCommand':
          return TaxRateCommand.fromJson(value);
        case 'TaxRateDto':
          return TaxRateDto.fromJson(value);
        case 'TaxRateDtoResponseData':
          return TaxRateDtoResponseData.fromJson(value);
        case 'UserCommand':
          return UserCommand.fromJson(value);
        case 'UserDetailsDto':
          return UserDetailsDto.fromJson(value);
        case 'UserDetailsDtoResponseData':
          return UserDetailsDtoResponseData.fromJson(value);
        case 'UserDto':
          return UserDto.fromJson(value);
        case 'UserDtoResponseData':
          return UserDtoResponseData.fromJson(value);
        case 'UserProductReviewCommand':
          return UserProductReviewCommand.fromJson(value);
        case 'UserProductReviewDto':
          return UserProductReviewDto.fromJson(value);
        case 'UserProductReviewDtoResponseData':
          return UserProductReviewDtoResponseData.fromJson(value);
        case 'WishListCommand':
          return WishListCommand.fromJson(value);
        case 'WishListDetailsDto':
          return WishListDetailsDto.fromJson(value);
        case 'WishListDetailsDtoResponseData':
          return WishListDetailsDtoResponseData.fromJson(value);
        case 'WishListDto':
          return WishListDto.fromJson(value);
        case 'WishListDtoResponseData':
          return WishListDtoResponseData.fromJson(value);
        case 'WishListItemCommand':
          return WishListItemCommand.fromJson(value);
        case 'WishListItemDetailsDto':
          return WishListItemDetailsDto.fromJson(value);
        case 'WishListItemDto':
          return WishListItemDto.fromJson(value);
        case 'WishListItemDtoResponseData':
          return WishListItemDtoResponseData.fromJson(value);
        default:
          dynamic match;
          if (value is List && (match = _regList.firstMatch(targetType)?.group(1)) != null) {
            return value
              .map<dynamic>((dynamic v) => _deserialize(v, match, growable: growable,))
              .toList(growable: growable);
          }
          if (value is Set && (match = _regSet.firstMatch(targetType)?.group(1)) != null) {
            return value
              .map<dynamic>((dynamic v) => _deserialize(v, match, growable: growable,))
              .toSet();
          }
          if (value is Map && (match = _regMap.firstMatch(targetType)?.group(1)) != null) {
            return Map<String, dynamic>.fromIterables(
              value.keys.cast<String>(),
              value.values.map<dynamic>((dynamic v) => _deserialize(v, match, growable: growable,)),
            );
          }
      }
    } on Exception catch (error, trace) {
      throw ApiException.withInner(HttpStatus.internalServerError, 'Exception during deserialization.', error, trace,);
    }
    throw ApiException(HttpStatus.internalServerError, 'Could not find a suitable class for deserialization',);
  }
}

/// Primarily intended for use in an isolate.
class DeserializationMessage {
  const DeserializationMessage({
    required this.json,
    required this.targetType,
    this.growable = false,
  });

  /// The JSON value to deserialize.
  final String json;

  /// Target type to deserialize to.
  final String targetType;

  /// Whether to make deserialized lists or maps growable.
  final bool growable;
}

/// Primarily intended for use in an isolate.
Future<dynamic> deserializeAsync(DeserializationMessage message) async {
  // Remove all spaces. Necessary for regular expressions as well.
  final targetType = message.targetType.replaceAll(' ', '');

  // If the expected target type is String, nothing to do...
  return targetType == 'String'
    ? message.json
    : ApiClient._deserialize(
        jsonDecode(message.json),
        targetType,
        growable: message.growable,
      );
}

/// Primarily intended for use in an isolate.
Future<String> serializeAsync(Object? value) async => value == null ? '' : json.encode(value);
