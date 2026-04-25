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
    this.name,
    this.isEnabled,
    this.additionalSettings,
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
  int? paymentProviderId;

  String? name;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? isEnabled;

  String? additionalSettings;

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
  bool operator ==(Object other) => identical(this, other) || other is PaymentProviderDto &&
     other.paymentProviderId == paymentProviderId &&
     other.name == name &&
     other.isEnabled == isEnabled &&
     other.additionalSettings == additionalSettings &&
     other.sysCreatedBy == sysCreatedBy &&
     other.sysCreatedAt == sysCreatedAt &&
     other.sysUpdatedBy == sysUpdatedBy &&
     other.sysUpdatedAt == sysUpdatedAt;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (paymentProviderId == null ? 0 : paymentProviderId!.hashCode) +
    (name == null ? 0 : name!.hashCode) +
    (isEnabled == null ? 0 : isEnabled!.hashCode) +
    (additionalSettings == null ? 0 : additionalSettings!.hashCode) +
    (sysCreatedBy == null ? 0 : sysCreatedBy!.hashCode) +
    (sysCreatedAt == null ? 0 : sysCreatedAt!.hashCode) +
    (sysUpdatedBy == null ? 0 : sysUpdatedBy!.hashCode) +
    (sysUpdatedAt == null ? 0 : sysUpdatedAt!.hashCode);

  @override
  String toString() => 'PaymentProviderDto[paymentProviderId=$paymentProviderId, name=$name, isEnabled=$isEnabled, additionalSettings=$additionalSettings, sysCreatedBy=$sysCreatedBy, sysCreatedAt=$sysCreatedAt, sysUpdatedBy=$sysUpdatedBy, sysUpdatedAt=$sysUpdatedAt]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
    if (paymentProviderId != null) {
      _json[r'paymentProviderId'] = paymentProviderId;
    }
    if (name != null) {
      _json[r'name'] = name;
    }
    if (isEnabled != null) {
      _json[r'isEnabled'] = isEnabled;
    }
    if (additionalSettings != null) {
      _json[r'additionalSettings'] = additionalSettings;
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
        name: mapValueOfType<String>(json, r'name'),
        isEnabled: mapValueOfType<bool>(json, r'isEnabled'),
        additionalSettings: mapValueOfType<String>(json, r'additionalSettings'),
        sysCreatedBy: mapValueOfType<String>(json, r'sys_CreatedBy'),
        sysCreatedAt: mapDateTime(json, r'sys_CreatedAt', ''),
        sysUpdatedBy: mapValueOfType<String>(json, r'sys_UpdatedBy'),
        sysUpdatedAt: mapDateTime(json, r'sys_UpdatedAt', ''),
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

