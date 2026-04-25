//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class UserProductReviewCommand {
  /// Returns a new [UserProductReviewCommand] instance.
  UserProductReviewCommand({
    this.userProductReviewId,
    this.userId,
    this.productId,
    this.title,
    this.comment,
    this.rating,
  });

  int? userProductReviewId;

  int? userId;

  int? productId;

  String? title;

  String? comment;

  int? rating;

  @override
  bool operator ==(Object other) => identical(this, other) || other is UserProductReviewCommand &&
     other.userProductReviewId == userProductReviewId &&
     other.userId == userId &&
     other.productId == productId &&
     other.title == title &&
     other.comment == comment &&
     other.rating == rating;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (userProductReviewId == null ? 0 : userProductReviewId!.hashCode) +
    (userId == null ? 0 : userId!.hashCode) +
    (productId == null ? 0 : productId!.hashCode) +
    (title == null ? 0 : title!.hashCode) +
    (comment == null ? 0 : comment!.hashCode) +
    (rating == null ? 0 : rating!.hashCode);

  @override
  String toString() => 'UserProductReviewCommand[userProductReviewId=$userProductReviewId, userId=$userId, productId=$productId, title=$title, comment=$comment, rating=$rating]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
    if (userProductReviewId != null) {
      _json[r'userProductReviewId'] = userProductReviewId;
    }
    if (userId != null) {
      _json[r'userId'] = userId;
    }
    if (productId != null) {
      _json[r'productId'] = productId;
    }
    if (title != null) {
      _json[r'title'] = title;
    }
    if (comment != null) {
      _json[r'comment'] = comment;
    }
    if (rating != null) {
      _json[r'rating'] = rating;
    }
    return _json;
  }

  /// Returns a new [UserProductReviewCommand] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static UserProductReviewCommand? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "UserProductReviewCommand[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "UserProductReviewCommand[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return UserProductReviewCommand(
        userProductReviewId: mapValueOfType<int>(json, r'userProductReviewId'),
        userId: mapValueOfType<int>(json, r'userId'),
        productId: mapValueOfType<int>(json, r'productId'),
        title: mapValueOfType<String>(json, r'title'),
        comment: mapValueOfType<String>(json, r'comment'),
        rating: mapValueOfType<int>(json, r'rating'),
      );
    }
    return null;
  }

  static List<UserProductReviewCommand>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <UserProductReviewCommand>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = UserProductReviewCommand.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, UserProductReviewCommand> mapFromJson(dynamic json) {
    final map = <String, UserProductReviewCommand>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = UserProductReviewCommand.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of UserProductReviewCommand-objects as value to a dart map
  static Map<String, List<UserProductReviewCommand>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<UserProductReviewCommand>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = UserProductReviewCommand.listFromJson(entry.value, growable: growable,);
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

