//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class UserProductReviewDto {
  /// Returns a new [UserProductReviewDto] instance.
  UserProductReviewDto({
    this.userProductReviewId,
    this.comment,
    this.productId,
    this.rating,
    this.sysCreatedAt,
    this.sysCreatedBy,
    this.sysUpdatedAt,
    this.sysUpdatedBy,
    this.title,
    this.userId,
  });

  int? userProductReviewId;

  String? comment;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? productId;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? rating;

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

  @override
  bool operator ==(Object other) => identical(this, other) || other is UserProductReviewDto &&
     other.userProductReviewId == userProductReviewId &&
     other.comment == comment &&
     other.productId == productId &&
     other.rating == rating &&
     other.sysCreatedAt == sysCreatedAt &&
     other.sysCreatedBy == sysCreatedBy &&
     other.sysUpdatedAt == sysUpdatedAt &&
     other.sysUpdatedBy == sysUpdatedBy &&
     other.title == title &&
     other.userId == userId;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (userProductReviewId == null ? 0 : userProductReviewId!.hashCode) +
    (comment == null ? 0 : comment!.hashCode) +
    (productId == null ? 0 : productId!.hashCode) +
    (rating == null ? 0 : rating!.hashCode) +
    (sysCreatedAt == null ? 0 : sysCreatedAt!.hashCode) +
    (sysCreatedBy == null ? 0 : sysCreatedBy!.hashCode) +
    (sysUpdatedAt == null ? 0 : sysUpdatedAt!.hashCode) +
    (sysUpdatedBy == null ? 0 : sysUpdatedBy!.hashCode) +
    (title == null ? 0 : title!.hashCode) +
    (userId == null ? 0 : userId!.hashCode);

  @override
  String toString() => 'UserProductReviewDto[userProductReviewId=$userProductReviewId, comment=$comment, productId=$productId, rating=$rating, sysCreatedAt=$sysCreatedAt, sysCreatedBy=$sysCreatedBy, sysUpdatedAt=$sysUpdatedAt, sysUpdatedBy=$sysUpdatedBy, title=$title, userId=$userId]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
    if (userProductReviewId != null) {
      _json[r'userProductReviewId'] = userProductReviewId;
    }
    if (comment != null) {
      _json[r'comment'] = comment;
    }
    if (productId != null) {
      _json[r'productId'] = productId;
    }
    if (rating != null) {
      _json[r'rating'] = rating;
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
    return _json;
  }

  /// Returns a new [UserProductReviewDto] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static UserProductReviewDto? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "UserProductReviewDto[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "UserProductReviewDto[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return UserProductReviewDto(
        userProductReviewId: mapValueOfType<int>(json, r'userProductReviewId'),
        comment: mapValueOfType<String>(json, r'comment'),
        productId: mapValueOfType<int>(json, r'productId'),
        rating: mapValueOfType<int>(json, r'rating'),
        sysCreatedAt: mapDateTime(json, r'sys_CreatedAt', ''),
        sysCreatedBy: mapValueOfType<String>(json, r'sys_CreatedBy'),
        sysUpdatedAt: mapDateTime(json, r'sys_UpdatedAt', ''),
        sysUpdatedBy: mapValueOfType<String>(json, r'sys_UpdatedBy'),
        title: mapValueOfType<String>(json, r'title'),
        userId: mapValueOfType<int>(json, r'userId'),
      );
    }
    return null;
  }

  static List<UserProductReviewDto>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <UserProductReviewDto>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = UserProductReviewDto.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, UserProductReviewDto> mapFromJson(dynamic json) {
    final map = <String, UserProductReviewDto>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = UserProductReviewDto.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of UserProductReviewDto-objects as value to a dart map
  static Map<String, List<UserProductReviewDto>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<UserProductReviewDto>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = UserProductReviewDto.listFromJson(entry.value, growable: growable,);
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

