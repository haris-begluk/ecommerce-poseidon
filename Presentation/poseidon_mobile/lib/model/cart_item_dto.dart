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
    this.quantity,
    this.price,
    this.discountAmount,
    this.taxAmount,
    this.title,
    this.imageUrl,
    this.unit,
    this.cartId,
    this.productId,
    this.sysCreatedBy,
    this.sysCreatedAt,
    this.sysUpdatedBy,
    this.sysUpdatedAt,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? cartItemId;

  num? quantity;

  num? price;

  num? discountAmount;

  num? taxAmount;

  String? title;

  String? imageUrl;

  String? unit;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? cartId;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? productId;

  String? sysCreatedBy;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? sysCreatedAt;

  String? sysUpdatedBy;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? sysUpdatedAt;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CartItemDto &&
     other.cartItemId == cartItemId &&
     other.quantity == quantity &&
     other.price == price &&
     other.discountAmount == discountAmount &&
     other.taxAmount == taxAmount &&
     other.title == title &&
     other.imageUrl == imageUrl &&
     other.unit == unit &&
     other.cartId == cartId &&
     other.productId == productId &&
     other.sysCreatedBy == sysCreatedBy &&
     other.sysCreatedAt == sysCreatedAt &&
     other.sysUpdatedBy == sysUpdatedBy &&
     other.sysUpdatedAt == sysUpdatedAt;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (cartItemId == null ? 0 : cartItemId!.hashCode) +
    (quantity == null ? 0 : quantity!.hashCode) +
    (price == null ? 0 : price!.hashCode) +
    (discountAmount == null ? 0 : discountAmount!.hashCode) +
    (taxAmount == null ? 0 : taxAmount!.hashCode) +
    (title == null ? 0 : title!.hashCode) +
    (imageUrl == null ? 0 : imageUrl!.hashCode) +
    (unit == null ? 0 : unit!.hashCode) +
    (cartId == null ? 0 : cartId!.hashCode) +
    (productId == null ? 0 : productId!.hashCode) +
    (sysCreatedBy == null ? 0 : sysCreatedBy!.hashCode) +
    (sysCreatedAt == null ? 0 : sysCreatedAt!.hashCode) +
    (sysUpdatedBy == null ? 0 : sysUpdatedBy!.hashCode) +
    (sysUpdatedAt == null ? 0 : sysUpdatedAt!.hashCode);

  @override
  String toString() => 'CartItemDto[cartItemId=$cartItemId, quantity=$quantity, price=$price, discountAmount=$discountAmount, taxAmount=$taxAmount, title=$title, imageUrl=$imageUrl, unit=$unit, cartId=$cartId, productId=$productId, sysCreatedBy=$sysCreatedBy, sysCreatedAt=$sysCreatedAt, sysUpdatedBy=$sysUpdatedBy, sysUpdatedAt=$sysUpdatedAt]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
    if (cartItemId != null) {
      _json[r'cartItemId'] = cartItemId;
    }
    if (quantity != null) {
      _json[r'quantity'] = quantity;
    }
    if (price != null) {
      _json[r'price'] = price;
    }
    if (discountAmount != null) {
      _json[r'discountAmount'] = discountAmount;
    }
    if (taxAmount != null) {
      _json[r'taxAmount'] = taxAmount;
    }
    if (title != null) {
      _json[r'title'] = title;
    }
    if (imageUrl != null) {
      _json[r'imageUrl'] = imageUrl;
    }
    if (unit != null) {
      _json[r'unit'] = unit;
    }
    if (cartId != null) {
      _json[r'cartId'] = cartId;
    }
    if (productId != null) {
      _json[r'productId'] = productId;
    }
    if (sysCreatedBy != null) {
      _json[r'sys_CreatedBy'] = sysCreatedBy;
    }
    if (sysCreatedAt != null) {
      _json[r'sys_CreatedAt'] = sysCreatedAt!.toUtc().toIso8601String();
    }
    if (sysUpdatedBy != null) {
      _json[r'sys_UpdatedBy'] = sysUpdatedBy;
    }
    if (sysUpdatedAt != null) {
      _json[r'sys_UpdatedAt'] = sysUpdatedAt!.toUtc().toIso8601String();
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
        quantity: json[r'quantity'] == null
            ? null
            : num.parse(json[r'quantity'].toString()),
        price: json[r'price'] == null
            ? null
            : num.parse(json[r'price'].toString()),
        discountAmount: json[r'discountAmount'] == null
            ? null
            : num.parse(json[r'discountAmount'].toString()),
        taxAmount: json[r'taxAmount'] == null
            ? null
            : num.parse(json[r'taxAmount'].toString()),
        title: mapValueOfType<String>(json, r'title'),
        imageUrl: mapValueOfType<String>(json, r'imageUrl'),
        unit: mapValueOfType<String>(json, r'unit'),
        cartId: mapValueOfType<int>(json, r'cartId'),
        productId: mapValueOfType<int>(json, r'productId'),
        sysCreatedBy: mapValueOfType<String>(json, r'sys_CreatedBy'),
        sysCreatedAt: mapDateTime(json, r'sys_CreatedAt', ''),
        sysUpdatedBy: mapValueOfType<String>(json, r'sys_UpdatedBy'),
        sysUpdatedAt: mapDateTime(json, r'sys_UpdatedAt', ''),
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

