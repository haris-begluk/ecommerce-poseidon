//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class OrderCommand {
  /// Returns a new [OrderCommand] instance.
  OrderCommand({
    this.orderId,
    this.billingAddressId,
    this.cartId,
    this.deliveryId,
    this.description,
    this.orderDiscountAmount,
    this.orderStatus,
    this.orderTaxAmount,
    this.orderTotal,
    this.payedAndClosed,
    this.paymentFeeAmount,
    this.paymentMethod,
    this.productDiscountAmount,
    this.productTaxAmount,
    this.shippingAddressId,
    this.shippingFeeAmount,
    this.shippingMethod,
    this.subTotal,
    this.userId,
  });

  int? orderId;

  int? billingAddressId;

  int? cartId;

  int? deliveryId;

  String? description;

  num? orderDiscountAmount;

  String? orderStatus;

  num? orderTaxAmount;

  num? orderTotal;

  bool? payedAndClosed;

  num? paymentFeeAmount;

  String? paymentMethod;

  num? productDiscountAmount;

  num? productTaxAmount;

  int? shippingAddressId;

  num? shippingFeeAmount;

  String? shippingMethod;

  num? subTotal;

  int? userId;

  @override
  bool operator ==(Object other) => identical(this, other) || other is OrderCommand &&
     other.orderId == orderId &&
     other.billingAddressId == billingAddressId &&
     other.cartId == cartId &&
     other.deliveryId == deliveryId &&
     other.description == description &&
     other.orderDiscountAmount == orderDiscountAmount &&
     other.orderStatus == orderStatus &&
     other.orderTaxAmount == orderTaxAmount &&
     other.orderTotal == orderTotal &&
     other.payedAndClosed == payedAndClosed &&
     other.paymentFeeAmount == paymentFeeAmount &&
     other.paymentMethod == paymentMethod &&
     other.productDiscountAmount == productDiscountAmount &&
     other.productTaxAmount == productTaxAmount &&
     other.shippingAddressId == shippingAddressId &&
     other.shippingFeeAmount == shippingFeeAmount &&
     other.shippingMethod == shippingMethod &&
     other.subTotal == subTotal &&
     other.userId == userId;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (orderId == null ? 0 : orderId!.hashCode) +
    (billingAddressId == null ? 0 : billingAddressId!.hashCode) +
    (cartId == null ? 0 : cartId!.hashCode) +
    (deliveryId == null ? 0 : deliveryId!.hashCode) +
    (description == null ? 0 : description!.hashCode) +
    (orderDiscountAmount == null ? 0 : orderDiscountAmount!.hashCode) +
    (orderStatus == null ? 0 : orderStatus!.hashCode) +
    (orderTaxAmount == null ? 0 : orderTaxAmount!.hashCode) +
    (orderTotal == null ? 0 : orderTotal!.hashCode) +
    (payedAndClosed == null ? 0 : payedAndClosed!.hashCode) +
    (paymentFeeAmount == null ? 0 : paymentFeeAmount!.hashCode) +
    (paymentMethod == null ? 0 : paymentMethod!.hashCode) +
    (productDiscountAmount == null ? 0 : productDiscountAmount!.hashCode) +
    (productTaxAmount == null ? 0 : productTaxAmount!.hashCode) +
    (shippingAddressId == null ? 0 : shippingAddressId!.hashCode) +
    (shippingFeeAmount == null ? 0 : shippingFeeAmount!.hashCode) +
    (shippingMethod == null ? 0 : shippingMethod!.hashCode) +
    (subTotal == null ? 0 : subTotal!.hashCode) +
    (userId == null ? 0 : userId!.hashCode);

  @override
  String toString() => 'OrderCommand[orderId=$orderId, billingAddressId=$billingAddressId, cartId=$cartId, deliveryId=$deliveryId, description=$description, orderDiscountAmount=$orderDiscountAmount, orderStatus=$orderStatus, orderTaxAmount=$orderTaxAmount, orderTotal=$orderTotal, payedAndClosed=$payedAndClosed, paymentFeeAmount=$paymentFeeAmount, paymentMethod=$paymentMethod, productDiscountAmount=$productDiscountAmount, productTaxAmount=$productTaxAmount, shippingAddressId=$shippingAddressId, shippingFeeAmount=$shippingFeeAmount, shippingMethod=$shippingMethod, subTotal=$subTotal, userId=$userId]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
    if (orderId != null) {
      _json[r'orderId'] = orderId;
    }
    if (billingAddressId != null) {
      _json[r'billingAddressId'] = billingAddressId;
    }
    if (cartId != null) {
      _json[r'cartId'] = cartId;
    }
    if (deliveryId != null) {
      _json[r'deliveryId'] = deliveryId;
    }
    if (description != null) {
      _json[r'description'] = description;
    }
    if (orderDiscountAmount != null) {
      _json[r'orderDiscountAmount'] = orderDiscountAmount;
    }
    if (orderStatus != null) {
      _json[r'orderStatus'] = orderStatus;
    }
    if (orderTaxAmount != null) {
      _json[r'orderTaxAmount'] = orderTaxAmount;
    }
    if (orderTotal != null) {
      _json[r'orderTotal'] = orderTotal;
    }
    if (payedAndClosed != null) {
      _json[r'payedAndClosed'] = payedAndClosed;
    }
    if (paymentFeeAmount != null) {
      _json[r'paymentFeeAmount'] = paymentFeeAmount;
    }
    if (paymentMethod != null) {
      _json[r'paymentMethod'] = paymentMethod;
    }
    if (productDiscountAmount != null) {
      _json[r'productDiscountAmount'] = productDiscountAmount;
    }
    if (productTaxAmount != null) {
      _json[r'productTaxAmount'] = productTaxAmount;
    }
    if (shippingAddressId != null) {
      _json[r'shippingAddressId'] = shippingAddressId;
    }
    if (shippingFeeAmount != null) {
      _json[r'shippingFeeAmount'] = shippingFeeAmount;
    }
    if (shippingMethod != null) {
      _json[r'shippingMethod'] = shippingMethod;
    }
    if (subTotal != null) {
      _json[r'subTotal'] = subTotal;
    }
    if (userId != null) {
      _json[r'userId'] = userId;
    }
    return _json;
  }

  /// Returns a new [OrderCommand] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static OrderCommand? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "OrderCommand[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "OrderCommand[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return OrderCommand(
        orderId: mapValueOfType<int>(json, r'orderId'),
        billingAddressId: mapValueOfType<int>(json, r'billingAddressId'),
        cartId: mapValueOfType<int>(json, r'cartId'),
        deliveryId: mapValueOfType<int>(json, r'deliveryId'),
        description: mapValueOfType<String>(json, r'description'),
        orderDiscountAmount: json[r'orderDiscountAmount'] == null
            ? null
            : num.parse(json[r'orderDiscountAmount'].toString()),
        orderStatus: mapValueOfType<String>(json, r'orderStatus'),
        orderTaxAmount: json[r'orderTaxAmount'] == null
            ? null
            : num.parse(json[r'orderTaxAmount'].toString()),
        orderTotal: json[r'orderTotal'] == null
            ? null
            : num.parse(json[r'orderTotal'].toString()),
        payedAndClosed: mapValueOfType<bool>(json, r'payedAndClosed'),
        paymentFeeAmount: json[r'paymentFeeAmount'] == null
            ? null
            : num.parse(json[r'paymentFeeAmount'].toString()),
        paymentMethod: mapValueOfType<String>(json, r'paymentMethod'),
        productDiscountAmount: json[r'productDiscountAmount'] == null
            ? null
            : num.parse(json[r'productDiscountAmount'].toString()),
        productTaxAmount: json[r'productTaxAmount'] == null
            ? null
            : num.parse(json[r'productTaxAmount'].toString()),
        shippingAddressId: mapValueOfType<int>(json, r'shippingAddressId'),
        shippingFeeAmount: json[r'shippingFeeAmount'] == null
            ? null
            : num.parse(json[r'shippingFeeAmount'].toString()),
        shippingMethod: mapValueOfType<String>(json, r'shippingMethod'),
        subTotal: json[r'subTotal'] == null
            ? null
            : num.parse(json[r'subTotal'].toString()),
        userId: mapValueOfType<int>(json, r'userId'),
      );
    }
    return null;
  }

  static List<OrderCommand>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <OrderCommand>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = OrderCommand.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, OrderCommand> mapFromJson(dynamic json) {
    final map = <String, OrderCommand>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = OrderCommand.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of OrderCommand-objects as value to a dart map
  static Map<String, List<OrderCommand>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<OrderCommand>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = OrderCommand.listFromJson(entry.value, growable: growable,);
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

