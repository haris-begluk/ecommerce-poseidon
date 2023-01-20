//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CountryDto {
  /// Returns a new [CountryDto] instance.
  CountryDto({
    this.countryId,
    this.name,
    this.numericIsoCode,
    this.phonePrefix,
    this.sysCreatedAt,
    this.sysCreatedBy,
    this.sysUpdatedAt,
    this.sysUpdatedBy,
    this.threeLetterIsoCode,
    this.twoLetterIsoCode,
  });

  int? countryId;

  String? name;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? numericIsoCode;

  String? phonePrefix;

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

  String? threeLetterIsoCode;

  String? twoLetterIsoCode;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CountryDto &&
     other.countryId == countryId &&
     other.name == name &&
     other.numericIsoCode == numericIsoCode &&
     other.phonePrefix == phonePrefix &&
     other.sysCreatedAt == sysCreatedAt &&
     other.sysCreatedBy == sysCreatedBy &&
     other.sysUpdatedAt == sysUpdatedAt &&
     other.sysUpdatedBy == sysUpdatedBy &&
     other.threeLetterIsoCode == threeLetterIsoCode &&
     other.twoLetterIsoCode == twoLetterIsoCode;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (countryId == null ? 0 : countryId!.hashCode) +
    (name == null ? 0 : name!.hashCode) +
    (numericIsoCode == null ? 0 : numericIsoCode!.hashCode) +
    (phonePrefix == null ? 0 : phonePrefix!.hashCode) +
    (sysCreatedAt == null ? 0 : sysCreatedAt!.hashCode) +
    (sysCreatedBy == null ? 0 : sysCreatedBy!.hashCode) +
    (sysUpdatedAt == null ? 0 : sysUpdatedAt!.hashCode) +
    (sysUpdatedBy == null ? 0 : sysUpdatedBy!.hashCode) +
    (threeLetterIsoCode == null ? 0 : threeLetterIsoCode!.hashCode) +
    (twoLetterIsoCode == null ? 0 : twoLetterIsoCode!.hashCode);

  @override
  String toString() => 'CountryDto[countryId=$countryId, name=$name, numericIsoCode=$numericIsoCode, phonePrefix=$phonePrefix, sysCreatedAt=$sysCreatedAt, sysCreatedBy=$sysCreatedBy, sysUpdatedAt=$sysUpdatedAt, sysUpdatedBy=$sysUpdatedBy, threeLetterIsoCode=$threeLetterIsoCode, twoLetterIsoCode=$twoLetterIsoCode]';

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
    if (threeLetterIsoCode != null) {
      _json[r'threeLetterIsoCode'] = threeLetterIsoCode;
    }
    if (twoLetterIsoCode != null) {
      _json[r'twoLetterIsoCode'] = twoLetterIsoCode;
    }
    return _json;
  }

  /// Returns a new [CountryDto] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CountryDto? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "CountryDto[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "CountryDto[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return CountryDto(
        countryId: mapValueOfType<int>(json, r'countryId'),
        name: mapValueOfType<String>(json, r'name'),
        numericIsoCode: mapValueOfType<int>(json, r'numericIsoCode'),
        phonePrefix: mapValueOfType<String>(json, r'phonePrefix'),
        sysCreatedAt: mapDateTime(json, r'sys_CreatedAt', ''),
        sysCreatedBy: mapValueOfType<String>(json, r'sys_CreatedBy'),
        sysUpdatedAt: mapDateTime(json, r'sys_UpdatedAt', ''),
        sysUpdatedBy: mapValueOfType<String>(json, r'sys_UpdatedBy'),
        threeLetterIsoCode: mapValueOfType<String>(json, r'threeLetterIsoCode'),
        twoLetterIsoCode: mapValueOfType<String>(json, r'twoLetterIsoCode'),
      );
    }
    return null;
  }

  static List<CountryDto>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CountryDto>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CountryDto.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CountryDto> mapFromJson(dynamic json) {
    final map = <String, CountryDto>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CountryDto.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CountryDto-objects as value to a dart map
  static Map<String, List<CountryDto>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<CountryDto>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CountryDto.listFromJson(entry.value, growable: growable,);
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

