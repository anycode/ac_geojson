// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'multi_polygon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeoJsonMultiPolygon _$GeoJsonMultiPolygonFromJson(Map<String, dynamic> json) =>
    GeoJsonMultiPolygon(
      coordinates: MultiPolygonCoordinates.fromJson(
          json['coordinates'] as List<dynamic>),
      type: json['type'],
    );

Map<String, dynamic> _$GeoJsonMultiPolygonToJson(
        GeoJsonMultiPolygon instance) =>
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
