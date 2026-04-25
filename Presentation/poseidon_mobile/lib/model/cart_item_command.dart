//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CartItemCommand {
  /// Returns a new [CartItemCommand] instance.
  CartItemCommand({
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
  });

  int? cartItemId;

  num? quantity;

  num? price;

  num? discountAmount;

  num? taxAmount;

  String? title;

  String? imageUrl;

  String? unit;

  int? cartId;

  int? productId;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CartItemCommand &&
     other.cartItemId == cartItemId &&
     other.quantity == quantity &&
     other.price == price &&
     other.discountAmount == discountAmount &&
     other.taxAmount == taxAmount &&
     other.title == title &&
     other.imageUrl == imageUrl &&
     other.unit == unit &&
     other.cartId == cartId &&
     other.productId == productId;

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
    (productId == null ? 0 : productId!.hashCode);

  @override
  String toString() => 'CartItemCommand[cartItemId=$cartItemId, quantity=$quantity, price=$price, discountAmount=$discountAmount, taxAmount=$taxAmount, title=$title, imageUrl=$imageUrl, unit=$unit, cartId=$cartId, productId=$productId]';

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
    return _json;
  }

  /// Returns a new [CartItemCommand] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CartItemCommand? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "CartItemCommand[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "CartItemCommand[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return CartItemCommand(
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
      );
    }
    return null;
  }

  static List<CartItemCommand>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CartItemCommand>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CartItemCommand.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CartItemCommand> mapFromJson(dynamic json) {
    final map = <String, CartItemCommand>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CartItemCommand.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CartItemCommand-objects as value to a dart map
  static Map<String, List<CartItemCommand>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<CartItemCommand>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CartItemCommand.listFromJson(entry.value, growable: growable,);
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

