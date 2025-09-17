import 'dart:async';
import 'dart:math' as math;

import 'package:appli_r/domain/entities/nearest_voi_vehicule.dart';
import 'package:appli_r/domain/entities/voi_vehicule.dart';
import 'package:appli_r/domain/entities/location/position.dart';
import 'package:appli_r/domain/repositories/location_repository.dart';
import 'package:appli_r/domain/repositories/bikes_repository.dart';
import 'package:rxdart/rxdart.dart';

class WatchNearestVehiclesUseCase {
  final BikesRepository _bikesRepository;
  final LocationRepository _locationRepository;

  final int defaultLimit;

  WatchNearestVehiclesUseCase(
    this._bikesRepository,
    this._locationRepository, {
    this.defaultLimit = 5,
  });

  Stream<List<NearestVoiVehicule>> watch() {
    return Rx.combineLatest2(
      _locationRepository.watchLocation(5),
      _bikesRepository.watchVoiVehicules(),
      (loc, bikes) =>
          (bikes.toList()..sort(
                (a, b) =>
                    _distanceMeters(loc, a).compareTo(_distanceMeters(loc, b)),
              ))
              .take(defaultLimit)
              .map((b) => NearestVoiVehicule.fromVoiVehicule(b, distance: _distanceMeters(loc, b)))
              .toList(),
    );
  }

  /// Haversine rapide (approx. m)
  static double _distanceMeters(Location loc, VoiVehicule v) {
    final lat1 = loc.latitude;
    final lon1 = loc.longitude;

    // Adapte ces champs aux tiens (ex: v.lat / v.lon).
    final lat2 = v.lat;
    final lon2 = v.lon;

    const R = 6371000.0; // rayon Terre en mètres
    final dLat = _deg2rad(lat2 - lat1);
    final dLon = _deg2rad(lon2 - lon1);
    final a =
        math.sin(dLat / 2) * math.sin(dLat / 2) +
        math.cos(_deg2rad(lat1)) *
            math.cos(_deg2rad(lat2)) *
            math.sin(dLon / 2) *
            math.sin(dLon / 2);
    final c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));
    return R * c;
  }

  static double _deg2rad(double d) => d * math.pi / 180.0;
}
