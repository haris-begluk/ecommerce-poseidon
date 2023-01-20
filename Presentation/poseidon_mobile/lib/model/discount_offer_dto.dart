//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class DiscountOfferDto {
  /// Returns a new [DiscountOfferDto] instance.
  DiscountOfferDto({
    this.discountOfferId,
    this.description,
    this.discount,
    this.endDate,
    this.imageUrl,
    this.startDate,
    this.sysCreatedAt,
    this.sysCreatedBy,
    this.sysUpdatedAt,
    this.sysUpdatedBy,
    this.title,
  });

  int? discountOfferId;

  String? description;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  num? discount;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? endDate;

  String? imageUrl;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? startDate;

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
  bool operator ==(Object other) => identical(this, other) || other is DiscountOfferDto &&
     other.discountOfferId == discountOfferId &&
     other.description == description &&
     other.discount == discount &&
     other.endDate == endDate &&
     other.imageUrl == imageUrl &&
     other.startDate == startDate &&
     other.sysCreatedAt == sysCreatedAt &&
     other.sysCreatedBy == sysCreatedBy &&
     other.sysUpdatedAt == sysUpdatedAt &&
     other.sysUpdatedBy == sysUpdatedBy &&
     other.title == title;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (discountOfferId == null ? 0 : discountOfferId!.hashCode) +
    (description == null ? 0 : description!.hashCode) +
    (discount == null ? 0 : discount!.hashCode) +
    (endDate == null ? 0 : endDate!.hashCode) +
    (imageUrl == null ? 0 : imageUrl!.hashCode) +
    (startDate == null ? 0 : startDate!.hashCode) +
    (sysCreatedAt == null ? 0 : sysCreatedAt!.hashCode) +
    (sysCreatedBy == null ? 0 : sysCreatedBy!.hashCode) +
    (sysUpdatedAt == null ? 0 : sysUpdatedAt!.hashCode) +
    (sysUpdatedBy == null ? 0 : sysUpdatedBy!.hashCode) +
    (title == null ? 0 : title!.hashCode);

  @override
  String toString() => 'DiscountOfferDto[discountOfferId=$discountOfferId, description=$description, discount=$discount, endDate=$endDate, imageUrl=$imageUrl, startDate=$startDate, sysCreatedAt=$sysCreatedAt, sysCreatedBy=$sysCreatedBy, sysUpdatedAt=$sysUpdatedAt, sysUpdatedBy=$sysUpdatedBy, title=$title]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
    if (discountOfferId != null) {
      _json[r'discountOfferId'] = discountOfferId;
    }
    if (description != null) {
      _json[r'description'] = description;
    }
    if (discount != null) {
      _json[r'discount'] = discount;
    }
    if (endDate != null) {
      _json[r'endDate'] = endDate!.toUtc().toIso8601String();
    }
    if (imageUrl != null) {
      _json[r'imageUrl'] = imageUrl;
    }
    if (startDate != null) {
      _json[r'startDate'] = startDate!.toUtc().toIso8601String();
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

  /// Returns a new [DiscountOfferDto] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static DiscountOfferDto? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "DiscountOfferDto[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "DiscountOfferDto[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return DiscountOfferDto(
        discountOfferId: mapValueOfType<int>(json, r'discountOfferId'),
        description: mapValueOfType<String>(json, r'description'),
        discount: json[r'discount'] == null
            ? null
            : num.parse(json[r'discount'].toString()),
        endDate: mapDateTime(json, r'endDate', ''),
        imageUrl: mapValueOfType<String>(json, r'imageUrl'),
        startDate: mapDateTime(json, r'startDate', ''),
        sysCreatedAt: mapDateTime(json, r'sys_CreatedAt', ''),
        sysCreatedBy: mapValueOfType<String>(json, r'sys_CreatedBy'),
        sysUpdatedAt: mapDateTime(json, r'sys_UpdatedAt', ''),
        sysUpdatedBy: mapValueOfType<String>(json, r'sys_UpdatedBy'),
        title: mapValueOfType<String>(json, r'title'),
      );
    }
    return null;
  }

  static List<DiscountOfferDto>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <DiscountOfferDto>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = DiscountOfferDto.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, DiscountOfferDto> mapFromJson(dynamic json) {
    final map = <String, DiscountOfferDto>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = DiscountOfferDto.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of DiscountOfferDto-objects as value to a dart map
  static Map<String, List<DiscountOfferDto>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<DiscountOfferDto>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = DiscountOfferDto.listFromJson(entry.value, growable: growable,);
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

