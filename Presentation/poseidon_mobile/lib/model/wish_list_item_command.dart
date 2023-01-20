//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class WishListItemCommand {
  /// Returns a new [WishListItemCommand] instance.
  WishListItemCommand({
    this.wishListItemId,
    this.note,
    this.productId,
    this.quantity,
    this.wishListId,
  });

  int? wishListItemId;

  String? note;

  int? productId;

  num? quantity;

  int? wishListId;

  @override
  bool operator ==(Object other) => identical(this, other) || other is WishListItemCommand &&
     other.wishListItemId == wishListItemId &&
     other.note == note &&
     other.productId == productId &&
     other.quantity == quantity &&
     other.wishListId == wishListId;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (wishListItemId == null ? 0 : wishListItemId!.hashCode) +
    (note == null ? 0 : note!.hashCode) +
    (productId == null ? 0 : productId!.hashCode) +
    (quantity == null ? 0 : quantity!.hashCode) +
    (wishListId == null ? 0 : wishListId!.hashCode);

  @override
  String toString() => 'WishListItemCommand[wishListItemId=$wishListItemId, note=$note, productId=$productId, quantity=$quantity, wishListId=$wishListId]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
    if (wishListItemId != null) {
      _json[r'wishListItemId'] = wishListItemId;
    }
    if (note != null) {
      _json[r'note'] = note;
    }
    if (productId != null) {
      _json[r'productId'] = productId;
    }
    if (quantity != null) {
      _json[r'quantity'] = quantity;
    }
    if (wishListId != null) {
      _json[r'wishListId'] = wishListId;
    }
    return _json;
  }

  /// Returns a new [WishListItemCommand] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static WishListItemCommand? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "WishListItemCommand[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "WishListItemCommand[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return WishListItemCommand(
        wishListItemId: mapValueOfType<int>(json, r'wishListItemId'),
        note: mapValueOfType<String>(json, r'note'),
        productId: mapValueOfType<int>(json, r'productId'),
        quantity: json[r'quantity'] == null
            ? null
            : num.parse(json[r'quantity'].toString()),
        wishListId: mapValueOfType<int>(json, r'wishListId'),
      );
    }
    return null;
  }

  static List<WishListItemCommand>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <WishListItemCommand>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = WishListItemCommand.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, WishListItemCommand> mapFromJson(dynamic json) {
    final map = <String, WishListItemCommand>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = WishListItemCommand.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of WishListItemCommand-objects as value to a dart map
  static Map<String, List<WishListItemCommand>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<WishListItemCommand>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = WishListItemCommand.listFromJson(entry.value, growable: growable,);
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

