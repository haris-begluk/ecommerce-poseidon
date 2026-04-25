//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class WishListItemDto {
  /// Returns a new [WishListItemDto] instance.
  WishListItemDto({
    this.wishListItemId,
    this.note,
    this.quantity,
    this.wishListId,
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
  int? wishListItemId;

  String? note;

  num? quantity;

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
  bool operator ==(Object other) => identical(this, other) || other is WishListItemDto &&
     other.wishListItemId == wishListItemId &&
     other.note == note &&
     other.quantity == quantity &&
     other.wishListId == wishListId &&
     other.productId == productId &&
     other.sysCreatedBy == sysCreatedBy &&
     other.sysCreatedAt == sysCreatedAt &&
     other.sysUpdatedBy == sysUpdatedBy &&
     other.sysUpdatedAt == sysUpdatedAt;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (wishListItemId == null ? 0 : wishListItemId!.hashCode) +
    (note == null ? 0 : note!.hashCode) +
    (quantity == null ? 0 : quantity!.hashCode) +
    (wishListId == null ? 0 : wishListId!.hashCode) +
    (productId == null ? 0 : productId!.hashCode) +
    (sysCreatedBy == null ? 0 : sysCreatedBy!.hashCode) +
    (sysCreatedAt == null ? 0 : sysCreatedAt!.hashCode) +
    (sysUpdatedBy == null ? 0 : sysUpdatedBy!.hashCode) +
    (sysUpdatedAt == null ? 0 : sysUpdatedAt!.hashCode);

  @override
  String toString() => 'WishListItemDto[wishListItemId=$wishListItemId, note=$note, quantity=$quantity, wishListId=$wishListId, productId=$productId, sysCreatedBy=$sysCreatedBy, sysCreatedAt=$sysCreatedAt, sysUpdatedBy=$sysUpdatedBy, sysUpdatedAt=$sysUpdatedAt]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
    if (wishListItemId != null) {
      _json[r'wishListItemId'] = wishListItemId;
    }
    if (note != null) {
      _json[r'note'] = note;
    }
    if (quantity != null) {
      _json[r'quantity'] = quantity;
    }
    if (wishListId != null) {
      _json[r'wishListId'] = wishListId;
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

  /// Returns a new [WishListItemDto] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static WishListItemDto? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "WishListItemDto[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "WishListItemDto[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return WishListItemDto(
        wishListItemId: mapValueOfType<int>(json, r'wishListItemId'),
        note: mapValueOfType<String>(json, r'note'),
        quantity: json[r'quantity'] == null
            ? null
            : num.parse(json[r'quantity'].toString()),
        wishListId: mapValueOfType<int>(json, r'wishListId'),
        productId: mapValueOfType<int>(json, r'productId'),
        sysCreatedBy: mapValueOfType<String>(json, r'sys_CreatedBy'),
        sysCreatedAt: mapDateTime(json, r'sys_CreatedAt', ''),
        sysUpdatedBy: mapValueOfType<String>(json, r'sys_UpdatedBy'),
        sysUpdatedAt: mapDateTime(json, r'sys_UpdatedAt', ''),
      );
    }
    return null;
  }

  static List<WishListItemDto>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <WishListItemDto>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = WishListItemDto.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, WishListItemDto> mapFromJson(dynamic json) {
    final map = <String, WishListItemDto>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = WishListItemDto.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of WishListItemDto-objects as value to a dart map
  static Map<String, List<WishListItemDto>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<WishListItemDto>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = WishListItemDto.listFromJson(entry.value, growable: growable,);
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

