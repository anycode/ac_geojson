// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'multi_point.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeoJsonMultiPoint _$GeoJsonMultiPointFromJson(Map<String, dynamic> json) =>
    GeoJsonMultiPoint(
      coordinates:
          MultiPointCoordinates.fromJson(json['coordinates'] as List<dynamic>),
      type: json['type'],
    );

Map<String, dynamic> _$GeoJsonMultiPointToJson(GeoJsonMultiPoint instance) =>
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
