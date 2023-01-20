//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class OrderItemDtoResponseData {
  /// Returns a new [OrderItemDtoResponseData] instance.
  OrderItemDtoResponseData({
    this.items = const [],
    this.pageIndex,
    this.totalPages,
    this.totalCount,
    this.hasPreviousPage,
    this.hasNextPage,
  });

  List<OrderItemDto>? items;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? pageIndex;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? totalPages;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? totalCount;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? hasPreviousPage;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? hasNextPage;

  @override
  bool operator ==(Object other) => identical(this, other) || other is OrderItemDtoResponseData &&
     other.items == items &&
     other.pageIndex == pageIndex &&
     other.totalPages == totalPages &&
     other.totalCount == totalCount &&
     other.hasPreviousPage == hasPreviousPage &&
     other.hasNextPage == hasNextPage;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (items == null ? 0 : items!.hashCode) +
    (pageIndex == null ? 0 : pageIndex!.hashCode) +
    (totalPages == null ? 0 : totalPages!.hashCode) +
    (totalCount == null ? 0 : totalCount!.hashCode) +
    (hasPreviousPage == null ? 0 : hasPreviousPage!.hashCode) +
    (hasNextPage == null ? 0 : hasNextPage!.hashCode);

  @override
  String toString() => 'OrderItemDtoResponseData[items=$items, pageIndex=$pageIndex, totalPages=$totalPages, totalCount=$totalCount, hasPreviousPage=$hasPreviousPage, hasNextPage=$hasNextPage]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
    if (items != null) {
      _json[r'items'] = items;
    }
    if (pageIndex != null) {
      _json[r'pageIndex'] = pageIndex;
    }
    if (totalPages != null) {
      _json[r'totalPages'] = totalPages;
    }
    if (totalCount != null) {
      _json[r'totalCount'] = totalCount;
    }
    if (hasPreviousPage != null) {
      _json[r'hasPreviousPage'] = hasPreviousPage;
    }
    if (hasNextPage != null) {
      _json[r'hasNextPage'] = hasNextPage;
    }
    return _json;
  }

  /// Returns a new [OrderItemDtoResponseData] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static OrderItemDtoResponseData? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "OrderItemDtoResponseData[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "OrderItemDtoResponseData[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return OrderItemDtoResponseData(
        items: OrderItemDto.listFromJson(json[r'items']) ?? const [],
        pageIndex: mapValueOfType<int>(json, r'pageIndex'),
        totalPages: mapValueOfType<int>(json, r'totalPages'),
        totalCount: mapValueOfType<int>(json, r'totalCount'),
        hasPreviousPage: mapValueOfType<bool>(json, r'hasPreviousPage'),
        hasNextPage: mapValueOfType<bool>(json, r'hasNextPage'),
      );
    }
    return null;
  }

  static List<OrderItemDtoResponseData>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <OrderItemDtoResponseData>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = OrderItemDtoResponseData.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, OrderItemDtoResponseData> mapFromJson(dynamic json) {
    final map = <String, OrderItemDtoResponseData>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = OrderItemDtoResponseData.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of OrderItemDtoResponseData-objects as value to a dart map
  static Map<String, List<OrderItemDtoResponseData>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<OrderItemDtoResponseData>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = OrderItemDtoResponseData.listFromJson(entry.value, growable: growable,);
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

