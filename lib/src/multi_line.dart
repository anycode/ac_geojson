import 'package:json_annotation/json_annotation.dart';

import 'coordinate.dart';
import 'geometry.dart';

part 'multi_line.g.dart';

/// A multiline
@JsonSerializable()
class GeoJsonMultiLine extends GeoJsonGeometry {
  factory GeoJsonMultiLine.fromJson(Map<String, dynamic> json) => _$GeoJsonMultiLineFromJson(json);
  Map<String, dynamic> toJson() => _$GeoJsonMultiLineToJson(this);

  /// Default constructor
  /// JSON 'type' is intentionally ignored and super is forced to use proper type
  GeoJsonMultiLine({required this.coordinates, this.name, type}) : super(GeoJsonGeometryType.multiLine);

  /// The geometry data
  final MultiLineCoordinates coordinates;

  /// The name of the line
  @override
  @JsonKey(ignore: true)
  final String? name;

  // equality only on coordinates
  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is GeoJsonMultiLine && runtimeType == other.runtimeType && coordinates == other.coordinates;

  @override
  int get hashCode => coordinates.hashCode;

  @override
  String toString() {
    return 'GeoJsonMultiLine{coordinates: $coordinates, name: $name}';
  }
}
