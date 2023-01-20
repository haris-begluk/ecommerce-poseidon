//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CartItemDto {
  /// Returns a new [CartItemDto] instance.
  CartItemDto({
    this.cartItemId,
    this.cartId,
    this.discountAmount,
    this.imageUrl,
    this.price,
    this.productId,
    this.quantity,
    this.sysCreatedAt,
    this.sysCreatedBy,
    this.sysUpdatedAt,
    this.sysUpdatedBy,
    this.taxAmount,
    this.title,
    this.unit,
  });

  int? cartItemId;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? cartId;

  num? discountAmount;

  String? imageUrl;

  num? price;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? productId;

  num? quantity;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? sysCreatedAt;

  String? sysCreatedBy;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? sysUpdatedAt;

  String? sysUpdatedBy;

  num? taxAmount;

  String? title;

  String? unit;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CartItemDto &&
     other.cartItemId == cartItemId &&
     other.cartId == cartId &&
     other.discountAmount == discountAmount &&
     other.imageUrl == imageUrl &&
     other.price == price &&
     other.productId == productId &&
     other.quantity == quantity &&
     other.sysCreatedAt == sysCreatedAt &&
     other.sysCreatedBy == sysCreatedBy &&
     other.sysUpdatedAt == sysUpdatedAt &&
     other.sysUpdatedBy == sysUpdatedBy &&
     other.taxAmount == taxAmount &&
     other.title == title &&
     other.unit == unit;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (cartItemId == null ? 0 : cartItemId!.hashCode) +
    (cartId == null ? 0 : cartId!.hashCode) +
    (discountAmount == null ? 0 : discountAmount!.hashCode) +
    (imageUrl == null ? 0 : imageUrl!.hashCode) +
    (price == null ? 0 : price!.hashCode) +
    (productId == null ? 0 : productId!.hashCode) +
    (quantity == null ? 0 : quantity!.hashCode) +
    (sysCreatedAt == null ? 0 : sysCreatedAt!.hashCode) +
    (sysCreatedBy == null ? 0 : sysCreatedBy!.hashCode) +
    (sysUpdatedAt == null ? 0 : sysUpdatedAt!.hashCode) +
    (sysUpdatedBy == null ? 0 : sysUpdatedBy!.hashCode) +
    (taxAmount == null ? 0 : taxAmount!.hashCode) +
    (title == null ? 0 : title!.hashCode) +
    (unit == null ? 0 : unit!.hashCode);

  @override
  String toString() => 'CartItemDto[cartItemId=$cartItemId, cartId=$cartId, discountAmount=$discountAmount, imageUrl=$imageUrl, price=$price, productId=$productId, quantity=$quantity, sysCreatedAt=$sysCreatedAt, sysCreatedBy=$sysCreatedBy, sysUpdatedAt=$sysUpdatedAt, sysUpdatedBy=$sysUpdatedBy, taxAmount=$taxAmount, title=$title, unit=$unit]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
    if (cartItemId != null) {
      _json[r'cartItemId'] = cartItemId;
    }
    if (cartId != null) {
      _json[r'cartId'] = cartId;
    }
    if (discountAmount != null) {
      _json[r'discountAmount'] = discountAmount;
    }
    if (imageUrl != null) {
      _json[r'imageUrl'] = imageUrl;
    }
    if (price != null) {
      _json[r'price'] = price;
    }
    if (productId != null) {
      _json[r'productId'] = productId;
    }
    if (quantity != null) {
      _json[r'quantity'] = quantity;
    }
    if (sysCreatedAt != null) {
      _json[r'sys_CreatedAt'] = sysCreatedAt!.toUtc().toIso8601String();
    }
    if (sysCreatedBy != null) {
      _json[r'sys_CreatedBy'] = sysCreatedBy;
    }
    if (sysUpdatedAt != null) {
      _json[r'sys_UpdatedAt'] = sysUpdatedAt!.toUtc().toIso8601String();
    }
    if (sysUpdatedBy != null) {
      _json[r'sys_UpdatedBy'] = sysUpdatedBy;
    }
    if (taxAmount != null) {
      _json[r'taxAmount'] = taxAmount;
    }
    if (title != null) {
      _json[r'title'] = title;
    }
    if (unit != null) {
      _json[r'unit'] = unit;
    }
    return _json;
  }

  /// Returns a new [CartItemDto] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CartItemDto? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "CartItemDto[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "CartItemDto[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return CartItemDto(
        cartItemId: mapValueOfType<int>(json, r'cartItemId'),
        cartId: mapValueOfType<int>(json, r'cartId'),
        discountAmount: json[r'discountAmount'] == null
            ? null
            : num.parse(json[r'discountAmount'].toString()),
        imageUrl: mapValueOfType<String>(json, r'imageUrl'),
        price: json[r'price'] == null
            ? null
            : num.parse(json[r'price'].toString()),
        productId: mapValueOfType<int>(json, r'productId'),
        quantity: json[r'quantity'] == null
            ? null
            : num.parse(json[r'quantity'].toString()),
        sysCreatedAt: mapDateTime(json, r'sys_CreatedAt', ''),
        sysCreatedBy: mapValueOfType<String>(json, r'sys_CreatedBy'),
        sysUpdatedAt: mapDateTime(json, r'sys_UpdatedAt', ''),
        sysUpdatedBy: mapValueOfType<String>(json, r'sys_UpdatedBy'),
        taxAmount: json[r'taxAmount'] == null
            ? null
            : num.parse(json[r'taxAmount'].toString()),
        title: mapValueOfType<String>(json, r'title'),
        unit: mapValueOfType<String>(json, r'unit'),
      );
    }
    return null;
  }

  static List<CartItemDto>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CartItemDto>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CartItemDto.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CartItemDto> mapFromJson(dynamic json) {
    final map = <String, CartItemDto>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CartItemDto.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CartItemDto-objects as value to a dart map
  static Map<String, List<CartItemDto>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<CartItemDto>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CartItemDto.listFromJson(entry.value, growable: growable,);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

