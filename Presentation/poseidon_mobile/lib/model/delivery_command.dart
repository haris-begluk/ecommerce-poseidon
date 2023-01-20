//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class DeliveryCommand {
  /// Returns a new [DeliveryCommand] instance.
  DeliveryCommand({
    this.deliveryId,
    this.description,
    this.isActive,
    this.title,
  });

  int? deliveryId;

  String? description;

  bool? isActive;

  String? title;

  @override
  bool operator ==(Object other) => identical(this, other) || other is DeliveryCommand &&
     other.deliveryId == deliveryId &&
     other.description == description &&
     other.isActive == isActive &&
     other.title == title;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (deliveryId == null ? 0 : deliveryId!.hashCode) +
    (description == null ? 0 : description!.hashCode) +
    (isActive == null ? 0 : isActive!.hashCode) +
    (title == null ? 0 : title!.hashCode);

  @override
  String toString() => 'DeliveryCommand[deliveryId=$deliveryId, description=$description, isActive=$isActive, title=$title]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
    if (deliveryId != null) {
      _json[r'deliveryId'] = deliveryId;
    }
    if (description != null) {
      _json[r'description'] = description;
    }
    if (isActive != null) {
      _json[r'isActive'] = isActive;
    }
    if (title != null) {
      _json[r'title'] = title;
    }
    return _json;
  }

  /// Returns a new [DeliveryCommand] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static DeliveryCommand? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "DeliveryCommand[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "DeliveryCommand[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return DeliveryCommand(
        deliveryId: mapValueOfType<int>(json, r'deliveryId'),
        description: mapValueOfType<String>(json, r'description'),
        isActive: mapValueOfType<bool>(json, r'isActive'),
        title: mapValueOfType<String>(json, r'title'),
      );
    }
    return null;
  }

  static List<DeliveryCommand>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <DeliveryCommand>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = DeliveryCommand.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, DeliveryCommand> mapFromJson(dynamic json) {
    final map = <String, DeliveryCommand>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = DeliveryCommand.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of DeliveryCommand-objects as value to a dart map
  static Map<String, List<DeliveryCommand>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<DeliveryCommand>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = DeliveryCommand.listFromJson(entry.value, growable: growable,);
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

