import 'package:json_annotation/json_annotation.dart';

import 'coordinate.dart';
import 'geometry.dart';

part 'point.g.dart';

/// A point
@JsonSerializable()
class GeoJsonPoint extends GeoJsonGeometry {
  factory GeoJsonPoint.fromJson(Map<String, dynamic> json) => _$GeoJsonPointFromJson(json);
  Map<String, dynamic> toJson() => _$GeoJsonPointToJson(this);

  /// Default constructor
  /// JSON 'type' is intentionally ignored and super is forced to use proper type
  const GeoJsonPoint({required this.coordinates, this.name, type}) : super(GeoJsonGeometryType.point);

  /// The geometry data
  final PointCoordinates coordinates;

  /// The name of the point
  @override
  @JsonKey(ignore: true)
  final String? name;

  // equality only on coordinates
  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is GeoJsonPoint && runtimeType == other.runtimeType && coordinates == other.coordinates;

  @override
  int get hashCode => coordinates.hashCode;

  @override
  String toString() {
    return 'GeoJsonPoint{coordinates: $coordinates, name: $name}';
  }
}
