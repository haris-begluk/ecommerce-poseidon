//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class PaymentProviderCommand {
  /// Returns a new [PaymentProviderCommand] instance.
  PaymentProviderCommand({
    this.paymentProviderId,
    this.additionalSettings,
    this.isEnabled,
    this.name,
  });

  int? paymentProviderId;

  String? additionalSettings;

  bool? isEnabled;

  String? name;

  @override
  bool operator ==(Object other) => identical(this, other) || other is PaymentProviderCommand &&
     other.paymentProviderId == paymentProviderId &&
     other.additionalSettings == additionalSettings &&
     other.isEnabled == isEnabled &&
     other.name == name;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (paymentProviderId == null ? 0 : paymentProviderId!.hashCode) +
    (additionalSettings == null ? 0 : additionalSettings!.hashCode) +
    (isEnabled == null ? 0 : isEnabled!.hashCode) +
    (name == null ? 0 : name!.hashCode);

  @override
  String toString() => 'PaymentProviderCommand[paymentProviderId=$paymentProviderId, additionalSettings=$additionalSettings, isEnabled=$isEnabled, name=$name]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
    if (paymentProviderId != null) {
      _json[r'paymentProviderId'] = paymentProviderId;
    }
    if (additionalSettings != null) {
      _json[r'additionalSettings'] = additionalSettings;
    }
    if (isEnabled != null) {
      _json[r'isEnabled'] = isEnabled;
    }
    if (name != null) {
      _json[r'name'] = name;
    }
    return _json;
  }

  /// Returns a new [PaymentProviderCommand] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static PaymentProviderCommand? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "PaymentProviderCommand[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "PaymentProviderCommand[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return PaymentProviderCommand(
        paymentProviderId: mapValueOfType<int>(json, r'paymentProviderId'),
        additionalSettings: mapValueOfType<String>(json, r'additionalSettings'),
        isEnabled: mapValueOfType<bool>(json, r'isEnabled'),
        name: mapValueOfType<String>(json, r'name'),
      );
    }
    return null;
  }

  static List<PaymentProviderCommand>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <PaymentProviderCommand>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = PaymentProviderCommand.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, PaymentProviderCommand> mapFromJson(dynamic json) {
    final map = <String, PaymentProviderCommand>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = PaymentProviderCommand.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of PaymentProviderCommand-objects as value to a dart map
  static Map<String, List<PaymentProviderCommand>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<PaymentProviderCommand>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = PaymentProviderCommand.listFromJson(entry.value, growable: growable,);
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

