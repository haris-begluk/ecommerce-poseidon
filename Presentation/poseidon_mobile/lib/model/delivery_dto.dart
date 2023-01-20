//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class DeliveryDto {
  /// Returns a new [DeliveryDto] instance.
  DeliveryDto({
    this.deliveryId,
    this.description,
    this.isActive,
    this.sysCreatedAt,
    this.sysCreatedBy,
    this.sysUpdatedAt,
    this.sysUpdatedBy,
    this.title,
  });

  int? deliveryId;

  String? description;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? isActive;

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

  @override
  bool operator ==(Object other) => identical(this, other) || other is DeliveryDto &&
     other.deliveryId == deliveryId &&
     other.description == description &&
     other.isActive == isActive &&
     other.sysCreatedAt == sysCreatedAt &&
     other.sysCreatedBy == sysCreatedBy &&
     other.sysUpdatedAt == sysUpdatedAt &&
     other.sysUpdatedBy == sysUpdatedBy &&
     other.title == title;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (deliveryId == null ? 0 : deliveryId!.hashCode) +
    (description == null ? 0 : description!.hashCode) +
    (isActive == null ? 0 : isActive!.hashCode) +
    (sysCreatedAt == null ? 0 : sysCreatedAt!.hashCode) +
    (sysCreatedBy == null ? 0 : sysCreatedBy!.hashCode) +
    (sysUpdatedAt == null ? 0 : sysUpdatedAt!.hashCode) +
    (sysUpdatedBy == null ? 0 : sysUpdatedBy!.hashCode) +
    (title == null ? 0 : title!.hashCode);

  @override
  String toString() => 'DeliveryDto[deliveryId=$deliveryId, description=$description, isActive=$isActive, sysCreatedAt=$sysCreatedAt, sysCreatedBy=$sysCreatedBy, sysUpdatedAt=$sysUpdatedAt, sysUpdatedBy=$sysUpdatedBy, title=$title]';

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
    return _json;
  }

  /// Returns a new [DeliveryDto] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static DeliveryDto? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "DeliveryDto[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "DeliveryDto[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return DeliveryDto(
        deliveryId: mapValueOfType<int>(json, r'deliveryId'),
        description: mapValueOfType<String>(json, r'description'),
        isActive: mapValueOfType<bool>(json, r'isActive'),
        sysCreatedAt: mapDateTime(json, r'sys_CreatedAt', ''),
        sysCreatedBy: mapValueOfType<String>(json, r'sys_CreatedBy'),
        sysUpdatedAt: mapDateTime(json, r'sys_UpdatedAt', ''),
        sysUpdatedBy: mapValueOfType<String>(json, r'sys_UpdatedBy'),
        title: mapValueOfType<String>(json, r'title'),
      );
    }
    return null;
  }

  static List<DeliveryDto>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <DeliveryDto>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = DeliveryDto.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, DeliveryDto> mapFromJson(dynamic json) {
    final map = <String, DeliveryDto>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = DeliveryDto.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of DeliveryDto-objects as value to a dart map
  static Map<String, List<DeliveryDto>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<DeliveryDto>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = DeliveryDto.listFromJson(entry.value, growable: growable,);
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

