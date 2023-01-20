//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ProductDto {
  /// Returns a new [ProductDto] instance.
  ProductDto({
    this.productId,
    this.categoryId,
    this.description,
    this.gtin,
    this.imageUrl,
    this.name,
    this.number,
    this.price,
    this.supplier,
    this.sysCreatedAt,
    this.sysCreatedBy,
    this.sysUpdatedAt,
    this.sysUpdatedBy,
    this.taxRateId,
    this.unit,
  });

  int? productId;

  int? categoryId;

  String? description;

  String? gtin;

  String? imageUrl;

  String? name;

  String? number;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  num? price;

  String? supplier;

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

  int? taxRateId;

  String? unit;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ProductDto &&
     other.productId == productId &&
     other.categoryId == categoryId &&
     other.description == description &&
     other.gtin == gtin &&
     other.imageUrl == imageUrl &&
     other.name == name &&
     other.number == number &&
     other.price == price &&
     other.supplier == supplier &&
     other.sysCreatedAt == sysCreatedAt &&
     other.sysCreatedBy == sysCreatedBy &&
     other.sysUpdatedAt == sysUpdatedAt &&
     other.sysUpdatedBy == sysUpdatedBy &&
     other.taxRateId == taxRateId &&
     other.unit == unit;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (productId == null ? 0 : productId!.hashCode) +
    (categoryId == null ? 0 : categoryId!.hashCode) +
    (description == null ? 0 : description!.hashCode) +
    (gtin == null ? 0 : gtin!.hashCode) +
    (imageUrl == null ? 0 : imageUrl!.hashCode) +
    (name == null ? 0 : name!.hashCode) +
    (number == null ? 0 : number!.hashCode) +
    (price == null ? 0 : price!.hashCode) +
    (supplier == null ? 0 : supplier!.hashCode) +
    (sysCreatedAt == null ? 0 : sysCreatedAt!.hashCode) +
    (sysCreatedBy == null ? 0 : sysCreatedBy!.hashCode) +
    (sysUpdatedAt == null ? 0 : sysUpdatedAt!.hashCode) +
    (sysUpdatedBy == null ? 0 : sysUpdatedBy!.hashCode) +
    (taxRateId == null ? 0 : taxRateId!.hashCode) +
    (unit == null ? 0 : unit!.hashCode);

  @override
  String toString() => 'ProductDto[productId=$productId, categoryId=$categoryId, description=$description, gtin=$gtin, imageUrl=$imageUrl, name=$name, number=$number, price=$price, supplier=$supplier, sysCreatedAt=$sysCreatedAt, sysCreatedBy=$sysCreatedBy, sysUpdatedAt=$sysUpdatedAt, sysUpdatedBy=$sysUpdatedBy, taxRateId=$taxRateId, unit=$unit]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
    if (productId != null) {
      _json[r'productId'] = productId;
    }
    if (categoryId != null) {
      _json[r'categoryId'] = categoryId;
    }
    if (description != null) {
      _json[r'description'] = description;
    }
    if (gtin != null) {
      _json[r'gtin'] = gtin;
    }
    if (imageUrl != null) {
      _json[r'imageUrl'] = imageUrl;
    }
    if (name != null) {
      _json[r'name'] = name;
    }
    if (number != null) {
      _json[r'number'] = number;
    }
    if (price != null) {
      _json[r'price'] = price;
    }
    if (supplier != null) {
      _json[r'supplier'] = supplier;
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
    if (taxRateId != null) {
      _json[r'taxRateId'] = taxRateId;
    }
    if (unit != null) {
      _json[r'unit'] = unit;
    }
    return _json;
  }

  /// Returns a new [ProductDto] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ProductDto? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "ProductDto[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "ProductDto[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ProductDto(
        productId: mapValueOfType<int>(json, r'productId'),
        categoryId: mapValueOfType<int>(json, r'categoryId'),
        description: mapValueOfType<String>(json, r'description'),
        gtin: mapValueOfType<String>(json, r'gtin'),
        imageUrl: mapValueOfType<String>(json, r'imageUrl'),
        name: mapValueOfType<String>(json, r'name'),
        number: mapValueOfType<String>(json, r'number'),
        price: json[r'price'] == null
            ? null
            : num.parse(json[r'price'].toString()),
        supplier: mapValueOfType<String>(json, r'supplier'),
        sysCreatedAt: mapDateTime(json, r'sys_CreatedAt', ''),
        sysCreatedBy: mapValueOfType<String>(json, r'sys_CreatedBy'),
        sysUpdatedAt: mapDateTime(json, r'sys_UpdatedAt', ''),
        sysUpdatedBy: mapValueOfType<String>(json, r'sys_UpdatedBy'),
        taxRateId: mapValueOfType<int>(json, r'taxRateId'),
        unit: mapValueOfType<String>(json, r'unit'),
      );
    }
    return null;
  }

  static List<ProductDto>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ProductDto>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ProductDto.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ProductDto> mapFromJson(dynamic json) {
    final map = <String, ProductDto>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ProductDto.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ProductDto-objects as value to a dart map
  static Map<String, List<ProductDto>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ProductDto>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ProductDto.listFromJson(entry.value, growable: growable,);
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

