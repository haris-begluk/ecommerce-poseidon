//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class TaxRateCommand {
  /// Returns a new [TaxRateCommand] instance.
  TaxRateCommand({
    this.taxRateId,
    this.name,
    this.rate,
  });

  int? taxRateId;

  String? name;

  num? rate;

  @override
  bool operator ==(Object other) => identical(this, other) || other is TaxRateCommand &&
     other.taxRateId == taxRateId &&
     other.name == name &&
     other.rate == rate;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (taxRateId == null ? 0 : taxRateId!.hashCode) +
    (name == null ? 0 : name!.hashCode) +
    (rate == null ? 0 : rate!.hashCode);

  @override
  String toString() => 'TaxRateCommand[taxRateId=$taxRateId, name=$name, rate=$rate]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
    if (taxRateId != null) {
      _json[r'taxRateId'] = taxRateId;
    }
    if (name != null) {
      _json[r'name'] = name;
    }
    if (rate != null) {
      _json[r'rate'] = rate;
    }
    return _json;
  }

  /// Returns a new [TaxRateCommand] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static TaxRateCommand? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "TaxRateCommand[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "TaxRateCommand[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return TaxRateCommand(
        taxRateId: mapValueOfType<int>(json, r'taxRateId'),
        name: mapValueOfType<String>(json, r'name'),
        rate: json[r'rate'] == null
            ? null
            : num.parse(json[r'rate'].toString()),
      );
    }
    return null;
  }

  static List<TaxRateCommand>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <TaxRateCommand>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = TaxRateCommand.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, TaxRateCommand> mapFromJson(dynamic json) {
    final map = <String, TaxRateCommand>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = TaxRateCommand.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of TaxRateCommand-objects as value to a dart map
  static Map<String, List<TaxRateCommand>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<TaxRateCommand>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = TaxRateCommand.listFromJson(entry.value, growable: growable,);
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

