//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ProductDiscountOfferDto {
  /// Returns a new [ProductDiscountOfferDto] instance.
  ProductDiscountOfferDto({
    this.productDiscountOfferId,
    this.discountOfferId,
    this.productId,
    this.sysCreatedAt,
    this.sysCreatedBy,
    this.sysUpdatedAt,
    this.sysUpdatedBy,
  });

  int? productDiscountOfferId;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? discountOfferId;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? productId;

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

  @override
  bool operator ==(Object other) => identical(this, other) || other is ProductDiscountOfferDto &&
     other.productDiscountOfferId == productDiscountOfferId &&
     other.discountOfferId == discountOfferId &&
     other.productId == productId &&
     other.sysCreatedAt == sysCreatedAt &&
     other.sysCreatedBy == sysCreatedBy &&
     other.sysUpdatedAt == sysUpdatedAt &&
     other.sysUpdatedBy == sysUpdatedBy;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (productDiscountOfferId == null ? 0 : productDiscountOfferId!.hashCode) +
    (discountOfferId == null ? 0 : discountOfferId!.hashCode) +
    (productId == null ? 0 : productId!.hashCode) +
    (sysCreatedAt == null ? 0 : sysCreatedAt!.hashCode) +
    (sysCreatedBy == null ? 0 : sysCreatedBy!.hashCode) +
    (sysUpdatedAt == null ? 0 : sysUpdatedAt!.hashCode) +
    (sysUpdatedBy == null ? 0 : sysUpdatedBy!.hashCode);

  @override
  String toString() => 'ProductDiscountOfferDto[productDiscountOfferId=$productDiscountOfferId, discountOfferId=$discountOfferId, productId=$productId, sysCreatedAt=$sysCreatedAt, sysCreatedBy=$sysCreatedBy, sysUpdatedAt=$sysUpdatedAt, sysUpdatedBy=$sysUpdatedBy]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
    if (productDiscountOfferId != null) {
      _json[r'productDiscountOfferId'] = productDiscountOfferId;
    }
    if (discountOfferId != null) {
      _json[r'discountOfferId'] = discountOfferId;
    }
    if (productId != null) {
      _json[r'productId'] = productId;
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
    return _json;
  }

  /// Returns a new [ProductDiscountOfferDto] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ProductDiscountOfferDto? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "ProductDiscountOfferDto[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "ProductDiscountOfferDto[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ProductDiscountOfferDto(
        productDiscountOfferId: mapValueOfType<int>(json, r'productDiscountOfferId'),
        discountOfferId: mapValueOfType<int>(json, r'discountOfferId'),
        productId: mapValueOfType<int>(json, r'productId'),
        sysCreatedAt: mapDateTime(json, r'sys_CreatedAt', ''),
        sysCreatedBy: mapValueOfType<String>(json, r'sys_CreatedBy'),
        sysUpdatedAt: mapDateTime(json, r'sys_UpdatedAt', ''),
        sysUpdatedBy: mapValueOfType<String>(json, r'sys_UpdatedBy'),
      );
    }
    return null;
  }

  static List<ProductDiscountOfferDto>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ProductDiscountOfferDto>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ProductDiscountOfferDto.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ProductDiscountOfferDto> mapFromJson(dynamic json) {
    final map = <String, ProductDiscountOfferDto>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ProductDiscountOfferDto.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ProductDiscountOfferDto-objects as value to a dart map
  static Map<String, List<ProductDiscountOfferDto>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ProductDiscountOfferDto>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ProductDiscountOfferDto.listFromJson(entry.value, growable: growable,);
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

