// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'point.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeoJsonPoint _$GeoJsonPointFromJson(Map<String, dynamic> json) => GeoJsonPoint(
      coordinates: PointCoordinates.fromJson(
          (json['coordinates'] as List<dynamic>)
              .map((e) => (e as num).toDouble())
              .toList()),
      type: json['type'],
    );

Map<String, dynamic> _$GeoJsonPointToJson(GeoJsonPoint instance) =>
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
