//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class PaymentCommand {
  /// Returns a new [PaymentCommand] instance.
  PaymentCommand({
    this.paymentId,
    this.amount,
    this.failureMessage,
    this.orderId,
    this.paymentFee,
    this.paymentProviderId,
  });

  int? paymentId;

  num? amount;

  String? failureMessage;

  int? orderId;

  num? paymentFee;

  int? paymentProviderId;

  @override
  bool operator ==(Object other) => identical(this, other) || other is PaymentCommand &&
     other.paymentId == paymentId &&
     other.amount == amount &&
     other.failureMessage == failureMessage &&
     other.orderId == orderId &&
     other.paymentFee == paymentFee &&
     other.paymentProviderId == paymentProviderId;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (paymentId == null ? 0 : paymentId!.hashCode) +
    (amount == null ? 0 : amount!.hashCode) +
    (failureMessage == null ? 0 : failureMessage!.hashCode) +
    (orderId == null ? 0 : orderId!.hashCode) +
    (paymentFee == null ? 0 : paymentFee!.hashCode) +
    (paymentProviderId == null ? 0 : paymentProviderId!.hashCode);

  @override
  String toString() => 'PaymentCommand[paymentId=$paymentId, amount=$amount, failureMessage=$failureMessage, orderId=$orderId, paymentFee=$paymentFee, paymentProviderId=$paymentProviderId]';

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
    return _json;
  }

  /// Returns a new [PaymentCommand] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static PaymentCommand? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "PaymentCommand[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "PaymentCommand[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return PaymentCommand(
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
      );
    }
    return null;
  }

  static List<PaymentCommand>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <PaymentCommand>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = PaymentCommand.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, PaymentCommand> mapFromJson(dynamic json) {
    final map = <String, PaymentCommand>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = PaymentCommand.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of PaymentCommand-objects as value to a dart map
  static Map<String, List<PaymentCommand>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<PaymentCommand>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = PaymentCommand.listFromJson(entry.value, growable: growable,);
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

