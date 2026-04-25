//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CreditCardCommand {
  /// Returns a new [CreditCardCommand] instance.
  CreditCardCommand({
    this.creditCardId,
    this.creaditCartNumber,
    this.cvc,
    this.expirationDate,
    this.imageUrl,
    this.userId,
    this.paymentProviderId,
  });

  int? creditCardId;

  String? creaditCartNumber;

  String? cvc;

  DateTime? expirationDate;

  String? imageUrl;

  int? userId;

  int? paymentProviderId;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CreditCardCommand &&
     other.creditCardId == creditCardId &&
     other.creaditCartNumber == creaditCartNumber &&
     other.cvc == cvc &&
     other.expirationDate == expirationDate &&
     other.imageUrl == imageUrl &&
     other.userId == userId &&
     other.paymentProviderId == paymentProviderId;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (creditCardId == null ? 0 : creditCardId!.hashCode) +
    (creaditCartNumber == null ? 0 : creaditCartNumber!.hashCode) +
    (cvc == null ? 0 : cvc!.hashCode) +
    (expirationDate == null ? 0 : expirationDate!.hashCode) +
    (imageUrl == null ? 0 : imageUrl!.hashCode) +
    (userId == null ? 0 : userId!.hashCode) +
    (paymentProviderId == null ? 0 : paymentProviderId!.hashCode);

  @override
  String toString() => 'CreditCardCommand[creditCardId=$creditCardId, creaditCartNumber=$creaditCartNumber, cvc=$cvc, expirationDate=$expirationDate, imageUrl=$imageUrl, userId=$userId, paymentProviderId=$paymentProviderId]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
    if (creditCardId != null) {
      _json[r'creditCardId'] = creditCardId;
    }
    if (creaditCartNumber != null) {
      _json[r'creaditCartNumber'] = creaditCartNumber;
    }
    if (cvc != null) {
      _json[r'cvc'] = cvc;
    }
    if (expirationDate != null) {
      _json[r'expirationDate'] = expirationDate!.toUtc().toIso8601String();
    }
    if (imageUrl != null) {
      _json[r'imageUrl'] = imageUrl;
    }
    if (userId != null) {
      _json[r'userId'] = userId;
    }
    if (paymentProviderId != null) {
      _json[r'paymentProviderId'] = paymentProviderId;
    }
    return _json;
  }

  /// Returns a new [CreditCardCommand] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CreditCardCommand? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "CreditCardCommand[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "CreditCardCommand[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return CreditCardCommand(
        creditCardId: mapValueOfType<int>(json, r'creditCardId'),
        creaditCartNumber: mapValueOfType<String>(json, r'creaditCartNumber'),
        cvc: mapValueOfType<String>(json, r'cvc'),
        expirationDate: mapDateTime(json, r'expirationDate', ''),
        imageUrl: mapValueOfType<String>(json, r'imageUrl'),
        userId: mapValueOfType<int>(json, r'userId'),
        paymentProviderId: mapValueOfType<int>(json, r'paymentProviderId'),
      );
    }
    return null;
  }

  static List<CreditCardCommand>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CreditCardCommand>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CreditCardCommand.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CreditCardCommand> mapFromJson(dynamic json) {
    final map = <String, CreditCardCommand>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CreditCardCommand.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CreditCardCommand-objects as value to a dart map
  static Map<String, List<CreditCardCommand>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<CreditCardCommand>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CreditCardCommand.listFromJson(entry.value, growable: growable,);
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

