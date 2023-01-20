//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ProductCommand {
  /// Returns a new [ProductCommand] instance.
  ProductCommand({
    this.productId,
    this.categoryId,
    this.description,
    this.gtin,
    this.imageUrl,
    this.name,
    this.number,
    this.price,
    this.supplier,
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

  num? price;

  String? supplier;

  int? taxRateId;

  String? unit;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ProductCommand &&
     other.productId == productId &&
     other.categoryId == categoryId &&
     other.description == description &&
     other.gtin == gtin &&
     other.imageUrl == imageUrl &&
     other.name == name &&
     other.number == number &&
     other.price == price &&
     other.supplier == supplier &&
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
    (taxRateId == null ? 0 : taxRateId!.hashCode) +
    (unit == null ? 0 : unit!.hashCode);

  @override
  String toString() => 'ProductCommand[productId=$productId, categoryId=$categoryId, description=$description, gtin=$gtin, imageUrl=$imageUrl, name=$name, number=$number, price=$price, supplier=$supplier, taxRateId=$taxRateId, unit=$unit]';

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
    if (taxRateId != null) {
      _json[r'taxRateId'] = taxRateId;
    }
    if (unit != null) {
      _json[r'unit'] = unit;
    }
    return _json;
  }

  /// Returns a new [ProductCommand] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ProductCommand? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "ProductCommand[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "ProductCommand[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ProductCommand(
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
        taxRateId: mapValueOfType<int>(json, r'taxRateId'),
        unit: mapValueOfType<String>(json, r'unit'),
      );
    }
    return null;
  }

  static List<ProductCommand>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ProductCommand>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ProductCommand.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ProductCommand> mapFromJson(dynamic json) {
    final map = <String, ProductCommand>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ProductCommand.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ProductCommand-objects as value to a dart map
  static Map<String, List<ProductCommand>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ProductCommand>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ProductCommand.listFromJson(entry.value, growable: growable,);
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

