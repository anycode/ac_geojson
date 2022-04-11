// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'polygon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeoJsonPolygon _$GeoJsonPolygonFromJson(Map<String, dynamic> json) =>
    GeoJsonPolygon(
      coordinates:
          PolygonCoordinates.fromJson(json['coordinates'] as List<dynamic>),
      type: json['type'],
    );

Map<String, dynamic> _$GeoJsonPolygonToJson(GeoJsonPolygon instance) =>
    <String, dynamic>{
      'type': _$GeoJsonGeometryTypeEnumMap[instance.type],
      'coordinates': instance.coordinates.toJson(),
    };

const _$GeoJsonGeometryTypeEnumMap = {
  GeoJsonGeometryType.point: 'Point',
  GeoJsonGeometryType.multiPoint: 'MultiPoint',
  GeoJsonGeometryType.line: 'Line',
  GeoJsonGeometryType.multiLine: 'MultiLine',
  GeoJsonGeometryType.polygon: 'Polygon',
  GeoJsonGeometryType.multiPolygon: 'MultiPolygon',
  GeoJsonGeometryType.geometryCollection: 'GeometryCollection',
};
