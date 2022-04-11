import 'package:json_annotation/json_annotation.dart';

import 'feature.dart';
import 'feature_collection.dart';

part 'geo_json.g.dart';

// Encodes a field named `pascalCase` with a JSON key `PascalCase`.
@JsonEnum(fieldRename: FieldRename.pascal, alwaysCreate: true)
enum GeoJsonType {
  /// Feature
  feature,

  /// Feature collection
  featureCollection,
}

@JsonSerializable(createToJson: false, createFactory: false)
class GeoJson {
  factory GeoJson.fromJson(Map<String, dynamic> json) {
    if (!json.containsKey('type')) {
      throw Exception('Missing type on GeoJson');
    }
    if (json['type'] == _$GeoJsonTypeEnumMap[GeoJsonType.feature]) {
      return GeoJson(feature: GeoJsonFeature.fromJson(json));
    } else if (json['type'] == _$GeoJsonTypeEnumMap[GeoJsonType.featureCollection]) {
      return GeoJson(featureCollection: GeoJsonFeatureCollection.fromJson(json));
    } else {
      throw Exception('Invalid type "${json['key']}" on GeoJson');
    }
  }
  Map<String, dynamic> toJson() => feature != null ? feature!.toJson() : featureCollection!.toJson();

  /// Default constructor
  GeoJson({this.featureCollection, this.feature})
      : assert((feature == null) != (featureCollection == null), 'Only feature or feature collection must be passed');

  //@JsonKey(fromJson: GeoJsonFeature.fromJson)
  GeoJsonFeature? feature;
  GeoJsonFeatureCollection? featureCollection;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GeoJson && runtimeType == other.runtimeType && feature == other.feature && featureCollection == other.featureCollection;

  @override
  int get hashCode => feature.hashCode ^ featureCollection.hashCode;
}
