//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CartDto {
  /// Returns a new [CartDto] instance.
  CartDto({
    this.cartId,
    this.isActive,
    this.lockedOnCheckout,
    this.userId,
    this.total,
    this.taxAmount,
    this.discountAmount,
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
  int? cartId;

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
  int? userId;

  num? total;

  num? taxAmount;

  num? discountAmount;

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
  bool operator ==(Object other) => identical(this, other) || other is CartDto &&
     other.cartId == cartId &&
     other.isActive == isActive &&
     other.lockedOnCheckout == lockedOnCheckout &&
     other.userId == userId &&
     other.total == total &&
     other.taxAmount == taxAmount &&
     other.discountAmount == discountAmount &&
     other.sysCreatedBy == sysCreatedBy &&
     other.sysCreatedAt == sysCreatedAt &&
     other.sysUpdatedBy == sysUpdatedBy &&
     other.sysUpdatedAt == sysUpdatedAt;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (cartId == null ? 0 : cartId!.hashCode) +
    (isActive == null ? 0 : isActive!.hashCode) +
    (lockedOnCheckout == null ? 0 : lockedOnCheckout!.hashCode) +
    (userId == null ? 0 : userId!.hashCode) +
    (total == null ? 0 : total!.hashCode) +
    (taxAmount == null ? 0 : taxAmount!.hashCode) +
    (discountAmount == null ? 0 : discountAmount!.hashCode) +
    (sysCreatedBy == null ? 0 : sysCreatedBy!.hashCode) +
    (sysCreatedAt == null ? 0 : sysCreatedAt!.hashCode) +
    (sysUpdatedBy == null ? 0 : sysUpdatedBy!.hashCode) +
    (sysUpdatedAt == null ? 0 : sysUpdatedAt!.hashCode);

  @override
  String toString() => 'CartDto[cartId=$cartId, isActive=$isActive, lockedOnCheckout=$lockedOnCheckout, userId=$userId, total=$total, taxAmount=$taxAmount, discountAmount=$discountAmount, sysCreatedBy=$sysCreatedBy, sysCreatedAt=$sysCreatedAt, sysUpdatedBy=$sysUpdatedBy, sysUpdatedAt=$sysUpdatedAt]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
    if (cartId != null) {
      _json[r'cartId'] = cartId;
    }
    if (isActive != null) {
      _json[r'isActive'] = isActive;
    }
    if (lockedOnCheckout != null) {
      _json[r'lockedOnCheckout'] = lockedOnCheckout;
    }
    if (userId != null) {
      _json[r'userId'] = userId;
    }
    if (total != null) {
      _json[r'total'] = total;
    }
    if (taxAmount != null) {
      _json[r'taxAmount'] = taxAmount;
    }
    if (discountAmount != null) {
      _json[r'discountAmount'] = discountAmount;
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

  /// Returns a new [CartDto] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CartDto? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "CartDto[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "CartDto[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return CartDto(
        cartId: mapValueOfType<int>(json, r'cartId'),
        isActive: mapValueOfType<bool>(json, r'isActive'),
        lockedOnCheckout: mapValueOfType<bool>(json, r'lockedOnCheckout'),
        userId: mapValueOfType<int>(json, r'userId'),
        total: json[r'total'] == null
            ? null
            : num.parse(json[r'total'].toString()),
        taxAmount: json[r'taxAmount'] == null
            ? null
            : num.parse(json[r'taxAmount'].toString()),
        discountAmount: json[r'discountAmount'] == null
            ? null
            : num.parse(json[r'discountAmount'].toString()),
        sysCreatedBy: mapValueOfType<String>(json, r'sys_CreatedBy'),
        sysCreatedAt: mapDateTime(json, r'sys_CreatedAt', ''),
        sysUpdatedBy: mapValueOfType<String>(json, r'sys_UpdatedBy'),
        sysUpdatedAt: mapDateTime(json, r'sys_UpdatedAt', ''),
      );
    }
    return null;
  }

  static List<CartDto>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CartDto>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CartDto.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CartDto> mapFromJson(dynamic json) {
    final map = <String, CartDto>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CartDto.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CartDto-objects as value to a dart map
  static Map<String, List<CartDto>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<CartDto>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CartDto.listFromJson(entry.value, growable: growable,);
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

