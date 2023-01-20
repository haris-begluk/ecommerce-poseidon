//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class WishListCommand {
  /// Returns a new [WishListCommand] instance.
  WishListCommand({
    this.wishListId,
    this.description,
    this.title,
    this.userId,
  });

  int? wishListId;

  String? description;

  String? title;

  int? userId;

  @override
  bool operator ==(Object other) => identical(this, other) || other is WishListCommand &&
     other.wishListId == wishListId &&
     other.description == description &&
     other.title == title &&
     other.userId == userId;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (wishListId == null ? 0 : wishListId!.hashCode) +
    (description == null ? 0 : description!.hashCode) +
    (title == null ? 0 : title!.hashCode) +
    (userId == null ? 0 : userId!.hashCode);

  @override
  String toString() => 'WishListCommand[wishListId=$wishListId, description=$description, title=$title, userId=$userId]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
    if (wishListId != null) {
      _json[r'wishListId'] = wishListId;
    }
    if (description != null) {
      _json[r'description'] = description;
    }
    if (title != null) {
      _json[r'title'] = title;
    }
    if (userId != null) {
      _json[r'userId'] = userId;
    }
    return _json;
  }

  /// Returns a new [WishListCommand] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static WishListCommand? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "WishListCommand[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "WishListCommand[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return WishListCommand(
        wishListId: mapValueOfType<int>(json, r'wishListId'),
        description: mapValueOfType<String>(json, r'description'),
        title: mapValueOfType<String>(json, r'title'),
        userId: mapValueOfType<int>(json, r'userId'),
      );
    }
    return null;
  }

  static List<WishListCommand>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <WishListCommand>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = WishListCommand.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, WishListCommand> mapFromJson(dynamic json) {
    final map = <String, WishListCommand>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = WishListCommand.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of WishListCommand-objects as value to a dart map
  static Map<String, List<WishListCommand>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<WishListCommand>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = WishListCommand.listFromJson(entry.value, growable: growable,);
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

