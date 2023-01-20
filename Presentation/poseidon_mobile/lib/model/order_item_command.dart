//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class OrderItemCommand {
  /// Returns a new [OrderItemCommand] instance.
  OrderItemCommand({
    this.orderItemId,
    this.discountAmount,
    this.orderId,
    this.productId,
    this.productPrice,
    this.quantity,
    this.taxAmount,
  });

  int? orderItemId;

  num? discountAmount;

  int? orderId;

  int? productId;

  num? productPrice;

  num? quantity;

  num? taxAmount;

  @override
  bool operator ==(Object other) => identical(this, other) || other is OrderItemCommand &&
     other.orderItemId == orderItemId &&
     other.discountAmount == discountAmount &&
     other.orderId == orderId &&
     other.productId == productId &&
     other.productPrice == productPrice &&
     other.quantity == quantity &&
     other.taxAmount == taxAmount;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (orderItemId == null ? 0 : orderItemId!.hashCode) +
    (discountAmount == null ? 0 : discountAmount!.hashCode) +
    (orderId == null ? 0 : orderId!.hashCode) +
    (productId == null ? 0 : productId!.hashCode) +
    (productPrice == null ? 0 : productPrice!.hashCode) +
    (quantity == null ? 0 : quantity!.hashCode) +
    (taxAmount == null ? 0 : taxAmount!.hashCode);

  @override
  String toString() => 'OrderItemCommand[orderItemId=$orderItemId, discountAmount=$discountAmount, orderId=$orderId, productId=$productId, productPrice=$productPrice, quantity=$quantity, taxAmount=$taxAmount]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
    if (orderItemId != null) {
      _json[r'orderItemId'] = orderItemId;
    }
    if (discountAmount != null) {
      _json[r'discountAmount'] = discountAmount;
    }
    if (orderId != null) {
      _json[r'orderId'] = orderId;
    }
    if (productId != null) {
      _json[r'productId'] = productId;
    }
    if (productPrice != null) {
      _json[r'productPrice'] = productPrice;
    }
    if (quantity != null) {
      _json[r'quantity'] = quantity;
    }
    if (taxAmount != null) {
      _json[r'taxAmount'] = taxAmount;
    }
    return _json;
  }

  /// Returns a new [OrderItemCommand] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static OrderItemCommand? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "OrderItemCommand[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "OrderItemCommand[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return OrderItemCommand(
        orderItemId: mapValueOfType<int>(json, r'orderItemId'),
        discountAmount: json[r'discountAmount'] == null
            ? null
            : num.parse(json[r'discountAmount'].toString()),
        orderId: mapValueOfType<int>(json, r'orderId'),
        productId: mapValueOfType<int>(json, r'productId'),
        productPrice: json[r'productPrice'] == null
            ? null
            : num.parse(json[r'productPrice'].toString()),
        quantity: json[r'quantity'] == null
            ? null
            : num.parse(json[r'quantity'].toString()),
        taxAmount: json[r'taxAmount'] == null
            ? null
            : num.parse(json[r'taxAmount'].toString()),
      );
    }
    return null;
  }

  static List<OrderItemCommand>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <OrderItemCommand>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = OrderItemCommand.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, OrderItemCommand> mapFromJson(dynamic json) {
    final map = <String, OrderItemCommand>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = OrderItemCommand.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of OrderItemCommand-objects as value to a dart map
  static Map<String, List<OrderItemCommand>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<OrderItemCommand>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = OrderItemCommand.listFromJson(entry.value, growable: growable,);
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

