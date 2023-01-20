//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class OrderItemDto {
  /// Returns a new [OrderItemDto] instance.
  OrderItemDto({
    this.orderItemId,
    this.discountAmount,
    this.orderId,
    this.productId,
    this.productPrice,
    this.quantity,
    this.sysCreatedAt,
    this.sysCreatedBy,
    this.sysUpdatedAt,
    this.sysUpdatedBy,
    this.taxAmount,
  });

  int? orderItemId;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  num? discountAmount;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? orderId;

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
  num? productPrice;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  num? quantity;

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

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  num? taxAmount;

  @override
  bool operator ==(Object other) => identical(this, other) || other is OrderItemDto &&
     other.orderItemId == orderItemId &&
     other.discountAmount == discountAmount &&
     other.orderId == orderId &&
     other.productId == productId &&
     other.productPrice == productPrice &&
     other.quantity == quantity &&
     other.sysCreatedAt == sysCreatedAt &&
     other.sysCreatedBy == sysCreatedBy &&
     other.sysUpdatedAt == sysUpdatedAt &&
     other.sysUpdatedBy == sysUpdatedBy &&
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
    (sysCreatedAt == null ? 0 : sysCreatedAt!.hashCode) +
    (sysCreatedBy == null ? 0 : sysCreatedBy!.hashCode) +
    (sysUpdatedAt == null ? 0 : sysUpdatedAt!.hashCode) +
    (sysUpdatedBy == null ? 0 : sysUpdatedBy!.hashCode) +
    (taxAmount == null ? 0 : taxAmount!.hashCode);

  @override
  String toString() => 'OrderItemDto[orderItemId=$orderItemId, discountAmount=$discountAmount, orderId=$orderId, productId=$productId, productPrice=$productPrice, quantity=$quantity, sysCreatedAt=$sysCreatedAt, sysCreatedBy=$sysCreatedBy, sysUpdatedAt=$sysUpdatedAt, sysUpdatedBy=$sysUpdatedBy, taxAmount=$taxAmount]';

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
    if (taxAmount != null) {
      _json[r'taxAmount'] = taxAmount;
    }
    return _json;
  }

  /// Returns a new [OrderItemDto] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static OrderItemDto? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "OrderItemDto[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "OrderItemDto[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return OrderItemDto(
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
        sysCreatedAt: mapDateTime(json, r'sys_CreatedAt', ''),
        sysCreatedBy: mapValueOfType<String>(json, r'sys_CreatedBy'),
        sysUpdatedAt: mapDateTime(json, r'sys_UpdatedAt', ''),
        sysUpdatedBy: mapValueOfType<String>(json, r'sys_UpdatedBy'),
        taxAmount: json[r'taxAmount'] == null
            ? null
            : num.parse(json[r'taxAmount'].toString()),
      );
    }
    return null;
  }

  static List<OrderItemDto>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <OrderItemDto>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = OrderItemDto.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, OrderItemDto> mapFromJson(dynamic json) {
    final map = <String, OrderItemDto>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = OrderItemDto.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of OrderItemDto-objects as value to a dart map
  static Map<String, List<OrderItemDto>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<OrderItemDto>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = OrderItemDto.listFromJson(entry.value, growable: growable,);
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

