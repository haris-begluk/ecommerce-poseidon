//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class SettingsCommand {
  /// Returns a new [SettingsCommand] instance.
  SettingsCommand({
    this.settingsId,
    this.description,
    this.orderDiscountAmount,
    this.orderTaxAmount,
    this.paymentFeeAmount,
    this.paymentMethod,
    this.shippingFeeAmount,
    this.shippingMethod,
    this.supplier,
  });

  int? settingsId;

  String? description;

  num? orderDiscountAmount;

  num? orderTaxAmount;

  num? paymentFeeAmount;

  String? paymentMethod;

  num? shippingFeeAmount;

  String? shippingMethod;

  String? supplier;

  @override
  bool operator ==(Object other) => identical(this, other) || other is SettingsCommand &&
     other.settingsId == settingsId &&
     other.description == description &&
     other.orderDiscountAmount == orderDiscountAmount &&
     other.orderTaxAmount == orderTaxAmount &&
     other.paymentFeeAmount == paymentFeeAmount &&
     other.paymentMethod == paymentMethod &&
     other.shippingFeeAmount == shippingFeeAmount &&
     other.shippingMethod == shippingMethod &&
     other.supplier == supplier;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (settingsId == null ? 0 : settingsId!.hashCode) +
    (description == null ? 0 : description!.hashCode) +
    (orderDiscountAmount == null ? 0 : orderDiscountAmount!.hashCode) +
    (orderTaxAmount == null ? 0 : orderTaxAmount!.hashCode) +
    (paymentFeeAmount == null ? 0 : paymentFeeAmount!.hashCode) +
    (paymentMethod == null ? 0 : paymentMethod!.hashCode) +
    (shippingFeeAmount == null ? 0 : shippingFeeAmount!.hashCode) +
    (shippingMethod == null ? 0 : shippingMethod!.hashCode) +
    (supplier == null ? 0 : supplier!.hashCode);

  @override
  String toString() => 'SettingsCommand[settingsId=$settingsId, description=$description, orderDiscountAmount=$orderDiscountAmount, orderTaxAmount=$orderTaxAmount, paymentFeeAmount=$paymentFeeAmount, paymentMethod=$paymentMethod, shippingFeeAmount=$shippingFeeAmount, shippingMethod=$shippingMethod, supplier=$supplier]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
    if (settingsId != null) {
      _json[r'settingsId'] = settingsId;
    }
    if (description != null) {
      _json[r'description'] = description;
    }
    if (orderDiscountAmount != null) {
      _json[r'orderDiscountAmount'] = orderDiscountAmount;
    }
    if (orderTaxAmount != null) {
      _json[r'orderTaxAmount'] = orderTaxAmount;
    }
    if (paymentFeeAmount != null) {
      _json[r'paymentFeeAmount'] = paymentFeeAmount;
    }
    if (paymentMethod != null) {
      _json[r'paymentMethod'] = paymentMethod;
    }
    if (shippingFeeAmount != null) {
      _json[r'shippingFeeAmount'] = shippingFeeAmount;
    }
    if (shippingMethod != null) {
      _json[r'shippingMethod'] = shippingMethod;
    }
    if (supplier != null) {
      _json[r'supplier'] = supplier;
    }
    return _json;
  }

  /// Returns a new [SettingsCommand] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static SettingsCommand? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "SettingsCommand[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "SettingsCommand[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return SettingsCommand(
        settingsId: mapValueOfType<int>(json, r'settingsId'),
        description: mapValueOfType<String>(json, r'description'),
        orderDiscountAmount: json[r'orderDiscountAmount'] == null
            ? null
            : num.parse(json[r'orderDiscountAmount'].toString()),
        orderTaxAmount: json[r'orderTaxAmount'] == null
            ? null
            : num.parse(json[r'orderTaxAmount'].toString()),
        paymentFeeAmount: json[r'paymentFeeAmount'] == null
            ? null
            : num.parse(json[r'paymentFeeAmount'].toString()),
        paymentMethod: mapValueOfType<String>(json, r'paymentMethod'),
        shippingFeeAmount: json[r'shippingFeeAmount'] == null
            ? null
            : num.parse(json[r'shippingFeeAmount'].toString()),
        shippingMethod: mapValueOfType<String>(json, r'shippingMethod'),
        supplier: mapValueOfType<String>(json, r'supplier'),
      );
    }
    return null;
  }

  static List<SettingsCommand>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <SettingsCommand>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SettingsCommand.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, SettingsCommand> mapFromJson(dynamic json) {
    final map = <String, SettingsCommand>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = SettingsCommand.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of SettingsCommand-objects as value to a dart map
  static Map<String, List<SettingsCommand>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<SettingsCommand>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = SettingsCommand.listFromJson(entry.value, growable: growable,);
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

