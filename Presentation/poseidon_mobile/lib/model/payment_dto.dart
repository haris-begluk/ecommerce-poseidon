//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class PaymentDto {
  /// Returns a new [PaymentDto] instance.
  PaymentDto({
    this.paymentId,
    this.amount,
    this.failureMessage,
    this.orderId,
    this.paymentFee,
    this.paymentProviderId,
    this.sysCreatedAt,
    this.sysCreatedBy,
    this.sysUpdatedAt,
    this.sysUpdatedBy,
  });

  int? paymentId;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  num? amount;

  String? failureMessage;

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
  num? paymentFee;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? paymentProviderId;

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
  bool operator ==(Object other) => identical(this, other) || other is PaymentDto &&
     other.paymentId == paymentId &&
     other.amount == amount &&
     other.failureMessage == failureMessage &&
     other.orderId == orderId &&
     other.paymentFee == paymentFee &&
     other.paymentProviderId == paymentProviderId &&
     other.sysCreatedAt == sysCreatedAt &&
     other.sysCreatedBy == sysCreatedBy &&
     other.sysUpdatedAt == sysUpdatedAt &&
     other.sysUpdatedBy == sysUpdatedBy;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (paymentId == null ? 0 : paymentId!.hashCode) +
    (amount == null ? 0 : amount!.hashCode) +
    (failureMessage == null ? 0 : failureMessage!.hashCode) +
    (orderId == null ? 0 : orderId!.hashCode) +
    (paymentFee == null ? 0 : paymentFee!.hashCode) +
    (paymentProviderId == null ? 0 : paymentProviderId!.hashCode) +
    (sysCreatedAt == null ? 0 : sysCreatedAt!.hashCode) +
    (sysCreatedBy == null ? 0 : sysCreatedBy!.hashCode) +
    (sysUpdatedAt == null ? 0 : sysUpdatedAt!.hashCode) +
    (sysUpdatedBy == null ? 0 : sysUpdatedBy!.hashCode);

  @override
  String toString() => 'PaymentDto[paymentId=$paymentId, amount=$amount, failureMessage=$failureMessage, orderId=$orderId, paymentFee=$paymentFee, paymentProviderId=$paymentProviderId, sysCreatedAt=$sysCreatedAt, sysCreatedBy=$sysCreatedBy, sysUpdatedAt=$sysUpdatedAt, sysUpdatedBy=$sysUpdatedBy]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
    if (paymentId != null) {
      _json[r'paymentId'] = paymentId;
    }
    if (amount != null) {
      _json[r'amount'] = amount;
    }
    if (failureMessage != null) {
      _json[r'failureMessage'] = failureMessage;
    }
    if (orderId != null) {
      _json[r'orderId'] = orderId;
    }
    if (paymentFee != null) {
      _json[r'paymentFee'] = paymentFee;
    }
    if (paymentProviderId != null) {
      _json[r'paymentProviderId'] = paymentProviderId;
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

  /// Returns a new [PaymentDto] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static PaymentDto? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "PaymentDto[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "PaymentDto[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return PaymentDto(
        paymentId: mapValueOfType<int>(json, r'paymentId'),
        amount: json[r'amount'] == null
            ? null
            : num.parse(json[r'amount'].toString()),
        failureMessage: mapValueOfType<String>(json, r'failureMessage'),
        orderId: mapValueOfType<int>(json, r'orderId'),
        paymentFee: json[r'paymentFee'] == null
            ? null
            : num.parse(json[r'paymentFee'].toString()),
        paymentProviderId: mapValueOfType<int>(json, r'paymentProviderId'),
        sysCreatedAt: mapDateTime(json, r'sys_CreatedAt', ''),
        sysCreatedBy: mapValueOfType<String>(json, r'sys_CreatedBy'),
        sysUpdatedAt: mapDateTime(json, r'sys_UpdatedAt', ''),
        sysUpdatedBy: mapValueOfType<String>(json, r'sys_UpdatedBy'),
      );
    }
    return null;
  }

  static List<PaymentDto>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <PaymentDto>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = PaymentDto.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, PaymentDto> mapFromJson(dynamic json) {
    final map = <String, PaymentDto>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = PaymentDto.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of PaymentDto-objects as value to a dart map
  static Map<String, List<PaymentDto>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<PaymentDto>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = PaymentDto.listFromJson(entry.value, growable: growable,);
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

