import 'package:json_annotation/json_annotation.dart';

import 'coordinate.dart';
import 'geometry.dart';

part 'polygon.g.dart';

/// A polygon
@JsonSerializable()
class GeoJsonPolygon extends GeoJsonGeometry {
  factory GeoJsonPolygon.fromJson(Map<String, dynamic> json) => _$GeoJsonPolygonFromJson(json);
  Map<String, dynamic> toJson() => _$GeoJsonPolygonToJson(this);

  /// Default constructor
  /// JSON 'type' is intentionally ignored and super is forced to use proper type
  const GeoJsonPolygon({required this.coordinates, this.name, type}) : super(GeoJsonGeometryType.polygon);

  /// The geometry data
  final PolygonCoordinates coordinates;

  /// The name of the polygon
  @override
  @JsonKey(ignore: true)
  final String? name;

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is GeoJsonPolygon && runtimeType == other.runtimeType && coordinates == other.coordinates;

  @override
  int get hashCode => coordinates.hashCode;

  @override
  String toString() {
    return 'GeoJsonPolygon{coordinates: $coordinates, name: $name}';
  }
}
