import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

import 'feature.dart';
import 'geo_json.dart';
import 'geometry.dart';

part 'feature_collection.g.dart';

/// A list of features
@JsonSerializable()
class GeoJsonFeatureCollection {
  factory GeoJsonFeatureCollection.fromJson(Map<String, dynamic> json) => _$GeoJsonFeatureCollectionFromJson(json);
  Map<String, dynamic> toJson() => _$GeoJsonFeatureCollectionToJson(this);

  /// Default constructor
  GeoJsonFeatureCollection({required this.features, this.boundingBox, type}) : type = GeoJsonType.featureCollection;

  /// A features collection
  List<GeoJsonFeature> features;

  /// The type of the feature
  final GeoJsonType type;

  /// Bounding box
  @JsonKey(name: 'bbox')
  final List<double>? boundingBox;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GeoJsonFeatureCollection &&
          runtimeType == other.runtimeType &&
          type == other.type &&
          const ListEquality().equals(features, other.features) &&
          const ListEquality().equals(boundingBox, other.boundingBox);

  @override
  int get hashCode => features.hashCode ^ type.hashCode ^ boundingBox.hashCode;

  @override
  String toString() {
    return 'GeoJsonFeatureCollection{features: $features, type: $type}';
  }
}
