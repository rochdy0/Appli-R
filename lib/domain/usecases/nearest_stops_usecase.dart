import 'dart:async';

import 'package:appli_r/domain/entities/publicTransport/nearest.dart';
import 'package:appli_r/domain/repositories/location_repository.dart';
import 'package:appli_r/domain/repositories/preferences_repository.dart';
import 'package:appli_r/domain/repositories/public_transport_repository.dart';
import 'package:rxdart/rxdart.dart';

class WatchNearestStopsUseCase {
  final LocationRepository _locationRepository;
  final PublicTransportRepository _publicTransportRepository;
  final PreferencesRepository _preferencesRepository;

  final int limit;
  final int distanceMeters;

  WatchNearestStopsUseCase(
    this._locationRepository,
    this._publicTransportRepository,
    this._preferencesRepository, {
    this.limit = 10,
    this.distanceMeters = 600,
  });

  Stream<List<Nearest>> watch() =>
      Rx.combineLatest2(
        _locationRepository.watchLocation(30),
        _preferencesRepository.watchReseauPreferences(),
        (loc, pref) => (loc, pref),
      ).asyncMap(
        (tuple) => _publicTransportRepository.loadArretsAProximiteByReseaux(
          tuple.$1.latitude,
          tuple.$1.longitude,
          tuple.$2,
          distanceMeters,
        ),
      );
}
