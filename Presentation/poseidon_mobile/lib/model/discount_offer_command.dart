//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class DiscountOfferCommand {
  /// Returns a new [DiscountOfferCommand] instance.
  DiscountOfferCommand({
    this.discountOfferId,
    this.description,
    this.discount,
    this.endDate,
    this.imageUrl,
    this.startDate,
    this.title,
  });

  int? discountOfferId;

  String? description;

  num? discount;

  DateTime? endDate;

  String? imageUrl;

  DateTime? startDate;

  String? title;

  @override
  bool operator ==(Object other) => identical(this, other) || other is DiscountOfferCommand &&
     other.discountOfferId == discountOfferId &&
     other.description == description &&
     other.discount == discount &&
     other.endDate == endDate &&
     other.imageUrl == imageUrl &&
     other.startDate == startDate &&
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
    (title == null ? 0 : title!.hashCode);

  @override
  String toString() => 'DiscountOfferCommand[discountOfferId=$discountOfferId, description=$description, discount=$discount, endDate=$endDate, imageUrl=$imageUrl, startDate=$startDate, title=$title]';

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
    if (title != null) {
      _json[r'title'] = title;
    }
    return _json;
  }

  /// Returns a new [DiscountOfferCommand] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static DiscountOfferCommand? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "DiscountOfferCommand[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "DiscountOfferCommand[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return DiscountOfferCommand(
        discountOfferId: mapValueOfType<int>(json, r'discountOfferId'),
        description: mapValueOfType<String>(json, r'description'),
        discount: json[r'discount'] == null
            ? null
            : num.parse(json[r'discount'].toString()),
        endDate: mapDateTime(json, r'endDate', ''),
        imageUrl: mapValueOfType<String>(json, r'imageUrl'),
        startDate: mapDateTime(json, r'startDate', ''),
        title: mapValueOfType<String>(json, r'title'),
      );
    }
    return null;
  }

  static List<DiscountOfferCommand>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <DiscountOfferCommand>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = DiscountOfferCommand.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, DiscountOfferCommand> mapFromJson(dynamic json) {
    final map = <String, DiscountOfferCommand>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = DiscountOfferCommand.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of DiscountOfferCommand-objects as value to a dart map
  static Map<String, List<DiscountOfferCommand>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<DiscountOfferCommand>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = DiscountOfferCommand.listFromJson(entry.value, growable: growable,);
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

