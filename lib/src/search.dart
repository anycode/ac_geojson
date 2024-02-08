import 'package:ac_geojson/src/geometry.dart';

/// The type of search to process
enum GeoSearchType {
  /// Find the exact values
  exact,

  /// Find the values that starts with
  startsWith,

  /// Find the values contained in string
  contains
}

/// A geojson query for search
class GeoJsonQuery {
  /// Provide a [geometryType] and/or a [property] and [value]
  GeoJsonQuery({this.property, this.value, this.geometryType, this.matchCase = true, this.searchType = GeoSearchType.exact}) {
    if (geometryType == null) {
      if (property == null || value == null) {
        throw ArgumentError.notNull("Property and value must not be null if no geometry "
            "type is provided");
      }
    }
  }

  /// The property to search for
  final String? property;

  /// The value of the property to search for
  final dynamic value;

  /// The type of geometry to search for
  final GeoJsonGeometryType? geometryType;

  /// The type of search to process (for strings)
  final GeoSearchType searchType;

  /// Match the case of string or not
  final bool matchCase;
}
