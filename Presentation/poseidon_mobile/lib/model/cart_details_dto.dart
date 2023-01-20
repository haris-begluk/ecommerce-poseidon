//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CartDetailsDto {
  /// Returns a new [CartDetailsDto] instance.
  CartDetailsDto({
    this.cartId,
    this.discountAmount,
    this.isActive,
    this.lockedOnCheckout,
    this.sysCreatedAt,
    this.sysCreatedBy,
    this.sysUpdatedAt,
    this.sysUpdatedBy,
    this.taxAmount,
    this.total,
    this.userId,
    this.cartItem = const [],
  });

  int? cartId;

  num? discountAmount;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? isActive;

  bool? lockedOnCheckout;

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

  num? total;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? userId;

  List<CartItemDto>? cartItem;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CartDetailsDto &&
     other.cartId == cartId &&
     other.discountAmount == discountAmount &&
     other.isActive == isActive &&
     other.lockedOnCheckout == lockedOnCheckout &&
     other.sysCreatedAt == sysCreatedAt &&
     other.sysCreatedBy == sysCreatedBy &&
     other.sysUpdatedAt == sysUpdatedAt &&
     other.sysUpdatedBy == sysUpdatedBy &&
     other.taxAmount == taxAmount &&
     other.total == total &&
     other.userId == userId &&
     other.cartItem == cartItem;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (cartId == null ? 0 : cartId!.hashCode) +
    (discountAmount == null ? 0 : discountAmount!.hashCode) +
    (isActive == null ? 0 : isActive!.hashCode) +
    (lockedOnCheckout == null ? 0 : lockedOnCheckout!.hashCode) +
    (sysCreatedAt == null ? 0 : sysCreatedAt!.hashCode) +
    (sysCreatedBy == null ? 0 : sysCreatedBy!.hashCode) +
    (sysUpdatedAt == null ? 0 : sysUpdatedAt!.hashCode) +
    (sysUpdatedBy == null ? 0 : sysUpdatedBy!.hashCode) +
    (taxAmount == null ? 0 : taxAmount!.hashCode) +
    (total == null ? 0 : total!.hashCode) +
    (userId == null ? 0 : userId!.hashCode) +
    (cartItem == null ? 0 : cartItem!.hashCode);

  @override
  String toString() => 'CartDetailsDto[cartId=$cartId, discountAmount=$discountAmount, isActive=$isActive, lockedOnCheckout=$lockedOnCheckout, sysCreatedAt=$sysCreatedAt, sysCreatedBy=$sysCreatedBy, sysUpdatedAt=$sysUpdatedAt, sysUpdatedBy=$sysUpdatedBy, taxAmount=$taxAmount, total=$total, userId=$userId, cartItem=$cartItem]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
    if (cartId != null) {
      _json[r'cartId'] = cartId;
    }
    if (discountAmount != null) {
      _json[r'discountAmount'] = discountAmount;
    }
    if (isActive != null) {
      _json[r'isActive'] = isActive;
    }
    if (lockedOnCheckout != null) {
      _json[r'lockedOnCheckout'] = lockedOnCheckout;
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
    if (total != null) {
      _json[r'total'] = total;
    }
    if (userId != null) {
      _json[r'userId'] = userId;
    }
    if (cartItem != null) {
      _json[r'cartItem'] = cartItem;
    }
    return _json;
  }

  /// Returns a new [CartDetailsDto] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CartDetailsDto? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "CartDetailsDto[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "CartDetailsDto[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return CartDetailsDto(
        cartId: mapValueOfType<int>(json, r'cartId'),
        discountAmount: json[r'discountAmount'] == null
            ? null
            : num.parse(json[r'discountAmount'].toString()),
        isActive: mapValueOfType<bool>(json, r'isActive'),
        lockedOnCheckout: mapValueOfType<bool>(json, r'lockedOnCheckout'),
        sysCreatedAt: mapDateTime(json, r'sys_CreatedAt', ''),
        sysCreatedBy: mapValueOfType<String>(json, r'sys_CreatedBy'),
        sysUpdatedAt: mapDateTime(json, r'sys_UpdatedAt', ''),
        sysUpdatedBy: mapValueOfType<String>(json, r'sys_UpdatedBy'),
        taxAmount: json[r'taxAmount'] == null
            ? null
            : num.parse(json[r'taxAmount'].toString()),
        total: json[r'total'] == null
            ? null
            : num.parse(json[r'total'].toString()),
        userId: mapValueOfType<int>(json, r'userId'),
        cartItem: CartItemDto.listFromJson(json[r'cartItem']) ?? const [],
      );
    }
    return null;
  }

  static List<CartDetailsDto>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CartDetailsDto>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CartDetailsDto.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CartDetailsDto> mapFromJson(dynamic json) {
    final map = <String, CartDetailsDto>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CartDetailsDto.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CartDetailsDto-objects as value to a dart map
  static Map<String, List<CartDetailsDto>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<CartDetailsDto>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CartDetailsDto.listFromJson(entry.value, growable: growable,);
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

