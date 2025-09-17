import 'dart:async';

import 'package:appli_r/domain/entities/publicTransport/ligne.dart';
import 'package:appli_r/domain/repositories/preferences_repository.dart';
import 'package:appli_r/domain/repositories/public_transport_repository.dart';

class WatchLinesFromFavouriteNetworks {
  final PublicTransportRepository _publicTransportRepository;
  final PreferencesRepository _preferencesRepository;

  WatchLinesFromFavouriteNetworks(
    this._publicTransportRepository,
    this._preferencesRepository,
  );

  Stream<Set<Ligne>> watch() =>
      _preferencesRepository.watchNetworkPreferences()
      .map((data) => data.map((e) => e.id).toSet())
      .distinct((a, b) => a.containsAll(b) && b.containsAll(a))
      .asyncMap(
        (reseauxIds) => reseauxIds.isEmpty  ? Future.value(<Ligne>{})  : _publicTransportRepository.loadLignesByReseaux(
          reseauxIds
        ),
      );
}
