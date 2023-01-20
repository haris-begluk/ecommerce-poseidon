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
    this.cartId,
    this.discountAmount,
    this.imageUrl,
    this.price,
    this.productId,
    this.quantity,
    this.taxAmount,
    this.title,
    this.unit,
  });

  int? cartItemId;

  int? cartId;

  num? discountAmount;

  String? imageUrl;

  num? price;

  int? productId;

  num? quantity;

  num? taxAmount;

  String? title;

  String? unit;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CartItemCommand &&
     other.cartItemId == cartItemId &&
     other.cartId == cartId &&
     other.discountAmount == discountAmount &&
     other.imageUrl == imageUrl &&
     other.price == price &&
     other.productId == productId &&
     other.quantity == quantity &&
     other.taxAmount == taxAmount &&
     other.title == title &&
     other.unit == unit;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (cartItemId == null ? 0 : cartItemId!.hashCode) +
    (cartId == null ? 0 : cartId!.hashCode) +
    (discountAmount == null ? 0 : discountAmount!.hashCode) +
    (imageUrl == null ? 0 : imageUrl!.hashCode) +
    (price == null ? 0 : price!.hashCode) +
    (productId == null ? 0 : productId!.hashCode) +
    (quantity == null ? 0 : quantity!.hashCode) +
    (taxAmount == null ? 0 : taxAmount!.hashCode) +
    (title == null ? 0 : title!.hashCode) +
    (unit == null ? 0 : unit!.hashCode);

  @override
  String toString() => 'CartItemCommand[cartItemId=$cartItemId, cartId=$cartId, discountAmount=$discountAmount, imageUrl=$imageUrl, price=$price, productId=$productId, quantity=$quantity, taxAmount=$taxAmount, title=$title, unit=$unit]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
    if (cartItemId != null) {
      _json[r'cartItemId'] = cartItemId;
    }
    if (cartId != null) {
      _json[r'cartId'] = cartId;
    }
    if (discountAmount != null) {
      _json[r'discountAmount'] = discountAmount;
    }
    if (imageUrl != null) {
      _json[r'imageUrl'] = imageUrl;
    }
    if (price != null) {
      _json[r'price'] = price;
    }
    if (productId != null) {
      _json[r'productId'] = productId;
    }
    if (quantity != null) {
      _json[r'quantity'] = quantity;
    }
    if (taxAmount != null) {
      _json[r'taxAmount'] = taxAmount;
    }
    if (title != null) {
      _json[r'title'] = title;
    }
    if (unit != null) {
      _json[r'unit'] = unit;
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
        cartId: mapValueOfType<int>(json, r'cartId'),
        discountAmount: json[r'discountAmount'] == null
            ? null
            : num.parse(json[r'discountAmount'].toString()),
        imageUrl: mapValueOfType<String>(json, r'imageUrl'),
        price: json[r'price'] == null
            ? null
            : num.parse(json[r'price'].toString()),
        productId: mapValueOfType<int>(json, r'productId'),
        quantity: json[r'quantity'] == null
            ? null
            : num.parse(json[r'quantity'].toString()),
        taxAmount: json[r'taxAmount'] == null
            ? null
            : num.parse(json[r'taxAmount'].toString()),
        title: mapValueOfType<String>(json, r'title'),
        unit: mapValueOfType<String>(json, r'unit'),
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

