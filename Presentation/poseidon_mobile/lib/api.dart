//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

library openapi.api;

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';
import 'package:openapi/environmet.dart';

part 'api_client.dart';
part 'api_helper.dart';
part 'api_exception.dart';
part 'auth/authentication.dart';
part 'auth/api_key_auth.dart';
part 'auth/oauth.dart';
part 'auth/http_basic_auth.dart';
part 'auth/http_bearer_auth.dart';

part 'api/poseidon_api_api.dart';

part 'model/address_command.dart';
part 'model/address_dto.dart';
part 'model/address_dto_response_data.dart';
part 'model/cart_command.dart';
part 'model/cart_details_dto.dart';
part 'model/cart_details_dto_response_data.dart';
part 'model/cart_dto.dart';
part 'model/cart_dto_response_data.dart';
part 'model/cart_item_command.dart';
part 'model/cart_item_dto.dart';
part 'model/cart_item_dto_response_data.dart';
part 'model/category_command.dart';
part 'model/category_dto.dart';
part 'model/category_dto_response_data.dart';
part 'model/country_command.dart';
part 'model/country_dto.dart';
part 'model/country_dto_response_data.dart';
part 'model/credit_card_command.dart';
part 'model/credit_card_dto.dart';
part 'model/credit_card_dto_response_data.dart';
part 'model/delivery_command.dart';
part 'model/delivery_dto.dart';
part 'model/delivery_dto_response_data.dart';
part 'model/discount_offer_command.dart';
part 'model/discount_offer_dto.dart';
part 'model/discount_offer_dto_response_data.dart';
part 'model/error_response.dart';
part 'model/order_command.dart';
part 'model/order_dto.dart';
part 'model/order_dto_response_data.dart';
part 'model/order_item_command.dart';
part 'model/order_item_details_dto.dart';
part 'model/order_item_details_dto_response_data.dart';
part 'model/order_item_dto.dart';
part 'model/order_item_dto_response_data.dart';
part 'model/payment_command.dart';
part 'model/payment_dto.dart';
part 'model/payment_dto_response_data.dart';
part 'model/payment_provider_command.dart';
part 'model/payment_provider_dto.dart';
part 'model/payment_provider_dto_response_data.dart';
part 'model/product_command.dart';
part 'model/product_discount_offer_command.dart';
part 'model/product_discount_offer_dto.dart';
part 'model/product_discount_offer_dto_response_data.dart';
part 'model/product_dto.dart';
part 'model/product_dto_response_data.dart';
part 'model/settings_command.dart';
part 'model/settings_dto.dart';
part 'model/settings_dto_response_data.dart';
part 'model/tax_rate_command.dart';
part 'model/tax_rate_dto.dart';
part 'model/tax_rate_dto_response_data.dart';
part 'model/user_command.dart';
part 'model/user_details_dto.dart';
part 'model/user_details_dto_response_data.dart';
part 'model/user_dto.dart';
part 'model/user_dto_response_data.dart';
part 'model/user_product_review_command.dart';
part 'model/user_product_review_dto.dart';
part 'model/user_product_review_dto_response_data.dart';
part 'model/wish_list_command.dart';
part 'model/wish_list_details_dto.dart';
part 'model/wish_list_details_dto_response_data.dart';
part 'model/wish_list_dto.dart';
part 'model/wish_list_dto_response_data.dart';
part 'model/wish_list_item_command.dart';
part 'model/wish_list_item_details_dto.dart';
part 'model/wish_list_item_dto.dart';
part 'model/wish_list_item_dto_response_data.dart';

const _delimiters = {'csv': ',', 'ssv': ' ', 'tsv': '\t', 'pipes': '|'};
const _dateEpochMarker = 'epoch';
final _dateFormatter = DateFormat('yyyy-MM-dd');
final _regList = RegExp(r'^List<(.*)>$');
final _regSet = RegExp(r'^Set<(.*)>$');
final _regMap = RegExp(r'^Map<String,(.*)>$');

ApiClient defaultApiClient = ApiClient(basePath: Environment().config!.apiUrl);
