//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class PaymentProviderDto {
  /// Returns a new [PaymentProviderDto] instance.
  PaymentProviderDto({
    this.paymentProviderId,
    this.additionalSettings,
    this.isEnabled,
    this.name,
    this.sysCreatedAt,
    this.sysCreatedBy,
    this.sysUpdatedAt,
    this.sysUpdatedBy,
  });

  int? paymentProviderId;

  String? additionalSettings;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? isEnabled;

  String? name;

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

  @override
  bool operator ==(Object other) => identical(this, other) || other is PaymentProviderDto &&
     other.paymentProviderId == paymentProviderId &&
     other.additionalSettings == additionalSettings &&
     other.isEnabled == isEnabled &&
     other.name == name &&
     other.sysCreatedAt == sysCreatedAt &&
     other.sysCreatedBy == sysCreatedBy &&
     other.sysUpdatedAt == sysUpdatedAt &&
     other.sysUpdatedBy == sysUpdatedBy;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (paymentProviderId == null ? 0 : paymentProviderId!.hashCode) +
    (additionalSettings == null ? 0 : additionalSettings!.hashCode) +
    (isEnabled == null ? 0 : isEnabled!.hashCode) +
    (name == null ? 0 : name!.hashCode) +
    (sysCreatedAt == null ? 0 : sysCreatedAt!.hashCode) +
    (sysCreatedBy == null ? 0 : sysCreatedBy!.hashCode) +
    (sysUpdatedAt == null ? 0 : sysUpdatedAt!.hashCode) +
    (sysUpdatedBy == null ? 0 : sysUpdatedBy!.hashCode);

  @override
  String toString() => 'PaymentProviderDto[paymentProviderId=$paymentProviderId, additionalSettings=$additionalSettings, isEnabled=$isEnabled, name=$name, sysCreatedAt=$sysCreatedAt, sysCreatedBy=$sysCreatedBy, sysUpdatedAt=$sysUpdatedAt, sysUpdatedBy=$sysUpdatedBy]';

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
    return _json;
  }

  /// Returns a new [PaymentProviderDto] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static PaymentProviderDto? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "PaymentProviderDto[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "PaymentProviderDto[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return PaymentProviderDto(
        paymentProviderId: mapValueOfType<int>(json, r'paymentProviderId'),
        additionalSettings: mapValueOfType<String>(json, r'additionalSettings'),
        isEnabled: mapValueOfType<bool>(json, r'isEnabled'),
        name: mapValueOfType<String>(json, r'name'),
        sysCreatedAt: mapDateTime(json, r'sys_CreatedAt', ''),
        sysCreatedBy: mapValueOfType<String>(json, r'sys_CreatedBy'),
        sysUpdatedAt: mapDateTime(json, r'sys_UpdatedAt', ''),
        sysUpdatedBy: mapValueOfType<String>(json, r'sys_UpdatedBy'),
      );
    }
    return null;
  }

  static List<PaymentProviderDto>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <PaymentProviderDto>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = PaymentProviderDto.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, PaymentProviderDto> mapFromJson(dynamic json) {
    final map = <String, PaymentProviderDto>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = PaymentProviderDto.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of PaymentProviderDto-objects as value to a dart map
  static Map<String, List<PaymentProviderDto>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<PaymentProviderDto>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = PaymentProviderDto.listFromJson(entry.value, growable: growable,);
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

