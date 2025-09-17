import 'dart:async';

import 'package:appli_r/domain/entities/publicTransport/arret.dart';
import 'package:appli_r/domain/repositories/preferences_repository.dart';
import 'package:appli_r/domain/repositories/public_transport_repository.dart';

class WatchStopsFromFavouriteNetworks {
  final PublicTransportRepository _publicTransportRepository;
  final PreferencesRepository _preferencesRepository;

  WatchStopsFromFavouriteNetworks(
    this._publicTransportRepository,
    this._preferencesRepository,
  );

  Stream<Set<Arret>> watch() =>
      _preferencesRepository.watchNetworkPreferences()
      .map((data) => data.map((e) => e.id).toSet())
      .distinct((a, b) => a.containsAll(b) && b.containsAll(a))
      .asyncMap(
        (reseauxIds) => reseauxIds.isEmpty  ? Future.value(<Arret>{})  : _publicTransportRepository.loadArretsByReseaux(
          reseauxIds
        ),
      );
}
