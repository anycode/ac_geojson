import 'package:json_annotation/json_annotation.dart';

import 'coordinate.dart';
import 'geometry.dart';

/// A multipolygon
part 'multi_polygon.g.dart';

@JsonSerializable()
class GeoJsonMultiPolygon extends GeoJsonGeometry {
  factory GeoJsonMultiPolygon.fromJson(Map<String, dynamic> json) => _$GeoJsonMultiPolygonFromJson(json);
  Map<String, dynamic> toJson() => _$GeoJsonMultiPolygonToJson(this);

  /// Default constructor
  /// JSON 'type' is intentionally ignored and super is forced to use proper type
  const GeoJsonMultiPolygon({required this.coordinates, this.name, type}) : super(GeoJsonGeometryType.multiPolygon);

  /// The geometry data
  final MultiPolygonCoordinates coordinates;

  /// The name of the multipolygon
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final String? name;

  // equality only on coordinates
  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is GeoJsonMultiPolygon && runtimeType == other.runtimeType && coordinates == other.coordinates;

  @override
  int get hashCode => coordinates.hashCode;

  @override
  String toString() {
    return 'GeoJsonMultiPolygon{coordinates: $coordinates, name: $name}';
  }
}
