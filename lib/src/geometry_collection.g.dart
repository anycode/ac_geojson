// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geometry_collection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeoJsonGeometryCollection _$GeoJsonGeometryCollectionFromJson(
        Map<String, dynamic> json) =>
    GeoJsonGeometryCollection(
      geometries: GeoJsonGeometryCollection._geometriesFromJson(
          json['geometries'] as List<Map<String, dynamic>>),
      type: json['type'],
    );

Map<String, dynamic> _$GeoJsonGeometryCollectionToJson(
    GeoJsonGeometryCollection instance) {
  final val = <String, dynamic>{
    'type': _$GeoJsonGeometryTypeEnumMap[instance.type],
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('geometries',
      GeoJsonGeometryCollection._geometriesToJson(instance.geometries));
  return val;
}

const _$GeoJsonGeometryTypeEnumMap = {
  GeoJsonGeometryType.point: 'Point',
  GeoJsonGeometryType.multiPoint: 'MultiPoint',
  GeoJsonGeometryType.line: 'Line',
  GeoJsonGeometryType.multiLine: 'MultiLine',
  GeoJsonGeometryType.polygon: 'Polygon',
  GeoJsonGeometryType.multiPolygon: 'MultiPolygon',
  GeoJsonGeometryType.geometryCollection: 'GeometryCollection',
};
