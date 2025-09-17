import 'dart:async';

import 'package:appli_r/domain/entities/publicTransport/ligne.dart';
import 'package:appli_r/domain/entities/publicTransport/ligne_shape.dart';
import 'package:appli_r/domain/repositories/preferences_repository.dart';
import 'package:appli_r/domain/repositories/public_transport_repository.dart';
import 'package:rxdart/rxdart.dart';

class WatchLinesShapesFromFavouriteNetworks {
  final PublicTransportRepository _publicTransportRepository;
  final PreferencesRepository _preferencesRepository;

  WatchLinesShapesFromFavouriteNetworks(
    this._publicTransportRepository,
    this._preferencesRepository,
  );

Stream<Set<LigneShape>> watch() {
    return _preferencesRepository.watchNetworkPreferences()
        .map((prefs) => prefs.map((e) => e.id).toSet())
        .distinct((a, b) => a.containsAll(b) && b.containsAll(a))
        .scan<Future<Set<LigneShape>>>(
          (acc, reseauxIds, _) async {
            return _updateShapes(await acc, reseauxIds);
          },
          Future.value(<LigneShape>{}),
        )
        .asyncExpand((future) => Stream.fromFuture(future));
  }

  Future<Set<LigneShape>> _updateShapes(
    Set<LigneShape> currentShapes,
    Set<String> reseauxIds,
  ) async {
    final currentIds = currentShapes.map((l) => l.id).toSet();

    // Charger les nouvelles lignes selon préférences
    final newLignes = reseauxIds.isEmpty
        ? <Ligne>{}
        : await _publicTransportRepository.loadLignesByReseaux(reseauxIds);

    final newIds = newLignes.map((l) => l.id).toSet();
    final diff = newIds.difference(currentIds);

    if (diff.isEmpty) {
      // Cas suppression → on garde seulement celles encore valides
      return currentShapes.where((l) => newIds.contains(l.id)).toSet();
    } else {
      // Cas ajout → charger seulement les shapes manquantes
      final diffLignes = newLignes.where((l) => diff.contains(l.id)).toSet();
      final diffShapes =
          await _publicTransportRepository.loadLigneShapesByLignes(diffLignes);
      return currentShapes.union(diffShapes);
    }
  }
}
