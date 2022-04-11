import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

import 'geometry.dart';

part 'geometry_collection.g.dart';

/// A geometry collection
@JsonSerializable()
class GeoJsonGeometryCollection extends GeoJsonGeometry {
  static List<GeoJsonGeometry> _geometriesFromJson(List<Map<String, dynamic>> items) =>
      items.map((item) => const GeometryConverter<GeoJsonGeometry>().fromJson(item)).toList();
  static List<Map<String, dynamic>> _geometriesToJson(List items) =>
      items.map((item) => const GeometryConverter<GeoJsonGeometry>().toJson(item)).toList();

  factory GeoJsonGeometryCollection.fromJson(Map<String, dynamic> json) => _$GeoJsonGeometryCollectionFromJson(json);
  Map<String, dynamic> toJson() => _$GeoJsonGeometryCollectionToJson(this);

  /// Default constructor
  /// JSON 'type' is intentionally ignored and super is forced to use proper type
  const GeoJsonGeometryCollection({required this.geometries, this.name, type}) : super(GeoJsonGeometryType.geometryCollection);

  /// The geometries
  @JsonKey(fromJson: _geometriesFromJson, toJson: _geometriesToJson)
  final List<GeoJsonGeometry> geometries;

  /// The name of the collection
  @override
  @JsonKey(ignore: true)
  final String? name;

  /// Add a geometry to the collection
  void add(GeoJsonGeometry geom) => geometries.add(geom);

  @override
  String toString() {
    return 'GeoJsonGeometryCollection{geometries: $geometries, name: $name}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GeoJsonGeometryCollection && runtimeType == other.runtimeType && const ListEquality().equals(geometries, other.geometries);

  @override
  int get hashCode => geometries.hashCode;
}
