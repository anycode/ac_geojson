import 'package:geojson/geojson.dart';
import 'package:json_annotation/json_annotation.dart';

part 'geometry.g.dart';

// Encodes a field named `pascalCase` with a JSON key `PascalCase`.
@JsonEnum(fieldRename: FieldRename.pascal, alwaysCreate: true)
enum GeoJsonGeometryType {
  /// A point
  point,

  /// Multiple points
  multiPoint,

  /// A line
  line,

  /// Multiple lines
  multiLine,

  /// A polygon
  polygon,

  /// A multiPolygon
  multiPolygon,

  /// A geometry collection
  geometryCollection,
}

@JsonSerializable(createFactory: false, createToJson: false)
abstract class GeoJsonGeometry {
  const GeoJsonGeometry(this.type);
  final GeoJsonGeometryType type;
  String? get name;
}

class GeometryConverter<T extends GeoJsonGeometry> implements JsonConverter<T, Map<String, dynamic>> {
  const GeometryConverter();

  @override
  T fromJson(Object? object) {
    final json = object as Map<String, dynamic>;
    if (!json.containsKey('type')) {
      throw Exception('Geometry is missing "type" key');
    }
    final type = json['type']!;
    if (type == _$GeoJsonGeometryTypeEnumMap[GeoJsonGeometryType.point]) {
      return GeoJsonPoint.fromJson(json) as T;
    } else if (type == _$GeoJsonGeometryTypeEnumMap[GeoJsonGeometryType.multiPoint]) {
      return GeoJsonMultiPoint.fromJson(json) as T;
    } else if (type == _$GeoJsonGeometryTypeEnumMap[GeoJsonGeometryType.line]) {
      return GeoJsonLine.fromJson(json) as T;
    } else if (type == _$GeoJsonGeometryTypeEnumMap[GeoJsonGeometryType.multiLine]) {
      return GeoJsonMultiLine.fromJson(json) as T;
    } else if (type == _$GeoJsonGeometryTypeEnumMap[GeoJsonGeometryType.polygon]) {
      return GeoJsonPolygon.fromJson(json) as T;
    } else if (type == _$GeoJsonGeometryTypeEnumMap[GeoJsonGeometryType.multiPolygon]) {
      return GeoJsonMultiPolygon.fromJson(json) as T;
    } else if (type == _$GeoJsonGeometryTypeEnumMap[GeoJsonGeometryType.geometryCollection]) {
      return GeoJsonGeometryCollection.fromJson(json) as T;
    } else {
      throw Exception('Invalid geometry type "$type"');
    }
  }

  @override
  Map<String, dynamic> toJson(T object) {
    if (object.type == GeoJsonGeometryType.point) {
      return (object as GeoJsonPoint).toJson();
    } else if (object.type == GeoJsonGeometryType.multiPoint) {
      return (object as GeoJsonMultiPoint).toJson();
    } else if (object.type == GeoJsonGeometryType.line) {
      return (object as GeoJsonLine).toJson();
    } else if (object.type == GeoJsonGeometryType.multiLine) {
      return (object as GeoJsonMultiLine).toJson();
    } else if (object.type == GeoJsonGeometryType.polygon) {
      return (object as GeoJsonPolygon).toJson();
    } else if (object.type == GeoJsonGeometryType.multiPolygon) {
      return (object as GeoJsonMultiPolygon).toJson();
    } else if (object.type == GeoJsonGeometryType.geometryCollection) {
      return (object as GeoJsonGeometryCollection).toJson();
    } else {
      throw Exception('Unknown type');
    }
  }
}
