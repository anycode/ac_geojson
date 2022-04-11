// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feature.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeoJsonFeature<T> _$GeoJsonFeatureFromJson<T extends GeoJsonGeometry>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    GeoJsonFeature<T>(
      geometry: fromJsonT(json['geometry']),
      properties: json['properties'] as Map<String, dynamic>?,
      boundingBox: (json['bbox'] as List<dynamic>?)
          ?.map((e) => (e as num).toDouble())
          .toList(),
      type: json['type'],
    );

Map<String, dynamic> _$GeoJsonFeatureToJson<T extends GeoJsonGeometry>(
  GeoJsonFeature<T> instance,
  Object? Function(T value) toJsonT,
) {
  final val = <String, dynamic>{
    'type': _$GeoJsonTypeEnumMap[instance.type],
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('properties', instance.properties);
  val['geometry'] = toJsonT(instance.geometry);
  writeNotNull('bbox', instance.boundingBox);
  return val;
}

const _$GeoJsonTypeEnumMap = {
  GeoJsonType.feature: 'Feature',
  GeoJsonType.featureCollection: 'FeatureCollection',
};
