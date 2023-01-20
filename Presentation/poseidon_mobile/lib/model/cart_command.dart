//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CartCommand {
  /// Returns a new [CartCommand] instance.
  CartCommand({
    this.cartId,
    this.discountAmount,
    this.isActive,
    this.lockedOnCheckout,
    this.taxAmount,
    this.total,
    this.userId,
  });

  int? cartId;

  num? discountAmount;

  bool? isActive;

  bool? lockedOnCheckout;

  num? taxAmount;

  num? total;

  int? userId;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CartCommand &&
     other.cartId == cartId &&
     other.discountAmount == discountAmount &&
     other.isActive == isActive &&
     other.lockedOnCheckout == lockedOnCheckout &&
     other.taxAmount == taxAmount &&
     other.total == total &&
     other.userId == userId;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (cartId == null ? 0 : cartId!.hashCode) +
    (discountAmount == null ? 0 : discountAmount!.hashCode) +
    (isActive == null ? 0 : isActive!.hashCode) +
    (lockedOnCheckout == null ? 0 : lockedOnCheckout!.hashCode) +
    (taxAmount == null ? 0 : taxAmount!.hashCode) +
    (total == null ? 0 : total!.hashCode) +
    (userId == null ? 0 : userId!.hashCode);

  @override
  String toString() => 'CartCommand[cartId=$cartId, discountAmount=$discountAmount, isActive=$isActive, lockedOnCheckout=$lockedOnCheckout, taxAmount=$taxAmount, total=$total, userId=$userId]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
    if (cartId != null) {
      _json[r'cartId'] = cartId;
    }
    if (discountAmount != null) {
      _json[r'discountAmount'] = discountAmount;
    }
    if (isActive != null) {
      _json[r'isActive'] = isActive;
    }
    if (lockedOnCheckout != null) {
      _json[r'lockedOnCheckout'] = lockedOnCheckout;
    }
    if (taxAmount != null) {
      _json[r'taxAmount'] = taxAmount;
    }
    if (total != null) {
      _json[r'total'] = total;
    }
    if (userId != null) {
      _json[r'userId'] = userId;
    }
    return _json;
  }

  /// Returns a new [CartCommand] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CartCommand? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "CartCommand[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "CartCommand[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return CartCommand(
        cartId: mapValueOfType<int>(json, r'cartId'),
        discountAmount: json[r'discountAmount'] == null
            ? null
            : num.parse(json[r'discountAmount'].toString()),
        isActive: mapValueOfType<bool>(json, r'isActive'),
        lockedOnCheckout: mapValueOfType<bool>(json, r'lockedOnCheckout'),
        taxAmount: json[r'taxAmount'] == null
            ? null
            : num.parse(json[r'taxAmount'].toString()),
        total: json[r'total'] == null
            ? null
            : num.parse(json[r'total'].toString()),
        userId: mapValueOfType<int>(json, r'userId'),
      );
    }
    return null;
  }

  static List<CartCommand>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CartCommand>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CartCommand.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CartCommand> mapFromJson(dynamic json) {
    final map = <String, CartCommand>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CartCommand.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CartCommand-objects as value to a dart map
  static Map<String, List<CartCommand>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<CartCommand>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CartCommand.listFromJson(entry.value, growable: growable,);
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

