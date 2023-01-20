//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CreditCardDto {
  /// Returns a new [CreditCardDto] instance.
  CreditCardDto({
    this.creditCardId,
    this.cvc,
    this.creaditCartNumber,
    this.expirationDate,
    this.imageUrl,
    this.paymentProviderId,
    this.sysCreatedAt,
    this.sysCreatedBy,
    this.sysUpdatedAt,
    this.sysUpdatedBy,
    this.userId,
  });

  int? creditCardId;

  String? cvc;

  String? creaditCartNumber;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? expirationDate;

  String? imageUrl;

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

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? userId;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CreditCardDto &&
     other.creditCardId == creditCardId &&
     other.cvc == cvc &&
     other.creaditCartNumber == creaditCartNumber &&
     other.expirationDate == expirationDate &&
     other.imageUrl == imageUrl &&
     other.paymentProviderId == paymentProviderId &&
     other.sysCreatedAt == sysCreatedAt &&
     other.sysCreatedBy == sysCreatedBy &&
     other.sysUpdatedAt == sysUpdatedAt &&
     other.sysUpdatedBy == sysUpdatedBy &&
     other.userId == userId;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (creditCardId == null ? 0 : creditCardId!.hashCode) +
    (cvc == null ? 0 : cvc!.hashCode) +
    (creaditCartNumber == null ? 0 : creaditCartNumber!.hashCode) +
    (expirationDate == null ? 0 : expirationDate!.hashCode) +
    (imageUrl == null ? 0 : imageUrl!.hashCode) +
    (paymentProviderId == null ? 0 : paymentProviderId!.hashCode) +
    (sysCreatedAt == null ? 0 : sysCreatedAt!.hashCode) +
    (sysCreatedBy == null ? 0 : sysCreatedBy!.hashCode) +
    (sysUpdatedAt == null ? 0 : sysUpdatedAt!.hashCode) +
    (sysUpdatedBy == null ? 0 : sysUpdatedBy!.hashCode) +
    (userId == null ? 0 : userId!.hashCode);

  @override
  String toString() => 'CreditCardDto[creditCardId=$creditCardId, cvc=$cvc, creaditCartNumber=$creaditCartNumber, expirationDate=$expirationDate, imageUrl=$imageUrl, paymentProviderId=$paymentProviderId, sysCreatedAt=$sysCreatedAt, sysCreatedBy=$sysCreatedBy, sysUpdatedAt=$sysUpdatedAt, sysUpdatedBy=$sysUpdatedBy, userId=$userId]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
    if (creditCardId != null) {
      _json[r'creditCardId'] = creditCardId;
    }
    if (cvc != null) {
      _json[r'cvc'] = cvc;
    }
    if (creaditCartNumber != null) {
      _json[r'creaditCartNumber'] = creaditCartNumber;
    }
    if (expirationDate != null) {
      _json[r'expirationDate'] = expirationDate!.toUtc().toIso8601String();
    }
    if (imageUrl != null) {
      _json[r'imageUrl'] = imageUrl;
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
    if (userId != null) {
      _json[r'userId'] = userId;
    }
    return _json;
  }

  /// Returns a new [CreditCardDto] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CreditCardDto? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "CreditCardDto[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "CreditCardDto[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return CreditCardDto(
        creditCardId: mapValueOfType<int>(json, r'creditCardId'),
        cvc: mapValueOfType<String>(json, r'cvc'),
        creaditCartNumber: mapValueOfType<String>(json, r'creaditCartNumber'),
        expirationDate: mapDateTime(json, r'expirationDate', ''),
        imageUrl: mapValueOfType<String>(json, r'imageUrl'),
        paymentProviderId: mapValueOfType<int>(json, r'paymentProviderId'),
        sysCreatedAt: mapDateTime(json, r'sys_CreatedAt', ''),
        sysCreatedBy: mapValueOfType<String>(json, r'sys_CreatedBy'),
        sysUpdatedAt: mapDateTime(json, r'sys_UpdatedAt', ''),
        sysUpdatedBy: mapValueOfType<String>(json, r'sys_UpdatedBy'),
        userId: mapValueOfType<int>(json, r'userId'),
      );
    }
    return null;
  }

  static List<CreditCardDto>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CreditCardDto>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CreditCardDto.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CreditCardDto> mapFromJson(dynamic json) {
    final map = <String, CreditCardDto>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CreditCardDto.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CreditCardDto-objects as value to a dart map
  static Map<String, List<CreditCardDto>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<CreditCardDto>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CreditCardDto.listFromJson(entry.value, growable: growable,);
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

