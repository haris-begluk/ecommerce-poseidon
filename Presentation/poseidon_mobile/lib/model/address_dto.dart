//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class AddressDto {
  /// Returns a new [AddressDto] instance.
  AddressDto({
    this.addressId,
    this.address1,
    this.address2,
    this.city,
    this.company,
    this.countryId,
    this.county,
    this.email,
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.sysCreatedAt,
    this.sysCreatedBy,
    this.sysUpdatedAt,
    this.sysUpdatedBy,
    this.zipPostalCode,
  });

  int? addressId;

  String? address1;

  String? address2;

  String? city;

  String? company;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? countryId;

  String? county;

  String? email;

  String? firstName;

  String? lastName;

  String? phoneNumber;

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

  String? zipPostalCode;

  @override
  bool operator ==(Object other) => identical(this, other) || other is AddressDto &&
     other.addressId == addressId &&
     other.address1 == address1 &&
     other.address2 == address2 &&
     other.city == city &&
     other.company == company &&
     other.countryId == countryId &&
     other.county == county &&
     other.email == email &&
     other.firstName == firstName &&
     other.lastName == lastName &&
     other.phoneNumber == phoneNumber &&
     other.sysCreatedAt == sysCreatedAt &&
     other.sysCreatedBy == sysCreatedBy &&
     other.sysUpdatedAt == sysUpdatedAt &&
     other.sysUpdatedBy == sysUpdatedBy &&
     other.zipPostalCode == zipPostalCode;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (addressId == null ? 0 : addressId!.hashCode) +
    (address1 == null ? 0 : address1!.hashCode) +
    (address2 == null ? 0 : address2!.hashCode) +
    (city == null ? 0 : city!.hashCode) +
    (company == null ? 0 : company!.hashCode) +
    (countryId == null ? 0 : countryId!.hashCode) +
    (county == null ? 0 : county!.hashCode) +
    (email == null ? 0 : email!.hashCode) +
    (firstName == null ? 0 : firstName!.hashCode) +
    (lastName == null ? 0 : lastName!.hashCode) +
    (phoneNumber == null ? 0 : phoneNumber!.hashCode) +
    (sysCreatedAt == null ? 0 : sysCreatedAt!.hashCode) +
    (sysCreatedBy == null ? 0 : sysCreatedBy!.hashCode) +
    (sysUpdatedAt == null ? 0 : sysUpdatedAt!.hashCode) +
    (sysUpdatedBy == null ? 0 : sysUpdatedBy!.hashCode) +
    (zipPostalCode == null ? 0 : zipPostalCode!.hashCode);

  @override
  String toString() => 'AddressDto[addressId=$addressId, address1=$address1, address2=$address2, city=$city, company=$company, countryId=$countryId, county=$county, email=$email, firstName=$firstName, lastName=$lastName, phoneNumber=$phoneNumber, sysCreatedAt=$sysCreatedAt, sysCreatedBy=$sysCreatedBy, sysUpdatedAt=$sysUpdatedAt, sysUpdatedBy=$sysUpdatedBy, zipPostalCode=$zipPostalCode]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
    if (addressId != null) {
      _json[r'addressId'] = addressId;
    }
    if (address1 != null) {
      _json[r'address1'] = address1;
    }
    if (address2 != null) {
      _json[r'address2'] = address2;
    }
    if (city != null) {
      _json[r'city'] = city;
    }
    if (company != null) {
      _json[r'company'] = company;
    }
    if (countryId != null) {
      _json[r'countryId'] = countryId;
    }
    if (county != null) {
      _json[r'county'] = county;
    }
    if (email != null) {
      _json[r'email'] = email;
    }
    if (firstName != null) {
      _json[r'firstName'] = firstName;
    }
    if (lastName != null) {
      _json[r'lastName'] = lastName;
    }
    if (phoneNumber != null) {
      _json[r'phoneNumber'] = phoneNumber;
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
    if (zipPostalCode != null) {
      _json[r'zipPostalCode'] = zipPostalCode;
    }
    return _json;
  }

  /// Returns a new [AddressDto] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static AddressDto? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "AddressDto[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "AddressDto[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return AddressDto(
        addressId: mapValueOfType<int>(json, r'addressId'),
        address1: mapValueOfType<String>(json, r'address1'),
        address2: mapValueOfType<String>(json, r'address2'),
        city: mapValueOfType<String>(json, r'city'),
        company: mapValueOfType<String>(json, r'company'),
        countryId: mapValueOfType<int>(json, r'countryId'),
        county: mapValueOfType<String>(json, r'county'),
        email: mapValueOfType<String>(json, r'email'),
        firstName: mapValueOfType<String>(json, r'firstName'),
        lastName: mapValueOfType<String>(json, r'lastName'),
        phoneNumber: mapValueOfType<String>(json, r'phoneNumber'),
        sysCreatedAt: mapDateTime(json, r'sys_CreatedAt', ''),
        sysCreatedBy: mapValueOfType<String>(json, r'sys_CreatedBy'),
        sysUpdatedAt: mapDateTime(json, r'sys_UpdatedAt', ''),
        sysUpdatedBy: mapValueOfType<String>(json, r'sys_UpdatedBy'),
        zipPostalCode: mapValueOfType<String>(json, r'zipPostalCode'),
      );
    }
    return null;
  }

  static List<AddressDto>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <AddressDto>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = AddressDto.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, AddressDto> mapFromJson(dynamic json) {
    final map = <String, AddressDto>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = AddressDto.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of AddressDto-objects as value to a dart map
  static Map<String, List<AddressDto>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<AddressDto>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = AddressDto.listFromJson(entry.value, growable: growable,);
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

