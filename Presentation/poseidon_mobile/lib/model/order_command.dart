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
    this.description,
    this.subTotal,
    this.productTaxAmount,
    this.productDiscountAmount,
    this.orderDiscountAmount,
    this.orderTaxAmount,
    this.orderTotal,
    this.orderStatus,
    this.payedAndClosed,
    this.shippingMethod,
    this.shippingFeeAmount,
    this.paymentMethod,
    this.paymentFeeAmount,
    this.shippingAddressId,
    this.billingAddressId,
    this.userId,
    this.cartId,
    this.deliveryId,
  });

  int? orderId;

  String? description;

  num? subTotal;

  num? productTaxAmount;

  num? productDiscountAmount;

  num? orderDiscountAmount;

  num? orderTaxAmount;

  num? orderTotal;

  String? orderStatus;

  bool? payedAndClosed;

  String? shippingMethod;

  num? shippingFeeAmount;

  String? paymentMethod;

  num? paymentFeeAmount;

  int? shippingAddressId;

  int? billingAddressId;

  int? userId;

  int? cartId;

  int? deliveryId;

  @override
  bool operator ==(Object other) => identical(this, other) || other is OrderCommand &&
     other.orderId == orderId &&
     other.description == description &&
     other.subTotal == subTotal &&
     other.productTaxAmount == productTaxAmount &&
     other.productDiscountAmount == productDiscountAmount &&
     other.orderDiscountAmount == orderDiscountAmount &&
     other.orderTaxAmount == orderTaxAmount &&
     other.orderTotal == orderTotal &&
     other.orderStatus == orderStatus &&
     other.payedAndClosed == payedAndClosed &&
     other.shippingMethod == shippingMethod &&
     other.shippingFeeAmount == shippingFeeAmount &&
     other.paymentMethod == paymentMethod &&
     other.paymentFeeAmount == paymentFeeAmount &&
     other.shippingAddressId == shippingAddressId &&
     other.billingAddressId == billingAddressId &&
     other.userId == userId &&
     other.cartId == cartId &&
     other.deliveryId == deliveryId;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (orderId == null ? 0 : orderId!.hashCode) +
    (description == null ? 0 : description!.hashCode) +
    (subTotal == null ? 0 : subTotal!.hashCode) +
    (productTaxAmount == null ? 0 : productTaxAmount!.hashCode) +
    (productDiscountAmount == null ? 0 : productDiscountAmount!.hashCode) +
    (orderDiscountAmount == null ? 0 : orderDiscountAmount!.hashCode) +
    (orderTaxAmount == null ? 0 : orderTaxAmount!.hashCode) +
    (orderTotal == null ? 0 : orderTotal!.hashCode) +
    (orderStatus == null ? 0 : orderStatus!.hashCode) +
    (payedAndClosed == null ? 0 : payedAndClosed!.hashCode) +
    (shippingMethod == null ? 0 : shippingMethod!.hashCode) +
    (shippingFeeAmount == null ? 0 : shippingFeeAmount!.hashCode) +
    (paymentMethod == null ? 0 : paymentMethod!.hashCode) +
    (paymentFeeAmount == null ? 0 : paymentFeeAmount!.hashCode) +
    (shippingAddressId == null ? 0 : shippingAddressId!.hashCode) +
    (billingAddressId == null ? 0 : billingAddressId!.hashCode) +
    (userId == null ? 0 : userId!.hashCode) +
    (cartId == null ? 0 : cartId!.hashCode) +
    (deliveryId == null ? 0 : deliveryId!.hashCode);

  @override
  String toString() => 'OrderCommand[orderId=$orderId, description=$description, subTotal=$subTotal, productTaxAmount=$productTaxAmount, productDiscountAmount=$productDiscountAmount, orderDiscountAmount=$orderDiscountAmount, orderTaxAmount=$orderTaxAmount, orderTotal=$orderTotal, orderStatus=$orderStatus, payedAndClosed=$payedAndClosed, shippingMethod=$shippingMethod, shippingFeeAmount=$shippingFeeAmount, paymentMethod=$paymentMethod, paymentFeeAmount=$paymentFeeAmount, shippingAddressId=$shippingAddressId, billingAddressId=$billingAddressId, userId=$userId, cartId=$cartId, deliveryId=$deliveryId]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
    if (orderId != null) {
      _json[r'orderId'] = orderId;
    }
    if (description != null) {
      _json[r'description'] = description;
    }
    if (subTotal != null) {
      _json[r'subTotal'] = subTotal;
    }
    if (productTaxAmount != null) {
      _json[r'productTaxAmount'] = productTaxAmount;
    }
    if (productDiscountAmount != null) {
      _json[r'productDiscountAmount'] = productDiscountAmount;
    }
    if (orderDiscountAmount != null) {
      _json[r'orderDiscountAmount'] = orderDiscountAmount;
    }
    if (orderTaxAmount != null) {
      _json[r'orderTaxAmount'] = orderTaxAmount;
    }
    if (orderTotal != null) {
      _json[r'orderTotal'] = orderTotal;
    }
    if (orderStatus != null) {
      _json[r'orderStatus'] = orderStatus;
    }
    if (payedAndClosed != null) {
      _json[r'payedAndClosed'] = payedAndClosed;
    }
    if (shippingMethod != null) {
      _json[r'shippingMethod'] = shippingMethod;
    }
    if (shippingFeeAmount != null) {
      _json[r'shippingFeeAmount'] = shippingFeeAmount;
    }
    if (paymentMethod != null) {
      _json[r'paymentMethod'] = paymentMethod;
    }
    if (paymentFeeAmount != null) {
      _json[r'paymentFeeAmount'] = paymentFeeAmount;
    }
    if (shippingAddressId != null) {
      _json[r'shippingAddressId'] = shippingAddressId;
    }
    if (billingAddressId != null) {
      _json[r'billingAddressId'] = billingAddressId;
    }
    if (userId != null) {
      _json[r'userId'] = userId;
    }
    if (cartId != null) {
      _json[r'cartId'] = cartId;
    }
    if (deliveryId != null) {
      _json[r'deliveryId'] = deliveryId;
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
        description: mapValueOfType<String>(json, r'description'),
        subTotal: json[r'subTotal'] == null
            ? null
            : num.parse(json[r'subTotal'].toString()),
        productTaxAmount: json[r'productTaxAmount'] == null
            ? null
            : num.parse(json[r'productTaxAmount'].toString()),
        productDiscountAmount: json[r'productDiscountAmount'] == null
            ? null
            : num.parse(json[r'productDiscountAmount'].toString()),
        orderDiscountAmount: json[r'orderDiscountAmount'] == null
            ? null
            : num.parse(json[r'orderDiscountAmount'].toString()),
        orderTaxAmount: json[r'orderTaxAmount'] == null
            ? null
            : num.parse(json[r'orderTaxAmount'].toString()),
        orderTotal: json[r'orderTotal'] == null
            ? null
            : num.parse(json[r'orderTotal'].toString()),
        orderStatus: mapValueOfType<String>(json, r'orderStatus'),
        payedAndClosed: mapValueOfType<bool>(json, r'payedAndClosed'),
        shippingMethod: mapValueOfType<String>(json, r'shippingMethod'),
        shippingFeeAmount: json[r'shippingFeeAmount'] == null
            ? null
            : num.parse(json[r'shippingFeeAmount'].toString()),
        paymentMethod: mapValueOfType<String>(json, r'paymentMethod'),
        paymentFeeAmount: json[r'paymentFeeAmount'] == null
            ? null
            : num.parse(json[r'paymentFeeAmount'].toString()),
        shippingAddressId: mapValueOfType<int>(json, r'shippingAddressId'),
        billingAddressId: mapValueOfType<int>(json, r'billingAddressId'),
        userId: mapValueOfType<int>(json, r'userId'),
        cartId: mapValueOfType<int>(json, r'cartId'),
        deliveryId: mapValueOfType<int>(json, r'deliveryId'),
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

