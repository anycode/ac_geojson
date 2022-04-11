// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'line.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeoJsonLine _$GeoJsonLineFromJson(Map<String, dynamic> json) => GeoJsonLine(
      coordinates:
          LineCoordinates.fromJson(json['coordinates'] as List<dynamic>),
      type: json['type'],
    );

Map<String, dynamic> _$GeoJsonLineToJson(GeoJsonLine instance) =>
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
