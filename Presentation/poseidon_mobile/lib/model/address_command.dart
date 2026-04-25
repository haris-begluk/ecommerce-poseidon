//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class AddressCommand {
  /// Returns a new [AddressCommand] instance.
  AddressCommand({
    this.addressId,
    this.firstName,
    this.lastName,
    this.email,
    this.company,
    this.county,
    this.city,
    this.address1,
    this.address2,
    this.zipPostalCode,
    this.phoneNumber,
    this.countryId,
  });

  int? addressId;

  String? firstName;

  String? lastName;

  String? email;

  String? company;

  String? county;

  String? city;

  String? address1;

  String? address2;

  String? zipPostalCode;

  String? phoneNumber;

  int? countryId;

  @override
  bool operator ==(Object other) => identical(this, other) || other is AddressCommand &&
     other.addressId == addressId &&
     other.firstName == firstName &&
     other.lastName == lastName &&
     other.email == email &&
     other.company == company &&
     other.county == county &&
     other.city == city &&
     other.address1 == address1 &&
     other.address2 == address2 &&
     other.zipPostalCode == zipPostalCode &&
     other.phoneNumber == phoneNumber &&
     other.countryId == countryId;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (addressId == null ? 0 : addressId!.hashCode) +
    (firstName == null ? 0 : firstName!.hashCode) +
    (lastName == null ? 0 : lastName!.hashCode) +
    (email == null ? 0 : email!.hashCode) +
    (company == null ? 0 : company!.hashCode) +
    (county == null ? 0 : county!.hashCode) +
    (city == null ? 0 : city!.hashCode) +
    (address1 == null ? 0 : address1!.hashCode) +
    (address2 == null ? 0 : address2!.hashCode) +
    (zipPostalCode == null ? 0 : zipPostalCode!.hashCode) +
    (phoneNumber == null ? 0 : phoneNumber!.hashCode) +
    (countryId == null ? 0 : countryId!.hashCode);

  @override
  String toString() => 'AddressCommand[addressId=$addressId, firstName=$firstName, lastName=$lastName, email=$email, company=$company, county=$county, city=$city, address1=$address1, address2=$address2, zipPostalCode=$zipPostalCode, phoneNumber=$phoneNumber, countryId=$countryId]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
    if (addressId != null) {
      _json[r'addressId'] = addressId;
    }
    if (firstName != null) {
      _json[r'firstName'] = firstName;
    }
    if (lastName != null) {
      _json[r'lastName'] = lastName;
    }
    if (email != null) {
      _json[r'email'] = email;
    }
    if (company != null) {
      _json[r'company'] = company;
    }
    if (county != null) {
      _json[r'county'] = county;
    }
    if (city != null) {
      _json[r'city'] = city;
    }
    if (address1 != null) {
      _json[r'address1'] = address1;
    }
    if (address2 != null) {
      _json[r'address2'] = address2;
    }
    if (zipPostalCode != null) {
      _json[r'zipPostalCode'] = zipPostalCode;
    }
    if (phoneNumber != null) {
      _json[r'phoneNumber'] = phoneNumber;
    }
    if (countryId != null) {
      _json[r'countryId'] = countryId;
    }
    return _json;
  }

  /// Returns a new [AddressCommand] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static AddressCommand? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "AddressCommand[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "AddressCommand[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return AddressCommand(
        addressId: mapValueOfType<int>(json, r'addressId'),
        firstName: mapValueOfType<String>(json, r'firstName'),
        lastName: mapValueOfType<String>(json, r'lastName'),
        email: mapValueOfType<String>(json, r'email'),
        company: mapValueOfType<String>(json, r'company'),
        county: mapValueOfType<String>(json, r'county'),
        city: mapValueOfType<String>(json, r'city'),
        address1: mapValueOfType<String>(json, r'address1'),
        address2: mapValueOfType<String>(json, r'address2'),
        zipPostalCode: mapValueOfType<String>(json, r'zipPostalCode'),
        phoneNumber: mapValueOfType<String>(json, r'phoneNumber'),
        countryId: mapValueOfType<int>(json, r'countryId'),
      );
    }
    return null;
  }

  static List<AddressCommand>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <AddressCommand>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = AddressCommand.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, AddressCommand> mapFromJson(dynamic json) {
    final map = <String, AddressCommand>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = AddressCommand.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of AddressCommand-objects as value to a dart map
  static Map<String, List<AddressCommand>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<AddressCommand>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = AddressCommand.listFromJson(entry.value, growable: growable,);
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

