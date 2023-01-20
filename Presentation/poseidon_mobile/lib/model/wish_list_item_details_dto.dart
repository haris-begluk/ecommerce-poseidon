//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class WishListItemDetailsDto {
  /// Returns a new [WishListItemDetailsDto] instance.
  WishListItemDetailsDto({
    this.wishListItemId,
    this.note,
    this.productId,
    this.quantity,
    this.sysCreatedAt,
    this.sysCreatedBy,
    this.sysUpdatedAt,
    this.sysUpdatedBy,
    this.wishListId,
    this.product,
  });

  int? wishListItemId;

  String? note;

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

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? wishListId;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  ProductDto? product;

  @override
  bool operator ==(Object other) => identical(this, other) || other is WishListItemDetailsDto &&
     other.wishListItemId == wishListItemId &&
     other.note == note &&
     other.productId == productId &&
     other.quantity == quantity &&
     other.sysCreatedAt == sysCreatedAt &&
     other.sysCreatedBy == sysCreatedBy &&
     other.sysUpdatedAt == sysUpdatedAt &&
     other.sysUpdatedBy == sysUpdatedBy &&
     other.wishListId == wishListId &&
     other.product == product;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (wishListItemId == null ? 0 : wishListItemId!.hashCode) +
    (note == null ? 0 : note!.hashCode) +
    (productId == null ? 0 : productId!.hashCode) +
    (quantity == null ? 0 : quantity!.hashCode) +
    (sysCreatedAt == null ? 0 : sysCreatedAt!.hashCode) +
    (sysCreatedBy == null ? 0 : sysCreatedBy!.hashCode) +
    (sysUpdatedAt == null ? 0 : sysUpdatedAt!.hashCode) +
    (sysUpdatedBy == null ? 0 : sysUpdatedBy!.hashCode) +
    (wishListId == null ? 0 : wishListId!.hashCode) +
    (product == null ? 0 : product!.hashCode);

  @override
  String toString() => 'WishListItemDetailsDto[wishListItemId=$wishListItemId, note=$note, productId=$productId, quantity=$quantity, sysCreatedAt=$sysCreatedAt, sysCreatedBy=$sysCreatedBy, sysUpdatedAt=$sysUpdatedAt, sysUpdatedBy=$sysUpdatedBy, wishListId=$wishListId, product=$product]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
    if (wishListItemId != null) {
      _json[r'wishListItemId'] = wishListItemId;
    }
    if (note != null) {
      _json[r'note'] = note;
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
    if (wishListId != null) {
      _json[r'wishListId'] = wishListId;
    }
    if (product != null) {
      _json[r'product'] = product;
    }
    return _json;
  }

  /// Returns a new [WishListItemDetailsDto] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static WishListItemDetailsDto? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "WishListItemDetailsDto[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "WishListItemDetailsDto[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return WishListItemDetailsDto(
        wishListItemId: mapValueOfType<int>(json, r'wishListItemId'),
        note: mapValueOfType<String>(json, r'note'),
        productId: mapValueOfType<int>(json, r'productId'),
        quantity: json[r'quantity'] == null
            ? null
            : num.parse(json[r'quantity'].toString()),
        sysCreatedAt: mapDateTime(json, r'sys_CreatedAt', ''),
        sysCreatedBy: mapValueOfType<String>(json, r'sys_CreatedBy'),
        sysUpdatedAt: mapDateTime(json, r'sys_UpdatedAt', ''),
        sysUpdatedBy: mapValueOfType<String>(json, r'sys_UpdatedBy'),
        wishListId: mapValueOfType<int>(json, r'wishListId'),
        product: ProductDto.fromJson(json[r'product']),
      );
    }
    return null;
  }

  static List<WishListItemDetailsDto>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <WishListItemDetailsDto>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = WishListItemDetailsDto.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, WishListItemDetailsDto> mapFromJson(dynamic json) {
    final map = <String, WishListItemDetailsDto>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = WishListItemDetailsDto.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of WishListItemDetailsDto-objects as value to a dart map
  static Map<String, List<WishListItemDetailsDto>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<WishListItemDetailsDto>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = WishListItemDetailsDto.listFromJson(entry.value, growable: growable,);
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

