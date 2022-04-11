// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feature_collection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeoJsonFeatureCollection _$GeoJsonFeatureCollectionFromJson(
        Map<String, dynamic> json) =>
    GeoJsonFeatureCollection(
      features: (json['features'] as List<dynamic>)
          .map((e) => GeoJsonFeature<GeoJsonGeometry>.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      boundingBox: (json['bbox'] as List<dynamic>?)
          ?.map((e) => (e as num).toDouble())
          .toList(),
      type: json['type'],
    );

Map<String, dynamic> _$GeoJsonFeatureCollectionToJson(
    GeoJsonFeatureCollection instance) {
  final val = <String, dynamic>{
    'features': instance.features.map((e) => e.toJson()).toList(),
    'type': _$GeoJsonTypeEnumMap[instance.type],
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('bbox', instance.boundingBox);
  return val;
}

const _$GeoJsonTypeEnumMap = {
  GeoJsonType.feature: 'Feature',
  GeoJsonType.featureCollection: 'FeatureCollection',
};
