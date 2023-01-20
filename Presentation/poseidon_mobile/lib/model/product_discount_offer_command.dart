//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ProductDiscountOfferCommand {
  /// Returns a new [ProductDiscountOfferCommand] instance.
  ProductDiscountOfferCommand({
    this.productDiscountOfferId,
    this.discountOfferId,
    this.productId,
  });

  int? productDiscountOfferId;

  int? discountOfferId;

  int? productId;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ProductDiscountOfferCommand &&
     other.productDiscountOfferId == productDiscountOfferId &&
     other.discountOfferId == discountOfferId &&
     other.productId == productId;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (productDiscountOfferId == null ? 0 : productDiscountOfferId!.hashCode) +
    (discountOfferId == null ? 0 : discountOfferId!.hashCode) +
    (productId == null ? 0 : productId!.hashCode);

  @override
  String toString() => 'ProductDiscountOfferCommand[productDiscountOfferId=$productDiscountOfferId, discountOfferId=$discountOfferId, productId=$productId]';

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
    return _json;
  }

  /// Returns a new [ProductDiscountOfferCommand] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ProductDiscountOfferCommand? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "ProductDiscountOfferCommand[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "ProductDiscountOfferCommand[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ProductDiscountOfferCommand(
        productDiscountOfferId: mapValueOfType<int>(json, r'productDiscountOfferId'),
        discountOfferId: mapValueOfType<int>(json, r'discountOfferId'),
        productId: mapValueOfType<int>(json, r'productId'),
      );
    }
    return null;
  }

  static List<ProductDiscountOfferCommand>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ProductDiscountOfferCommand>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ProductDiscountOfferCommand.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ProductDiscountOfferCommand> mapFromJson(dynamic json) {
    final map = <String, ProductDiscountOfferCommand>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ProductDiscountOfferCommand.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ProductDiscountOfferCommand-objects as value to a dart map
  static Map<String, List<ProductDiscountOfferCommand>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ProductDiscountOfferCommand>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ProductDiscountOfferCommand.listFromJson(entry.value, growable: growable,);
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

