//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class UserDetailsDto {
  /// Returns a new [UserDetailsDto] instance.
  UserDetailsDto({
    this.userId,
    this.addressId,
    this.email,
    this.externalRef,
    this.firstName,
    this.imageUrl,
    this.lastName,
    this.phoneNumber,
    this.sysCreatedAt,
    this.sysCreatedBy,
    this.sysUpdatedAt,
    this.sysUpdatedBy,
    this.username,
    this.address,
  });

  int? userId;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? addressId;

  String? email;

  String? externalRef;

  String? firstName;

  String? imageUrl;

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

  String? username;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  AddressDto? address;

  @override
  bool operator ==(Object other) => identical(this, other) || other is UserDetailsDto &&
     other.userId == userId &&
     other.addressId == addressId &&
     other.email == email &&
     other.externalRef == externalRef &&
     other.firstName == firstName &&
     other.imageUrl == imageUrl &&
     other.lastName == lastName &&
     other.phoneNumber == phoneNumber &&
     other.sysCreatedAt == sysCreatedAt &&
     other.sysCreatedBy == sysCreatedBy &&
     other.sysUpdatedAt == sysUpdatedAt &&
     other.sysUpdatedBy == sysUpdatedBy &&
     other.username == username &&
     other.address == address;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (userId == null ? 0 : userId!.hashCode) +
    (addressId == null ? 0 : addressId!.hashCode) +
    (email == null ? 0 : email!.hashCode) +
    (externalRef == null ? 0 : externalRef!.hashCode) +
    (firstName == null ? 0 : firstName!.hashCode) +
    (imageUrl == null ? 0 : imageUrl!.hashCode) +
    (lastName == null ? 0 : lastName!.hashCode) +
    (phoneNumber == null ? 0 : phoneNumber!.hashCode) +
    (sysCreatedAt == null ? 0 : sysCreatedAt!.hashCode) +
    (sysCreatedBy == null ? 0 : sysCreatedBy!.hashCode) +
    (sysUpdatedAt == null ? 0 : sysUpdatedAt!.hashCode) +
    (sysUpdatedBy == null ? 0 : sysUpdatedBy!.hashCode) +
    (username == null ? 0 : username!.hashCode) +
    (address == null ? 0 : address!.hashCode);

  @override
  String toString() => 'UserDetailsDto[userId=$userId, addressId=$addressId, email=$email, externalRef=$externalRef, firstName=$firstName, imageUrl=$imageUrl, lastName=$lastName, phoneNumber=$phoneNumber, sysCreatedAt=$sysCreatedAt, sysCreatedBy=$sysCreatedBy, sysUpdatedAt=$sysUpdatedAt, sysUpdatedBy=$sysUpdatedBy, username=$username, address=$address]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
    if (userId != null) {
      _json[r'userId'] = userId;
    }
    if (addressId != null) {
      _json[r'addressId'] = addressId;
    }
    if (email != null) {
      _json[r'email'] = email;
    }
    if (externalRef != null) {
      _json[r'externalRef'] = externalRef;
    }
    if (firstName != null) {
      _json[r'firstName'] = firstName;
    }
    if (imageUrl != null) {
      _json[r'imageUrl'] = imageUrl;
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
    if (username != null) {
      _json[r'username'] = username;
    }
    if (address != null) {
      _json[r'address'] = address;
    }
    return _json;
  }

  /// Returns a new [UserDetailsDto] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static UserDetailsDto? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "UserDetailsDto[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "UserDetailsDto[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return UserDetailsDto(
        userId: mapValueOfType<int>(json, r'userId'),
        addressId: mapValueOfType<int>(json, r'addressId'),
        email: mapValueOfType<String>(json, r'email'),
        externalRef: mapValueOfType<String>(json, r'externalRef'),
        firstName: mapValueOfType<String>(json, r'firstName'),
        imageUrl: mapValueOfType<String>(json, r'imageUrl'),
        lastName: mapValueOfType<String>(json, r'lastName'),
        phoneNumber: mapValueOfType<String>(json, r'phoneNumber'),
        sysCreatedAt: mapDateTime(json, r'sys_CreatedAt', ''),
        sysCreatedBy: mapValueOfType<String>(json, r'sys_CreatedBy'),
        sysUpdatedAt: mapDateTime(json, r'sys_UpdatedAt', ''),
        sysUpdatedBy: mapValueOfType<String>(json, r'sys_UpdatedBy'),
        username: mapValueOfType<String>(json, r'username'),
        address: AddressDto.fromJson(json[r'address']),
      );
    }
    return null;
  }

  static List<UserDetailsDto>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <UserDetailsDto>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = UserDetailsDto.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, UserDetailsDto> mapFromJson(dynamic json) {
    final map = <String, UserDetailsDto>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = UserDetailsDto.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of UserDetailsDto-objects as value to a dart map
  static Map<String, List<UserDetailsDto>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<UserDetailsDto>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = UserDetailsDto.listFromJson(entry.value, growable: growable,);
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

