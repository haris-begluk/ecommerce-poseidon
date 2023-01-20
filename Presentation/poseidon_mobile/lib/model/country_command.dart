//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CountryCommand {
  /// Returns a new [CountryCommand] instance.
  CountryCommand({
    this.countryId,
    this.name,
    this.numericIsoCode,
    this.phonePrefix,
    this.threeLetterIsoCode,
    this.twoLetterIsoCode,
  });

  int? countryId;

  String? name;

  int? numericIsoCode;

  String? phonePrefix;

  String? threeLetterIsoCode;

  String? twoLetterIsoCode;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CountryCommand &&
     other.countryId == countryId &&
     other.name == name &&
     other.numericIsoCode == numericIsoCode &&
     other.phonePrefix == phonePrefix &&
     other.threeLetterIsoCode == threeLetterIsoCode &&
     other.twoLetterIsoCode == twoLetterIsoCode;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (countryId == null ? 0 : countryId!.hashCode) +
    (name == null ? 0 : name!.hashCode) +
    (numericIsoCode == null ? 0 : numericIsoCode!.hashCode) +
    (phonePrefix == null ? 0 : phonePrefix!.hashCode) +
    (threeLetterIsoCode == null ? 0 : threeLetterIsoCode!.hashCode) +
    (twoLetterIsoCode == null ? 0 : twoLetterIsoCode!.hashCode);

  @override
  String toString() => 'CountryCommand[countryId=$countryId, name=$name, numericIsoCode=$numericIsoCode, phonePrefix=$phonePrefix, threeLetterIsoCode=$threeLetterIsoCode, twoLetterIsoCode=$twoLetterIsoCode]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
    if (countryId != null) {
      _json[r'countryId'] = countryId;
    }
    if (name != null) {
      _json[r'name'] = name;
    }
    if (numericIsoCode != null) {
      _json[r'numericIsoCode'] = numericIsoCode;
    }
    if (phonePrefix != null) {
      _json[r'phonePrefix'] = phonePrefix;
    }
    if (threeLetterIsoCode != null) {
      _json[r'threeLetterIsoCode'] = threeLetterIsoCode;
    }
    if (twoLetterIsoCode != null) {
      _json[r'twoLetterIsoCode'] = twoLetterIsoCode;
    }
    return _json;
  }

  /// Returns a new [CountryCommand] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CountryCommand? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "CountryCommand[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "CountryCommand[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return CountryCommand(
        countryId: mapValueOfType<int>(json, r'countryId'),
        name: mapValueOfType<String>(json, r'name'),
        numericIsoCode: mapValueOfType<int>(json, r'numericIsoCode'),
        phonePrefix: mapValueOfType<String>(json, r'phonePrefix'),
        threeLetterIsoCode: mapValueOfType<String>(json, r'threeLetterIsoCode'),
        twoLetterIsoCode: mapValueOfType<String>(json, r'twoLetterIsoCode'),
      );
    }
    return null;
  }

  static List<CountryCommand>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CountryCommand>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CountryCommand.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CountryCommand> mapFromJson(dynamic json) {
    final map = <String, CountryCommand>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CountryCommand.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CountryCommand-objects as value to a dart map
  static Map<String, List<CountryCommand>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<CountryCommand>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CountryCommand.listFromJson(entry.value, growable: growable,);
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

