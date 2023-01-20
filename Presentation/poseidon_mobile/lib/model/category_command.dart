//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CategoryCommand {
  /// Returns a new [CategoryCommand] instance.
  CategoryCommand({
    this.categoryId,
    this.name,
  });

  int? categoryId;

  String? name;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CategoryCommand &&
     other.categoryId == categoryId &&
     other.name == name;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (categoryId == null ? 0 : categoryId!.hashCode) +
    (name == null ? 0 : name!.hashCode);

  @override
  String toString() => 'CategoryCommand[categoryId=$categoryId, name=$name]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
    if (categoryId != null) {
      _json[r'categoryId'] = categoryId;
    }
    if (name != null) {
      _json[r'name'] = name;
    }
    return _json;
  }

  /// Returns a new [CategoryCommand] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CategoryCommand? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "CategoryCommand[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "CategoryCommand[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return CategoryCommand(
        categoryId: mapValueOfType<int>(json, r'categoryId'),
        name: mapValueOfType<String>(json, r'name'),
      );
    }
    return null;
  }

  static List<CategoryCommand>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CategoryCommand>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CategoryCommand.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CategoryCommand> mapFromJson(dynamic json) {
    final map = <String, CategoryCommand>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CategoryCommand.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CategoryCommand-objects as value to a dart map
  static Map<String, List<CategoryCommand>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<CategoryCommand>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CategoryCommand.listFromJson(entry.value, growable: growable,);
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

