import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

class PointCoordinates {
  factory PointCoordinates.fromJson(List<double> json) => const _CoordinateConverter().fromJson(json);
  List<dynamic> toJson() => const _CoordinateConverter().toJson(this);
  PointCoordinates({required this.latitude, required this.longitude, this.altitude});

  final double latitude;
  final double longitude;
  final double? altitude;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PointCoordinates &&
          runtimeType == other.runtimeType &&
          latitude == other.latitude &&
          longitude == other.longitude &&
          altitude == other.altitude;

  @override
  int get hashCode => latitude.hashCode ^ longitude.hashCode ^ altitude.hashCode;

  @override
  String toString() {
    return 'PointCoordinates{latitude: $latitude, longitude: $longitude, altitude: $altitude}';
  }
}

class MultiPointCoordinates {
  factory MultiPointCoordinates.fromJson(List<dynamic> json) =>
      MultiPointCoordinates(json.map((coordinate) => PointCoordinates.fromJson(coordinate)).toList());
  List<dynamic> toJson() => coordinates.map((coordinate) => coordinate.toJson()).toList();
  MultiPointCoordinates(this.coordinates);

  List<PointCoordinates> coordinates;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MultiPointCoordinates && runtimeType == other.runtimeType && const ListEquality().equals(coordinates, other.coordinates);

  @override
  int get hashCode => coordinates.hashCode;

  @override
  String toString() {
    return 'MultiPointCoordinates{coordinates: $coordinates}';
  }
}

class LineCoordinates {
  factory LineCoordinates.fromJson(List<dynamic> json) =>
      LineCoordinates(json.map((coordinate) => PointCoordinates.fromJson(coordinate)).toList());
  List<dynamic> toJson() => coordinates.map((coordinate) => coordinate.toJson()).toList();
  LineCoordinates(this.coordinates);

  List<PointCoordinates> coordinates;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LineCoordinates && runtimeType == other.runtimeType && const ListEquality().equals(coordinates, other.coordinates);

  @override
  int get hashCode => coordinates.hashCode;

  @override
  String toString() {
    return 'LineCoordinates{coordinates: $coordinates}';
  }
}

class MultiLineCoordinates {
  factory MultiLineCoordinates.fromJson(List<dynamic> json) =>
      MultiLineCoordinates(json.map((coordinate) => LineCoordinates.fromJson(coordinate)).toList());
  List<dynamic> toJson() => coordinates.map((coordinate) => coordinate.toJson()).toList();
  MultiLineCoordinates(this.coordinates);

  List<LineCoordinates> coordinates;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MultiLineCoordinates && runtimeType == other.runtimeType && const ListEquality().equals(coordinates, other.coordinates);

  @override
  int get hashCode => coordinates.hashCode;

  @override
  String toString() {
    return 'MultiLineCoordinates{coordinates: $coordinates}';
  }
}

class PolygonCoordinates {
  factory PolygonCoordinates.fromJson(List<dynamic> json) =>
      PolygonCoordinates(json.map((coordinate) => LineCoordinates.fromJson(coordinate)).toList());
  List<dynamic> toJson() => coordinates.map((coordinate) => coordinate.toJson()).toList();
  PolygonCoordinates(this.coordinates)
      : assert(coordinates.every((line) => line.coordinates.first == line.coordinates.last),
            'First and last coordinate of all polygon paths must be identical');

  List<LineCoordinates> coordinates;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PolygonCoordinates && runtimeType == other.runtimeType && const ListEquality().equals(coordinates, other.coordinates);

  @override
  int get hashCode => coordinates.hashCode;

  @override
  String toString() {
    return 'PolygonCoordinates{coordinates: $coordinates}';
  }
}

class MultiPolygonCoordinates {
  factory MultiPolygonCoordinates.fromJson(List<dynamic> json) =>
      MultiPolygonCoordinates(json.map((coordinate) => PolygonCoordinates.fromJson(coordinate)).toList());
  List<dynamic> toJson() => coordinates.map((coordinate) => coordinate.toJson()).toList();
  MultiPolygonCoordinates(this.coordinates);

  List<PolygonCoordinates> coordinates;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MultiPolygonCoordinates && runtimeType == other.runtimeType && const ListEquality().equals(coordinates, other.coordinates);

  @override
  int get hashCode => coordinates.hashCode;

  @override
  String toString() {
    return 'MultiPolygonCoordinates{coordinates: $coordinates}';
  }
}

///
///  CoordinateConverter annotation
///  e.g.
///  @JsonKey(name: 'coordinate')
///  @CoordinateConverter()
///  Coordinate coordinate;
///

class _CoordinateConverter implements JsonConverter<PointCoordinates, List<double>> {
  const _CoordinateConverter();

  @override
  PointCoordinates fromJson(List<double> json) {
    if (json.isEmpty) {
      throw Exception('Missing coordinates. Must be list of [lng, lat, alt?]');
    }
    if (json.length < 2 || json.length > 3) {
      throw Exception('Wrong coordinates "$json". Must be list of [lng, lat, alt?]');
    }
    return PointCoordinates(longitude: json[0], latitude: json[1], altitude: json.length == 2 ? null : json[2]);
  }

  @override
  List<double> toJson(PointCoordinates coordinate) {
    return [
      coordinate.longitude,
      coordinate.latitude,
      if (coordinate.altitude != null) coordinate.altitude!,
    ];
  }
}
