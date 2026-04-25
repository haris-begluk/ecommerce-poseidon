//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class UserCommand {
  /// Returns a new [UserCommand] instance.
  UserCommand({
    this.userId,
    this.externalRef,
    this.username,
    this.firstName,
    this.phoneNumber,
    this.lastName,
    this.email,
    this.imageUrl,
    this.addressId,
  });

  int? userId;

  String? externalRef;

  String? username;

  String? firstName;

  String? phoneNumber;

  String? lastName;

  String? email;

  String? imageUrl;

  int? addressId;

  @override
  bool operator ==(Object other) => identical(this, other) || other is UserCommand &&
     other.userId == userId &&
     other.externalRef == externalRef &&
     other.username == username &&
     other.firstName == firstName &&
     other.phoneNumber == phoneNumber &&
     other.lastName == lastName &&
     other.email == email &&
     other.imageUrl == imageUrl &&
     other.addressId == addressId;

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
    (addressId == null ? 0 : addressId!.hashCode);

  @override
  String toString() => 'UserCommand[userId=$userId, externalRef=$externalRef, username=$username, firstName=$firstName, phoneNumber=$phoneNumber, lastName=$lastName, email=$email, imageUrl=$imageUrl, addressId=$addressId]';

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
    return _json;
  }

  /// Returns a new [UserCommand] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static UserCommand? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "UserCommand[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "UserCommand[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return UserCommand(
        userId: mapValueOfType<int>(json, r'userId'),
        externalRef: mapValueOfType<String>(json, r'externalRef'),
        username: mapValueOfType<String>(json, r'username'),
        firstName: mapValueOfType<String>(json, r'firstName'),
        phoneNumber: mapValueOfType<String>(json, r'phoneNumber'),
        lastName: mapValueOfType<String>(json, r'lastName'),
        email: mapValueOfType<String>(json, r'email'),
        imageUrl: mapValueOfType<String>(json, r'imageUrl'),
        addressId: mapValueOfType<int>(json, r'addressId'),
      );
    }
    return null;
  }

  static List<UserCommand>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <UserCommand>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = UserCommand.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, UserCommand> mapFromJson(dynamic json) {
    final map = <String, UserCommand>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = UserCommand.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of UserCommand-objects as value to a dart map
  static Map<String, List<UserCommand>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<UserCommand>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = UserCommand.listFromJson(entry.value, growable: growable,);
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

