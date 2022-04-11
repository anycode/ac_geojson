import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

import 'geo_json.dart';
import 'geometry.dart';

part 'feature.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class GeoJsonFeature<T extends GeoJsonGeometry> {
/*
  static T _geometryFromJson<T extends GeoJsonGeometry>(Object? map) {
    return GeometryConverter<T>().fromJson(map as Map<String, dynamic>);
  }

  static Map<String, dynamic> _geometryToJson<T extends GeoJsonGeometry>(T map) {
    return GeometryConverter<T>().toJson(map);
  }
*/

  GeoJsonFeature({required this.geometry, Map<String, dynamic>? properties, this.boundingBox, type})
      : properties = geometry.name == null ? properties : ((properties ?? <String, dynamic>{})..putIfAbsent('name', () => geometry.name)),
        type = GeoJsonType.feature;

  factory GeoJsonFeature.fromJson(Map<String, dynamic> json) => _$GeoJsonFeatureFromJson<T>(json, GeometryConverter<T>().fromJson);

  Map<String, dynamic> toJson() => _$GeoJsonFeatureToJson<T>(this, GeometryConverter<T>().toJson);

  /// The type of the feature
  final GeoJsonType type;

  /// The feature properties
  final Map<String, dynamic>? properties;

  /// The feature geo data
  final T geometry;

  /// Bounding box
  @JsonKey(name: 'bbox')
  final List<double>? boundingBox;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GeoJsonFeature &&
          // DO NOT COMPARE runtime because of generic <T>
          type == other.type &&
          geometry == other.geometry &&
          const MapEquality().equals(properties, other.properties) &&
          const ListEquality().equals(boundingBox, other.boundingBox);

  @override
  int get hashCode => type.hashCode ^ properties.hashCode ^ geometry.hashCode ^ boundingBox.hashCode;

  @override
  String toString() {
    return 'GeoJsonFeature{type: $type, properties: $properties, geometry: $geometry}';
  }
}
