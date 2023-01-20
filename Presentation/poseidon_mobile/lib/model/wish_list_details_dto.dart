//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class WishListDetailsDto {
  /// Returns a new [WishListDetailsDto] instance.
  WishListDetailsDto({
    this.wishListId,
    this.description,
    this.sysCreatedAt,
    this.sysCreatedBy,
    this.sysUpdatedAt,
    this.sysUpdatedBy,
    this.title,
    this.userId,
    this.wishListItem = const [],
  });

  int? wishListId;

  String? description;

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

  String? title;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? userId;

  List<WishListItemDetailsDto>? wishListItem;

  @override
  bool operator ==(Object other) => identical(this, other) || other is WishListDetailsDto &&
     other.wishListId == wishListId &&
     other.description == description &&
     other.sysCreatedAt == sysCreatedAt &&
     other.sysCreatedBy == sysCreatedBy &&
     other.sysUpdatedAt == sysUpdatedAt &&
     other.sysUpdatedBy == sysUpdatedBy &&
     other.title == title &&
     other.userId == userId &&
     other.wishListItem == wishListItem;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (wishListId == null ? 0 : wishListId!.hashCode) +
    (description == null ? 0 : description!.hashCode) +
    (sysCreatedAt == null ? 0 : sysCreatedAt!.hashCode) +
    (sysCreatedBy == null ? 0 : sysCreatedBy!.hashCode) +
    (sysUpdatedAt == null ? 0 : sysUpdatedAt!.hashCode) +
    (sysUpdatedBy == null ? 0 : sysUpdatedBy!.hashCode) +
    (title == null ? 0 : title!.hashCode) +
    (userId == null ? 0 : userId!.hashCode) +
    (wishListItem == null ? 0 : wishListItem!.hashCode);

  @override
  String toString() => 'WishListDetailsDto[wishListId=$wishListId, description=$description, sysCreatedAt=$sysCreatedAt, sysCreatedBy=$sysCreatedBy, sysUpdatedAt=$sysUpdatedAt, sysUpdatedBy=$sysUpdatedBy, title=$title, userId=$userId, wishListItem=$wishListItem]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
    if (wishListId != null) {
      _json[r'wishListId'] = wishListId;
    }
    if (description != null) {
      _json[r'description'] = description;
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
    if (title != null) {
      _json[r'title'] = title;
    }
    if (userId != null) {
      _json[r'userId'] = userId;
    }
    if (wishListItem != null) {
      _json[r'wishListItem'] = wishListItem;
    }
    return _json;
  }

  /// Returns a new [WishListDetailsDto] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static WishListDetailsDto? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "WishListDetailsDto[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "WishListDetailsDto[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return WishListDetailsDto(
        wishListId: mapValueOfType<int>(json, r'wishListId'),
        description: mapValueOfType<String>(json, r'description'),
        sysCreatedAt: mapDateTime(json, r'sys_CreatedAt', ''),
        sysCreatedBy: mapValueOfType<String>(json, r'sys_CreatedBy'),
        sysUpdatedAt: mapDateTime(json, r'sys_UpdatedAt', ''),
        sysUpdatedBy: mapValueOfType<String>(json, r'sys_UpdatedBy'),
        title: mapValueOfType<String>(json, r'title'),
        userId: mapValueOfType<int>(json, r'userId'),
        wishListItem: WishListItemDetailsDto.listFromJson(json[r'wishListItem']) ?? const [],
      );
    }
    return null;
  }

  static List<WishListDetailsDto>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <WishListDetailsDto>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = WishListDetailsDto.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, WishListDetailsDto> mapFromJson(dynamic json) {
    final map = <String, WishListDetailsDto>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = WishListDetailsDto.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of WishListDetailsDto-objects as value to a dart map
  static Map<String, List<WishListDetailsDto>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<WishListDetailsDto>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = WishListDetailsDto.listFromJson(entry.value, growable: growable,);
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

