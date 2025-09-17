import 'dart:async';
import 'dart:math' as math;

import 'package:appli_r/data/datasources/local/publicTransport/public_transport_database.dart';
import 'package:appli_r/data/datasources/network/public_transport_api.dart';
import 'package:appli_r/data/mappers/public_transport_mappers.dart';
import 'package:appli_r/data/models/public_transport_timetable_arret.dart';
import 'package:appli_r/domain/entities/publicTransport/agence.dart';
import 'package:appli_r/domain/entities/publicTransport/arret.dart';
import 'package:appli_r/domain/entities/publicTransport/ligne.dart';
import 'package:appli_r/domain/entities/publicTransport/ligne_shape.dart';
import 'package:appli_r/domain/entities/publicTransport/nearest.dart';
import 'package:appli_r/domain/entities/publicTransport/reseau.dart';
import 'package:appli_r/domain/repositories/public_transport_repository.dart';
import 'package:rxdart/rxdart.dart';

class PublicTransportRepositoryImpl implements PublicTransportRepository {
  final TestDatabase _db;
  final PublicTransportApi _publicTransportApi;

  PublicTransportRepositoryImpl(this._db, this._publicTransportApi);

  @override
  Future<Set<Agence>> loadAgences() async {
    try {
      final result = await _db.getAgences();
      return result.map((agenceData) => agenceData.toDomain()).toSet();
    } catch (e, stack) {
      print("Erreur dans loadAgences: $e");
      print(stack);
      return {};
    }
  }

  @override
  Future<Set<Reseau>> loadReseauxByAgence(Agence agence) async {
    try {
      final results = await _db.getReseauxByAgence(agence.id);

      return results.map((r) => ReseauMapper.fromData(r)).toSet();
    } catch (e, stack) {
      print("Erreur dans loadReseauxByAgence: $e");
      print(stack);
      return {};
    }
  }

  @override
  Future<Set<Ligne>> loadLignesByReseau(Reseau reseau) async {
    try {
      final results = await _db.getLignesByReseau(reseau.id);

      return results.map((r) => r.toDomain()).toSet();
    } catch (e, stack) {
      print("Erreur dans loadLignesByReseau: $e");
      print(stack);
      return {};
    }
  }

  @override
  Future<Set<Ligne>> loadLignesByReseaux(Set<String> reseauIds) async {
    try {
      final results = await _db.getLignesByReseaux(reseauIds);

      return Set.unmodifiable(results.map((r) => r.toDomain()));
    } catch (e, stack) {
      print("Erreur dans loadLignesByReseau: $e");
      print(stack);
      return {};
    }
  }

  @override
  Future<Set<LigneShape>> loadLigneShapesByLignes(Set<Ligne> lignes) async {
    try {
      final Set<LigneShape> shapes = {};
      for (final ligne in lignes) {
        final results = await _db.getLigneShapeByLigne(ligne.name, ligne.agenceId);
        final shape = LigneShapeMapper.fromData(
          ligne.id,
          ligne.name,
          ligne.color,
          results,
        );
        shapes.add(shape);
      }
      if (shapes.isEmpty)
        throw Exception("fetchLigneShapesByLigne retourne une liste vide");
        print("finiiii");
      return shapes;
    } catch (e, stack) {
      print("Erreur dans loadLigneShapesByLigne: $e");
      print(stack);
      return {};
    }
  }

  @override
  Future<Set<Arret>> loadArretsByReseaux(Set<String> reseauxIds) async {
    try {
      final results = await _db.getArretsByReseaux(reseauxIds);

      return results.map((r) => r.toDomain()).toSet();
    } catch (e, stack) {
      print("Erreur dans loadArretsByReseau: $e");
      print(stack);
      return {};
    }
  }

  @override
  Future<List<Nearest>> loadArretsAProximiteByReseaux(
    double latitude,
    double longitude,
    Set<Reseau> reseaux,
    int distance,
  ) async {
    if (reseaux.isEmpty) return [];
    final reseauxIds = reseaux.map((r) => r.id).toSet();
    const metersPerDegree = 111_000.0;
    final delta = distance / metersPerDegree;
    final cosLat = math.cos(latitude * math.pi / 180.0);

    final minLat = latitude - delta;
    final maxLat = latitude + delta;
    final minLon = longitude - delta;
    final maxLon = longitude + delta;

    double dist2Meters(Stop s) {
      final dLatM = (s.stopLat - latitude) * metersPerDegree;
      final dLonM =
          (s.stopLon - longitude) *
          metersPerDegree *
          cosLat; // compensation longitude
      return dLatM * dLatM + dLonM * dLonM;
    }

    try {
      final result = await _db.getArretsByCoord(minLat, maxLat, minLon, maxLon);
      result.sort((a, b) => dist2Meters(a).compareTo(dist2Meters(b)));
      final knownLignes = <String>{};
      List<Nearest> arretsAProximite = [];
      for (final stop in result) {
        final res = await _db.getLignesByArretAndReseaux(
          stop.stopName,
          reseauxIds,
        );
        for (final route in res) {
          if (knownLignes.add(route.routeId)) {
            arretsAProximite.add(Nearest(stop.toDomain(), route.toDomain()));
          }
        }
      }
      return arretsAProximite;
    } catch (e, stack) {
      print("Erreur dans loadArretsAProximiteByReseaux: $e");
      print(stack);
      return [];
    }
  }

  @override
  Stream<RealTimeResponseModel> watchArretsTimeTable(Arret arret, Ligne ligne) {
    return Stream<void>.periodic(const Duration(seconds: 30))
        .startWith(null)
        .exhaustMap(
          (_) =>
              Stream.fromFuture(
                _publicTransportApi.fetchPublicTransportTimeTable(
                  arret.code,
                  ligne.agenceId,
                  ligne.name,
                ),
              ).onErrorResume(
                (_, _) => const Stream<RealTimeResponseModel>.empty(),
              ),
        )
        .distinct((a, b) => a == b)
        .shareReplay(maxSize: 1);
  }
}
