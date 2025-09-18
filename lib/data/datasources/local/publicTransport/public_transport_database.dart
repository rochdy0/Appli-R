import 'package:appli_r/data/datasources/local/publicTransport/tables.dart';
import 'package:appli_r/utils/copy_asset_to_directory.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'public_transport_database.g.dart'; // Généré automatiquement

@DriftDatabase(
  tables: [
    Agency,
    CalendarDates,
    FareAttributes,
    Routes,
    RouteStop,
    Shapes,
    StopTimes,
    Stops,
    Trips,
  ],
)
class TestDatabase extends _$TestDatabase {
  TestDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<List<AgencyData>> getAgences() => select(agency).get();

  Future<List<String>> getReseauxByAgence(String agenceId) async {
    final req = (selectOnly(routes, distinct: true)
      ..addColumns([routes.networkId])
      ..where(routes.agencyId.equals(agenceId)));

    final rows = await req.get();

    // Ici tu récupères la valeur de la colonne
    return rows.map((row) => row.read(routes.networkId)!).toList();
  }

  Future<List<Route>> getLignesByReseau(String reseauId) =>
      (select(routes)..where((r) => r.networkId.equals(reseauId))).get();

  Future<List<Route>> getLignesByReseaux(Set<String> reseauIds) =>
      (select(routes)..where((r) => r.networkId.isIn(reseauIds))).get();

  Future<List<Shape>> getLinesShapesByLines(Set<String> prefixes) async {
    final placeholders = List.filled(prefixes.length, '?').join(',');
    final query =
        '''
    WITH prefixes AS (
      SELECT rtrim(rtrim(shape_id, '0123456789'), '_') AS prefix,
             shape_id
      FROM shapes
    ),
    latest AS (
      SELECT prefix, MAX(shape_id) AS last_shape_id
      FROM prefixes
      WHERE prefix IN ($placeholders)
      GROUP BY prefix
    )
    SELECT s.*
    FROM shapes s
    JOIN latest l ON s.shape_id = l.last_shape_id
    ORDER BY s.shape_id, s.shape_pt_sequence;
  ''';

    final rows = await customSelect(
      query,
      variables: prefixes.map((p) => Variable<String>(p)).toList(),
      readsFrom: {shapes},
    ).get();

    return rows.map((row) => shapes.map(row.data)).toList();
  }

  Future<List<Stop>> getArretsByReseaux(Set<String> reseauxIds) {
    final base = select(stops, distinct: true).join([
      innerJoin(routeStop, routeStop.stopId.equalsExp(stops.stopId)),
      innerJoin(routes, routes.routeId.equalsExp(routeStop.routeId)),
    ]);
    base.where(routes.networkId.isIn(reseauxIds));
    base.where(stops.parentStation.isNull());

    return base.map((row) => row.readTable(stops)).get();
  }

  Future<List<Stop>> getArretsByCoord(
    double minLat,
    double maxLat,
    double minLon,
    double maxLon,
  ) =>
      (select(stops, distinct: true)..where(
            (tbl) =>
                tbl.stopLat.isBetweenValues(minLat, maxLat) &
                tbl.stopLon.isBetweenValues(minLon, maxLon) &
                tbl.parentStation.isNull(),
          ))
          .get();

  Future<Set<Route>> getLignesByArretAndReseaux(
    String stopName,
    Set<String> reseauxIds,
  ) async {
    // routes <- trips <- stop_times (filtre sur l’arrêt)
    final q = (select(routes, distinct: true)).join([
      innerJoin(routeStop, routeStop.routeId.equalsExp(routes.routeId)),
      innerJoin(stops, stops.stopId.equalsExp(routeStop.stopId)),
    ]);
    q.where(stops.stopName.equals(stopName));
    q.where(routes.networkId.isIn(reseauxIds));

    final rows = await q.map((row) => row.readTable(routes)).get();
    return rows.toSet(); // sécurité doublons côté Dart aussi
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final dbPath = p.join(dbFolder.path, 'test2.sqlite');
    File file = File(dbPath);
    if (!await file.exists()) {
      copyAssetToFile('test2.sqlite', FilePersistence.persistent);
      file = File(dbPath);
    }
    return NativeDatabase.createInBackground(file);
  });
}
