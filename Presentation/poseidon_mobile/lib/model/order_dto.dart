//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class OrderDto {
  /// Returns a new [OrderDto] instance.
  OrderDto({
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
  int? orderId;

  String? description;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  num? subTotal;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  num? productTaxAmount;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  num? productDiscountAmount;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  num? orderDiscountAmount;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  num? orderTaxAmount;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  num? orderTotal;

  String? orderStatus;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? payedAndClosed;

  String? shippingMethod;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  num? shippingFeeAmount;

  String? paymentMethod;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  num? paymentFeeAmount;

  int? shippingAddressId;

  int? billingAddressId;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? userId;

  int? cartId;

  int? deliveryId;

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
  bool operator ==(Object other) => identical(this, other) || other is OrderDto &&
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
     other.deliveryId == deliveryId &&
     other.sysCreatedBy == sysCreatedBy &&
     other.sysCreatedAt == sysCreatedAt &&
     other.sysUpdatedBy == sysUpdatedBy &&
     other.sysUpdatedAt == sysUpdatedAt;

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
    (deliveryId == null ? 0 : deliveryId!.hashCode) +
    (sysCreatedBy == null ? 0 : sysCreatedBy!.hashCode) +
    (sysCreatedAt == null ? 0 : sysCreatedAt!.hashCode) +
    (sysUpdatedBy == null ? 0 : sysUpdatedBy!.hashCode) +
    (sysUpdatedAt == null ? 0 : sysUpdatedAt!.hashCode);

  @override
  String toString() => 'OrderDto[orderId=$orderId, description=$description, subTotal=$subTotal, productTaxAmount=$productTaxAmount, productDiscountAmount=$productDiscountAmount, orderDiscountAmount=$orderDiscountAmount, orderTaxAmount=$orderTaxAmount, orderTotal=$orderTotal, orderStatus=$orderStatus, payedAndClosed=$payedAndClosed, shippingMethod=$shippingMethod, shippingFeeAmount=$shippingFeeAmount, paymentMethod=$paymentMethod, paymentFeeAmount=$paymentFeeAmount, shippingAddressId=$shippingAddressId, billingAddressId=$billingAddressId, userId=$userId, cartId=$cartId, deliveryId=$deliveryId, sysCreatedBy=$sysCreatedBy, sysCreatedAt=$sysCreatedAt, sysUpdatedBy=$sysUpdatedBy, sysUpdatedAt=$sysUpdatedAt]';

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

  /// Returns a new [OrderDto] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static OrderDto? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "OrderDto[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "OrderDto[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return OrderDto(
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
        sysCreatedBy: mapValueOfType<String>(json, r'sys_CreatedBy'),
        sysCreatedAt: mapDateTime(json, r'sys_CreatedAt', ''),
        sysUpdatedBy: mapValueOfType<String>(json, r'sys_UpdatedBy'),
        sysUpdatedAt: mapDateTime(json, r'sys_UpdatedAt', ''),
      );
    }
    return null;
  }

  static List<OrderDto>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <OrderDto>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = OrderDto.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, OrderDto> mapFromJson(dynamic json) {
    final map = <String, OrderDto>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = OrderDto.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of OrderDto-objects as value to a dart map
  static Map<String, List<OrderDto>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<OrderDto>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = OrderDto.listFromJson(entry.value, growable: growable,);
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

