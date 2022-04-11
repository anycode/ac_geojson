// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'multi_line.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeoJsonMultiLine _$GeoJsonMultiLineFromJson(Map<String, dynamic> json) =>
    GeoJsonMultiLine(
      coordinates:
          MultiLineCoordinates.fromJson(json['coordinates'] as List<dynamic>),
      type: json['type'],
    );

Map<String, dynamic> _$GeoJsonMultiLineToJson(GeoJsonMultiLine instance) =>
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
