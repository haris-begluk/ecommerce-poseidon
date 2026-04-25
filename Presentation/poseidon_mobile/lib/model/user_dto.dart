//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class UserDto {
  /// Returns a new [UserDto] instance.
  UserDto({
    this.userId,
    this.externalRef,
    this.username,
    this.firstName,
    this.phoneNumber,
    this.lastName,
    this.email,
    this.imageUrl,
    this.addressId,
    this.sysCreatedBy,
    this.sysCreatedAt,
    this.sysUpdatedBy,
    this.sysUpdatedAt,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? userId;

  String? externalRef;

  String? username;

  String? firstName;

  String? phoneNumber;

  String? lastName;

  String? email;

  String? imageUrl;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? addressId;

  String? sysCreatedBy;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? sysCreatedAt;

  String? sysUpdatedBy;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? sysUpdatedAt;

  @override
  bool operator ==(Object other) => identical(this, other) || other is UserDto &&
     other.userId == userId &&
     other.externalRef == externalRef &&
     other.username == username &&
     other.firstName == firstName &&
     other.phoneNumber == phoneNumber &&
     other.lastName == lastName &&
     other.email == email &&
     other.imageUrl == imageUrl &&
     other.addressId == addressId &&
     other.sysCreatedBy == sysCreatedBy &&
     other.sysCreatedAt == sysCreatedAt &&
     other.sysUpdatedBy == sysUpdatedBy &&
     other.sysUpdatedAt == sysUpdatedAt;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (userId == null ? 0 : userId!.hashCode) +
    (externalRef == null ? 0 : externalRef!.hashCode) +
    (username == null ? 0 : username!.hashCode) +
    (firstName == null ? 0 : firstName!.hashCode) +
    (phoneNumber == null ? 0 : phoneNumber!.hashCode) +
    (lastName == null ? 0 : lastName!.hashCode) +
    (email == null ? 0 : email!.hashCode) +
    (imageUrl == null ? 0 : imageUrl!.hashCode) +
    (addressId == null ? 0 : addressId!.hashCode) +
    (sysCreatedBy == null ? 0 : sysCreatedBy!.hashCode) +
    (sysCreatedAt == null ? 0 : sysCreatedAt!.hashCode) +
    (sysUpdatedBy == null ? 0 : sysUpdatedBy!.hashCode) +
    (sysUpdatedAt == null ? 0 : sysUpdatedAt!.hashCode);

  @override
  String toString() => 'UserDto[userId=$userId, externalRef=$externalRef, username=$username, firstName=$firstName, phoneNumber=$phoneNumber, lastName=$lastName, email=$email, imageUrl=$imageUrl, addressId=$addressId, sysCreatedBy=$sysCreatedBy, sysCreatedAt=$sysCreatedAt, sysUpdatedBy=$sysUpdatedBy, sysUpdatedAt=$sysUpdatedAt]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
    if (userId != null) {
      _json[r'userId'] = userId;
    }
    if (externalRef != null) {
      _json[r'externalRef'] = externalRef;
    }
    if (username != null) {
      _json[r'username'] = username;
    }
    if (firstName != null) {
      _json[r'firstName'] = firstName;
    }
    if (phoneNumber != null) {
      _json[r'phoneNumber'] = phoneNumber;
    }
    if (lastName != null) {
      _json[r'lastName'] = lastName;
    }
    if (email != null) {
      _json[r'email'] = email;
    }
    if (imageUrl != null) {
      _json[r'imageUrl'] = imageUrl;
    }
    if (addressId != null) {
      _json[r'addressId'] = addressId;
    }
    if (sysCreatedBy != null) {
      _json[r'sys_CreatedBy'] = sysCreatedBy;
    }
    if (sysCreatedAt != null) {
      _json[r'sys_CreatedAt'] = sysCreatedAt!.toUtc().toIso8601String();
    }
    if (sysUpdatedBy != null) {
      _json[r'sys_UpdatedBy'] = sysUpdatedBy;
    }
    if (sysUpdatedAt != null) {
      _json[r'sys_UpdatedAt'] = sysUpdatedAt!.toUtc().toIso8601String();
    }
    return _json;
  }

  /// Returns a new [UserDto] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static UserDto? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "UserDto[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "UserDto[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return UserDto(
        userId: mapValueOfType<int>(json, r'userId'),
        externalRef: mapValueOfType<String>(json, r'externalRef'),
        username: mapValueOfType<String>(json, r'username'),
        firstName: mapValueOfType<String>(json, r'firstName'),
        phoneNumber: mapValueOfType<String>(json, r'phoneNumber'),
        lastName: mapValueOfType<String>(json, r'lastName'),
        email: mapValueOfType<String>(json, r'email'),
        imageUrl: mapValueOfType<String>(json, r'imageUrl'),
        addressId: mapValueOfType<int>(json, r'addressId'),
        sysCreatedBy: mapValueOfType<String>(json, r'sys_CreatedBy'),
        sysCreatedAt: mapDateTime(json, r'sys_CreatedAt', ''),
        sysUpdatedBy: mapValueOfType<String>(json, r'sys_UpdatedBy'),
        sysUpdatedAt: mapDateTime(json, r'sys_UpdatedAt', ''),
      );
    }
    return null;
  }

  static List<UserDto>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <UserDto>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = UserDto.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, UserDto> mapFromJson(dynamic json) {
    final map = <String, UserDto>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = UserDto.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of UserDto-objects as value to a dart map
  static Map<String, List<UserDto>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<UserDto>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = UserDto.listFromJson(entry.value, growable: growable,);
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

