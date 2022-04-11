import 'package:json_annotation/json_annotation.dart';

import 'coordinate.dart';
import 'geometry.dart';

part 'line.g.dart';

/// A line
@JsonSerializable()
class GeoJsonLine extends GeoJsonGeometry {
  factory GeoJsonLine.fromJson(Map<String, dynamic> json) => _$GeoJsonLineFromJson(json);
  Map<String, dynamic> toJson() => _$GeoJsonLineToJson(this);

  /// Default constructor
  /// JSON 'type' is intentionally ignored and super is forced to use proper type
  GeoJsonLine({required this.coordinates, this.name, type}) : super(GeoJsonGeometryType.line);

  /// The geometry data
  final LineCoordinates coordinates;

  /// The name of the line
  @override
  @JsonKey(ignore: true)
  final String? name;

  // equality only on coordinates
  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is GeoJsonLine && runtimeType == other.runtimeType && coordinates == other.coordinates;

  @override
  int get hashCode => coordinates.hashCode;

  @override
  String toString() {
    return 'GeoJsonLine{coordinates: $coordinates, name: $name}';
  }
}
