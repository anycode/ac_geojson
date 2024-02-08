import 'package:ac_geojson/ac_geojson.dart';
import 'package:recase/recase.dart';
import 'package:test/test.dart';

void main() {
  group('GeoJson Coordinates tests', () {
    setUp(() {
      // Additional setup goes here.
    });

    test('PointC', () {
      final point = PointCoordinates(latitude: 99.9, longitude: 10.1);
      final json = <double>[10.1, 99.9];
      expect(point.toJson(), json);
      expect(point, PointCoordinates.fromJson(json));
    });

    test('MultiPointC', () {
      final multiPoint = MultiPointCoordinates([
        PointCoordinates(latitude: 99.9, longitude: 10.1),
        PointCoordinates(latitude: 87.6, longitude: 23.4, altitude: 0.05),
      ]);
      final json = [
        <double>[10.1, 99.9],
        <double>[23.4, 87.6, 0.05],
      ];
      expect(multiPoint.toJson(), json);
      expect(multiPoint, MultiPointCoordinates.fromJson(json));
    });

    test('LineC', () {
      final line = LineCoordinates([
        PointCoordinates(latitude: 99.9, longitude: 10.1),
        PointCoordinates(latitude: 87.6, longitude: 23.4, altitude: 0.05),
      ]);
      final json = [
        <double>[10.1, 99.9],
        <double>[23.4, 87.6, 0.05],
      ];
      expect(line.toJson(), json);
      expect(line, LineCoordinates.fromJson(json));
    });

    test('MultiLineC', () {
      final multiLine = MultiLineCoordinates([
        LineCoordinates([
          PointCoordinates(latitude: 99.9, longitude: 10.1),
          PointCoordinates(latitude: 87.6, longitude: 23.4, altitude: 0.05),
        ]),
        LineCoordinates([
          PointCoordinates(latitude: 16.8, longitude: 67.4),
          PointCoordinates(latitude: 91.6, longitude: 0.46),
        ]),
      ]);
      final json = [
        [
          <double>[10.1, 99.9],
          <double>[23.4, 87.6, 0.05],
        ],
        [
          <double>[67.4, 16.8],
          <double>[0.46, 91.6],
        ],
      ];
      expect(multiLine.toJson(), json);
      expect(multiLine, MultiLineCoordinates.fromJson(json));
    });

    test('PolygonC', () {
      final polygon = PolygonCoordinates([
        LineCoordinates([
          PointCoordinates(latitude: 99.9, longitude: 10.1),
          PointCoordinates(latitude: 87.6, longitude: 23.4, altitude: 0.05),
          PointCoordinates(latitude: 99.9, longitude: 10.1),
        ]),
        LineCoordinates([
          PointCoordinates(latitude: 16.8, longitude: 67.4),
          PointCoordinates(latitude: 2.45, longitude: 7.6),
          PointCoordinates(latitude: 93.3, longitude: 9.4),
          PointCoordinates(latitude: 14.6, longitude: 57.1),
          PointCoordinates(latitude: 16.8, longitude: 67.4),
        ]),
      ]);
      final json = [
        [
          <double>[10.1, 99.9],
          <double>[23.4, 87.6, 0.05],
          <double>[10.1, 99.9],
        ],
        [
          <double>[67.4, 16.8],
          <double>[7.6, 2.45],
          <double>[9.4, 93.3],
          <double>[57.1, 14.6],
          <double>[67.4, 16.8],
        ],
      ];
      expect(polygon.toJson(), json);
      expect(polygon, PolygonCoordinates.fromJson(json));
    });

    test('MultiPolygonC', () {
      final multiPolygon = MultiPolygonCoordinates([
        PolygonCoordinates([
          LineCoordinates([
            PointCoordinates(latitude: 99.9, longitude: 10.1),
            PointCoordinates(latitude: 87.6, longitude: 23.4, altitude: 0.05),
            PointCoordinates(latitude: 99.9, longitude: 10.1),
          ]),
          LineCoordinates([
            PointCoordinates(latitude: 16.8, longitude: 67.4),
            PointCoordinates(latitude: 2.45, longitude: 7.6),
            PointCoordinates(latitude: 93.3, longitude: 9.4),
            PointCoordinates(latitude: 14.6, longitude: 57.1),
            PointCoordinates(latitude: 16.8, longitude: 67.4),
          ]),
        ]),
        PolygonCoordinates([
          LineCoordinates([
            PointCoordinates(latitude: 99.9, longitude: 10.1),
            PointCoordinates(latitude: 87.6, longitude: 23.4, altitude: 0.05),
            PointCoordinates(latitude: 99.9, longitude: 10.1),
          ]),
          LineCoordinates([
            PointCoordinates(latitude: 16.8, longitude: 67.4),
            PointCoordinates(latitude: 2.45, longitude: 7.6),
            PointCoordinates(latitude: 93.3, longitude: 9.4),
            PointCoordinates(latitude: 14.6, longitude: 57.1),
            PointCoordinates(latitude: 16.8, longitude: 67.4),
          ]),
        ]),
      ]);
      final json = [
        [
          [
            <double>[10.1, 99.9],
            <double>[23.4, 87.6, 0.05],
            <double>[10.1, 99.9],
          ],
          [
            <double>[67.4, 16.8],
            <double>[7.6, 2.45],
            <double>[9.4, 93.3],
            <double>[57.1, 14.6],
            <double>[67.4, 16.8],
          ]
        ],
        [
          [
            <double>[10.1, 99.9],
            <double>[23.4, 87.6, 0.05],
            <double>[10.1, 99.9],
          ],
          [
            <double>[67.4, 16.8],
            <double>[7.6, 2.45],
            <double>[9.4, 93.3],
            <double>[57.1, 14.6],
            <double>[67.4, 16.8],
          ]
        ],
      ];
      expect(multiPolygon.toJson(), json);
      expect(multiPolygon, MultiPolygonCoordinates.fromJson(json));
    });
  });

  group('GeoJson Geometries tests', () {
    setUp(() {
      // Additional setup goes here.
    });

    test('PointG', () {
      final name = 'point geometry';
      final point = GeoJsonPoint(
        coordinates: PointCoordinates(latitude: 99.9, longitude: 10.1),
        name: name,
      );
      final json = <String, dynamic>{
        'coordinates': <double>[10.1, 99.9],
        'type': GeoJsonGeometryType.point.name.pascalCase,
      };
      expect(point.toJson(), json);
      expect(point, GeoJsonPoint.fromJson(json));
    });

    test('MultiPointG', () {
      final name = 'multi point geometry';
      final multiPoint = GeoJsonMultiPoint(
        coordinates: MultiPointCoordinates([
          PointCoordinates(latitude: 99.9, longitude: 10.1),
          PointCoordinates(latitude: 87.6, longitude: 23.4, altitude: 0.05),
        ]),
        name: name,
      );
      final json = <String, dynamic>{
        'coordinates': [
          <double>[10.1, 99.9],
          <double>[23.4, 87.6, 0.05]
        ],
        'type': GeoJsonGeometryType.multiPoint.name.pascalCase,
      };
      expect(multiPoint.toJson(), json);
      expect(multiPoint, GeoJsonMultiPoint.fromJson(json));
    });

    test('LineG', () {
      final name = 'line geometry';
      final line = GeoJsonLine(
        coordinates: LineCoordinates([
          PointCoordinates(latitude: 99.9, longitude: 10.1),
          PointCoordinates(latitude: 87.6, longitude: 23.4, altitude: 0.05),
        ]),
        name: name,
      );
      final json = <String, dynamic>{
        'coordinates': [
          <double>[10.1, 99.9],
          <double>[23.4, 87.6, 0.05],
        ],
        'type': GeoJsonGeometryType.line.name.pascalCase,
      };
      expect(line.toJson(), json);
      expect(line, GeoJsonLine.fromJson(json));
    });

    test('MultiLineG', () {
      final name = 'multi line geometry';
      final multiLine = GeoJsonMultiLine(
        coordinates: MultiLineCoordinates([
          LineCoordinates([
            PointCoordinates(latitude: 99.9, longitude: 10.1),
            PointCoordinates(latitude: 87.6, longitude: 23.4, altitude: 0.05),
          ]),
          LineCoordinates([
            PointCoordinates(latitude: 16.8, longitude: 67.4),
            PointCoordinates(latitude: 91.6, longitude: 0.46),
          ]),
        ]),
        name: name,
      );
      final json = <String, dynamic>{
        'coordinates': [
          [
            <double>[10.1, 99.9],
            <double>[23.4, 87.6, 0.05],
          ],
          [
            <double>[67.4, 16.8],
            <double>[0.46, 91.6],
          ],
        ],
        'type': GeoJsonGeometryType.multiLine.name.pascalCase,
      };
      expect(multiLine.toJson(), json);
      expect(multiLine, GeoJsonMultiLine.fromJson(json));
    });

    test('PolygonG', () {
      final name = 'polygon geometry';
      final polygon = GeoJsonPolygon(
        coordinates: PolygonCoordinates([
          LineCoordinates([
            PointCoordinates(latitude: 99.9, longitude: 10.1),
            PointCoordinates(latitude: 87.6, longitude: 23.4, altitude: 0.05),
            PointCoordinates(latitude: 99.9, longitude: 10.1),
          ]),
          LineCoordinates([
            PointCoordinates(latitude: 16.8, longitude: 67.4),
            PointCoordinates(latitude: 2.45, longitude: 7.6),
            PointCoordinates(latitude: 93.3, longitude: 9.4),
            PointCoordinates(latitude: 14.6, longitude: 57.1),
            PointCoordinates(latitude: 16.8, longitude: 67.4),
          ]),
        ]),
        name: name,
      );
      final json = <String, dynamic>{
        'coordinates': [
          [
            <double>[10.1, 99.9],
            <double>[23.4, 87.6, 0.05],
            <double>[10.1, 99.9],
          ],
          [
            <double>[67.4, 16.8],
            <double>[7.6, 2.45],
            <double>[9.4, 93.3],
            <double>[57.1, 14.6],
            <double>[67.4, 16.8],
          ],
        ],
        'type': GeoJsonGeometryType.polygon.name.pascalCase,
      };
      expect(polygon.toJson(), json);
      expect(polygon, GeoJsonPolygon.fromJson(json));
    });

    test('MultiPolygonG', () {
      final name = 'multi polygon geometry';
      final multiPolygon = GeoJsonMultiPolygon(
        coordinates: MultiPolygonCoordinates([
          PolygonCoordinates([
            LineCoordinates([
              PointCoordinates(latitude: 99.9, longitude: 10.1),
              PointCoordinates(latitude: 87.6, longitude: 23.4, altitude: 0.05),
              PointCoordinates(latitude: 99.9, longitude: 10.1),
            ]),
            LineCoordinates([
              PointCoordinates(latitude: 16.8, longitude: 67.4),
              PointCoordinates(latitude: 2.45, longitude: 7.6),
              PointCoordinates(latitude: 93.3, longitude: 9.4),
              PointCoordinates(latitude: 14.6, longitude: 57.1),
              PointCoordinates(latitude: 16.8, longitude: 67.4),
            ]),
          ]),
          PolygonCoordinates([
            LineCoordinates([
              PointCoordinates(latitude: 99.9, longitude: 10.1),
              PointCoordinates(latitude: 87.6, longitude: 23.4, altitude: 0.05),
              PointCoordinates(latitude: 99.9, longitude: 10.1),
            ]),
            LineCoordinates([
              PointCoordinates(latitude: 16.8, longitude: 67.4),
              PointCoordinates(latitude: 2.45, longitude: 7.6),
              PointCoordinates(latitude: 93.3, longitude: 9.4),
              PointCoordinates(latitude: 14.6, longitude: 57.1),
              PointCoordinates(latitude: 16.8, longitude: 67.4),
            ]),
          ]),
        ]),
        name: name,
      );
      final json = <String, dynamic>{
        'coordinates': [
          [
            [
              <double>[10.1, 99.9],
              <double>[23.4, 87.6, 0.05],
              <double>[10.1, 99.9],
            ],
            [
              <double>[67.4, 16.8],
              <double>[7.6, 2.45],
              <double>[9.4, 93.3],
              <double>[57.1, 14.6],
              <double>[67.4, 16.8],
            ]
          ],
          [
            [
              <double>[10.1, 99.9],
              <double>[23.4, 87.6, 0.05],
              <double>[10.1, 99.9],
            ],
            [
              <double>[67.4, 16.8],
              <double>[7.6, 2.45],
              <double>[9.4, 93.3],
              <double>[57.1, 14.6],
              <double>[67.4, 16.8],
            ]
          ],
        ],
        'type': GeoJsonGeometryType.multiPolygon.name.pascalCase,
      };
      expect(multiPolygon.toJson(), json);
      expect(multiPolygon, GeoJsonMultiPolygon.fromJson(json));
    });

    test('GCollection', () {
      final name = 'geometries collection';
      final collection = GeoJsonGeometryCollection(
        geometries: [
          GeoJsonPoint(
            coordinates: PointCoordinates(latitude: 99.9, longitude: 10.1),
            name: name,
          ),
          GeoJsonMultiPoint(
            coordinates: MultiPointCoordinates([
              PointCoordinates(latitude: 99.9, longitude: 10.1),
              PointCoordinates(latitude: 87.6, longitude: 23.4, altitude: 0.05),
            ]),
            name: name,
          ),
        ],
      );
      final json = <String, dynamic>{
        'type': GeoJsonGeometryType.geometryCollection.name.pascalCase,
        'geometries': [
          {
            'type': GeoJsonGeometryType.point.name.pascalCase,
            'coordinates': <double>[10.1, 99.9],
          },
          {
            'type': GeoJsonGeometryType.multiPoint.name.pascalCase,
            'coordinates': [
              <double>[10.1, 99.9],
              <double>[23.4, 87.6, 0.05]
            ],
          },
        ],
      };
      expect(collection.toJson(), json);
      expect(collection, GeoJsonGeometryCollection.fromJson(json));
    });
  });

  group('GeoJson Features tests', () {
    setUp(() {
      // Additional setup goes here.
    });

    test('PointF', () {
      final name = 'point';
      final point = GeoJsonFeature<GeoJsonPoint>(
        geometry: GeoJsonPoint(
          coordinates: PointCoordinates(latitude: 99.9, longitude: 10.1),
          name: name,
        ),
      );
      final json = <String, dynamic>{
        'type': GeoJsonType.feature.name.pascalCase,
        'properties': {'name': name},
        'geometry': {
          'type': GeoJsonGeometryType.point.name.pascalCase,
          'coordinates': <double>[10.1, 99.9],
        },
      };
      expect(point.toJson(), json);
      expect(point, GeoJsonFeature.fromJson(json));
    });

    test('MultiPointF', () {
      final name = 'multi point feature';
      final multiPoint = GeoJsonFeature<GeoJsonMultiPoint>(
        geometry: GeoJsonMultiPoint(
          coordinates: MultiPointCoordinates([
            PointCoordinates(latitude: 99.9, longitude: 10.1),
            PointCoordinates(latitude: 87.6, longitude: 23.4, altitude: 0.05),
          ]),
          name: name,
        ),
      );
      final json = <String, dynamic>{
        'type': GeoJsonType.feature.name.pascalCase,
        'properties': {'name': name},
        'geometry': {
          'type': GeoJsonGeometryType.multiPoint.name.pascalCase,
          'coordinates': [
            <double>[10.1, 99.9],
            <double>[23.4, 87.6, 0.05]
          ],
        },
      };
      expect(multiPoint.toJson(), json);
      expect(multiPoint, GeoJsonFeature.fromJson(json));
    });

    test('LineF', () {
      final name = 'line feature';
      final line = GeoJsonFeature<GeoJsonLine>(
        geometry: GeoJsonLine(
          coordinates: LineCoordinates([
            PointCoordinates(latitude: 99.9, longitude: 10.1),
            PointCoordinates(latitude: 87.6, longitude: 23.4, altitude: 0.05),
          ]),
          name: name,
        ),
      );
      final json = <String, dynamic>{
        'type': GeoJsonType.feature.name.pascalCase,
        'properties': {'name': name},
        'geometry': {
          'type': GeoJsonGeometryType.line.name.pascalCase,
          'coordinates': [
            <double>[10.1, 99.9],
            <double>[23.4, 87.6, 0.05],
          ],
        },
      };
      expect(line.toJson(), json);
      expect(line, GeoJsonFeature.fromJson(json));
    });

    test('MultiLineF', () {
      final name = 'multi line feature';
      final multiLine = GeoJsonFeature<GeoJsonMultiLine>(
        geometry: GeoJsonMultiLine(
          coordinates: MultiLineCoordinates([
            LineCoordinates([
              PointCoordinates(latitude: 99.9, longitude: 10.1),
              PointCoordinates(latitude: 87.6, longitude: 23.4, altitude: 0.05),
            ]),
            LineCoordinates([
              PointCoordinates(latitude: 16.8, longitude: 67.4),
              PointCoordinates(latitude: 91.6, longitude: 0.46),
            ]),
          ]),
          name: name,
        ),
      );
      final json = <String, dynamic>{
        'type': GeoJsonType.feature.name.pascalCase,
        'properties': {'name': name},
        'geometry': {
          'type': GeoJsonGeometryType.multiLine.name.pascalCase,
          'coordinates': [
            [
              <double>[10.1, 99.9],
              <double>[23.4, 87.6, 0.05],
            ],
            [
              <double>[67.4, 16.8],
              <double>[0.46, 91.6],
            ],
          ],
        },
      };
      expect(multiLine.toJson(), json);
      expect(multiLine, GeoJsonFeature.fromJson(json));
    });

    test('PolygonF', () {
      final name = 'polygon feature';
      final polygon = GeoJsonFeature<GeoJsonPolygon>(
        geometry: GeoJsonPolygon(
          coordinates: PolygonCoordinates([
            LineCoordinates([
              PointCoordinates(latitude: 99.9, longitude: 10.1),
              PointCoordinates(latitude: 87.6, longitude: 23.4, altitude: 0.05),
              PointCoordinates(latitude: 99.9, longitude: 10.1),
            ]),
            LineCoordinates([
              PointCoordinates(latitude: 16.8, longitude: 67.4),
              PointCoordinates(latitude: 2.45, longitude: 7.6),
              PointCoordinates(latitude: 93.3, longitude: 9.4),
              PointCoordinates(latitude: 14.6, longitude: 57.1),
              PointCoordinates(latitude: 16.8, longitude: 67.4),
            ]),
          ]),
          name: name,
        ),
      );
      final json = <String, dynamic>{
        'type': GeoJsonType.feature.name.pascalCase,
        'properties': {'name': name},
        'geometry': {
          'type': GeoJsonGeometryType.polygon.name.pascalCase,
          'coordinates': [
            [
              <double>[10.1, 99.9],
              <double>[23.4, 87.6, 0.05],
              <double>[10.1, 99.9],
            ],
            [
              <double>[67.4, 16.8],
              <double>[7.6, 2.45],
              <double>[9.4, 93.3],
              <double>[57.1, 14.6],
              <double>[67.4, 16.8],
            ],
          ],
        },
      };
      expect(polygon.toJson(), json);
      expect(polygon, GeoJsonFeature.fromJson(json));
    });

    test('MultiPolygonF', () {
      final name = 'multi polygon feature';
      final multiPolygon = GeoJsonFeature<GeoJsonMultiPolygon>(
        geometry: GeoJsonMultiPolygon(
          coordinates: MultiPolygonCoordinates([
            PolygonCoordinates([
              LineCoordinates([
                PointCoordinates(latitude: 99.9, longitude: 10.1),
                PointCoordinates(latitude: 87.6, longitude: 23.4, altitude: 0.05),
                PointCoordinates(latitude: 99.9, longitude: 10.1),
              ]),
              LineCoordinates([
                PointCoordinates(latitude: 16.8, longitude: 67.4),
                PointCoordinates(latitude: 2.45, longitude: 7.6),
                PointCoordinates(latitude: 93.3, longitude: 9.4),
                PointCoordinates(latitude: 14.6, longitude: 57.1),
                PointCoordinates(latitude: 16.8, longitude: 67.4),
              ]),
            ]),
            PolygonCoordinates([
              LineCoordinates([
                PointCoordinates(latitude: 99.9, longitude: 10.1),
                PointCoordinates(latitude: 87.6, longitude: 23.4, altitude: 0.05),
                PointCoordinates(latitude: 99.9, longitude: 10.1),
              ]),
              LineCoordinates([
                PointCoordinates(latitude: 16.8, longitude: 67.4),
                PointCoordinates(latitude: 2.45, longitude: 7.6),
                PointCoordinates(latitude: 93.3, longitude: 9.4),
                PointCoordinates(latitude: 14.6, longitude: 57.1),
                PointCoordinates(latitude: 16.8, longitude: 67.4),
              ]),
            ]),
          ]),
          name: name,
        ),
      );
      final json = <String, dynamic>{
        'type': GeoJsonType.feature.name.pascalCase,
        'properties': {'name': name},
        'geometry': {
          'type': GeoJsonGeometryType.multiPolygon.name.pascalCase,
          'coordinates': [
            [
              [
                <double>[10.1, 99.9],
                <double>[23.4, 87.6, 0.05],
                <double>[10.1, 99.9],
              ],
              [
                <double>[67.4, 16.8],
                <double>[7.6, 2.45],
                <double>[9.4, 93.3],
                <double>[57.1, 14.6],
                <double>[67.4, 16.8],
              ]
            ],
            [
              [
                <double>[10.1, 99.9],
                <double>[23.4, 87.6, 0.05],
                <double>[10.1, 99.9],
              ],
              [
                <double>[67.4, 16.8],
                <double>[7.6, 2.45],
                <double>[9.4, 93.3],
                <double>[57.1, 14.6],
                <double>[67.4, 16.8],
              ]
            ],
          ],
        },
      };
      expect(multiPolygon.toJson(), json);
      expect(multiPolygon, GeoJsonFeature.fromJson(json));
    });

    test('GCollectionF', () {
      final name = 'geometries collection';
      final name1 = 'point';
      final name2 = 'multi point';
      final collection = GeoJsonFeature<GeoJsonGeometryCollection>(
        geometry: GeoJsonGeometryCollection(
          name: name,
          geometries: [
            GeoJsonPoint(
              coordinates: PointCoordinates(latitude: 99.9, longitude: 10.1),
              name: name1,
            ),
            GeoJsonMultiPoint(
              coordinates: MultiPointCoordinates([
                PointCoordinates(latitude: 99.9, longitude: 10.1),
                PointCoordinates(latitude: 87.6, longitude: 23.4, altitude: 0.05),
              ]),
              name: name2,
            ),
          ],
        ),
      );
      final json = <String, dynamic>{
        'type': GeoJsonType.feature.name.pascalCase,
        'properties': {'name': name},
        'geometry': {
          'type': GeoJsonGeometryType.geometryCollection.name.pascalCase,
          'geometries': [
            {
              'type': GeoJsonGeometryType.point.name.pascalCase,
              'coordinates': <double>[10.1, 99.9],
            },
            {
              'type': GeoJsonGeometryType.multiPoint.name.pascalCase,
              'coordinates': [
                <double>[10.1, 99.9],
                <double>[23.4, 87.6, 0.05]
              ],
            },
          ],
        },
      };
      expect(collection.toJson(), json);
      expect(collection, GeoJsonFeature.fromJson(json));
    });
  });

  group('Features collection tests', () {
    setUp(() {
      // Additional setup goes here.
    });

    test('Feature collection', () {
      final f1name = 'point';
      final f2name = 'line';
      final featureCollection = GeoJsonFeatureCollection(
        features: [
          GeoJsonFeature<GeoJsonPoint>(
            geometry: GeoJsonPoint(
              coordinates: PointCoordinates(latitude: 99.9, longitude: 10.1),
              name: f1name,
            ),
          ),
          GeoJsonFeature<GeoJsonLine>(
            geometry: GeoJsonLine(
              coordinates: LineCoordinates([
                PointCoordinates(latitude: 99.9, longitude: 10.1),
                PointCoordinates(latitude: 87.6, longitude: 23.4, altitude: 0.05),
              ]),
              name: f2name,
            ),
          )
        ],
      );
      final json = <String, dynamic>{
        'type': GeoJsonType.featureCollection.name.pascalCase,
        'features': [
          {
            'type': GeoJsonType.feature.name.pascalCase,
            'properties': {'name': f1name},
            'geometry': {
              'type': GeoJsonGeometryType.point.name.pascalCase,
              'coordinates': <double>[10.1, 99.9],
            },
          },
          {
            'type': GeoJsonType.feature.name.pascalCase,
            'properties': {'name': f2name},
            'geometry': {
              'type': GeoJsonGeometryType.line.name.pascalCase,
              'coordinates': [
                <double>[10.1, 99.9],
                <double>[23.4, 87.6, 0.05],
              ],
            },
          },
        ],
      };
      expect(featureCollection.toJson(), json);
      expect(featureCollection, GeoJsonFeatureCollection.fromJson(json));
    });
  });

  group('GeoJson tests', () {
    setUp(() {
      // Additional setup goes here.
    });

    test('GeoJson - single feature', () {
      final name = 'point';
      final geoJson = GeoJson(
        feature: GeoJsonFeature<GeoJsonPoint>(
          geometry: GeoJsonPoint(
            coordinates: PointCoordinates(latitude: 99.9, longitude: 10.1),
            name: name,
          ),
        ),
      );
      final json = <String, dynamic>{
        'type': GeoJsonType.feature.name.pascalCase,
        'properties': {'name': name},
        'geometry': {
          'type': GeoJsonGeometryType.point.name.pascalCase,
          'coordinates': <double>[10.1, 99.9],
        },
      };
      expect(geoJson.toJson(), json);
      expect(geoJson, GeoJson.fromJson(json));
    });

    test('GeoJson - Feature collection', () {
      final f1name = 'point';
      final f2name = 'line';
      final geoJson = GeoJson(
        featureCollection: GeoJsonFeatureCollection(
          features: [
            GeoJsonFeature<GeoJsonPoint>(
              geometry: GeoJsonPoint(
                coordinates: PointCoordinates(latitude: 99.9, longitude: 10.1),
                name: f1name,
              ),
            ),
            GeoJsonFeature<GeoJsonLine>(
              geometry: GeoJsonLine(
                coordinates: LineCoordinates([
                  PointCoordinates(latitude: 99.9, longitude: 10.1),
                  PointCoordinates(latitude: 87.6, longitude: 23.4, altitude: 0.05),
                ]),
                name: f2name,
              ),
            )
          ],
        ),
      );
      final json = <String, dynamic>{
        'type': GeoJsonType.featureCollection.name.pascalCase,
        'features': [
          {
            'type': GeoJsonType.feature.name.pascalCase,
            'properties': {'name': f1name},
            'geometry': {
              'type': GeoJsonGeometryType.point.name.pascalCase,
              'coordinates': <double>[10.1, 99.9],
            },
          },
          {
            'type': GeoJsonType.feature.name.pascalCase,
            'properties': {'name': f2name},
            'geometry': {
              'type': GeoJsonGeometryType.line.name.pascalCase,
              'coordinates': [
                <double>[10.1, 99.9],
                <double>[23.4, 87.6, 0.05],
              ],
            },
          },
        ],
      };
      expect(geoJson.toJson(), json);
      expect(geoJson, GeoJson.fromJson(json));
    });
  });
}
