import 'package:geojson/src/coordinate.dart';
import 'package:json_annotation/json_annotation.dart';

import 'geometry.dart';

part 'multi_point.g.dart';

/// Multiple points
@JsonSerializable()
class GeoJsonMultiPoint extends GeoJsonGeometry {
  factory GeoJsonMultiPoint.fromJson(Map<String, dynamic> json) => _$GeoJsonMultiPointFromJson(json);
  Map<String, dynamic> toJson() => _$GeoJsonMultiPointToJson(this);

  /// Default constructor
  /// JSON 'type' is intentionally ignored and super is forced to use proper type
  GeoJsonMultiPoint({required this.coordinates, this.name, type}) : super(GeoJsonGeometryType.multiPoint);

  /// The geometry data
  final MultiPointCoordinates coordinates;

  /// The name of the multi point
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final String? name;

  // equality only on coordinates
  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is GeoJsonMultiPoint && runtimeType == other.runtimeType && coordinates == other.coordinates;

  @override
  int get hashCode => coordinates.hashCode;

  @override
  String toString() {
    return 'GeoJsonMultiPoint{coordinates: $coordinates, name: $name}';
  }
}
