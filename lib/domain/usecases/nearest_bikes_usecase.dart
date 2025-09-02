import 'dart:async';
import 'dart:math' as math;

import 'package:appli_r/domain/entities/voi_vehicule.dart';
import 'package:appli_r/domain/entities/location/position.dart';
import 'package:appli_r/domain/repositories/location_repository.dart';
import 'package:appli_r/domain/repositories/bikes_repository.dart';

class WatchNearestVehiclesUseCase {
  final BikesRepository _bikesRepository;
  final LocationRepository _locationRepository;

  /// Nombre de véhicules à renvoyer (0 = pas de limite)
  final int defaultLimit;

  WatchNearestVehiclesUseCase(
    this._bikesRepository,
    this._locationRepository, {
    this.defaultLimit = 5,
  });

  /// Combine les deux streams :
  /// - à chaque nouvelle position OU nouvelle liste de véhicules,
  ///   on renvoie une liste triée par distance croissante.
  ///
  /// `bikesPeriod` est passé tel quel au repo (si implémente un polling).
  Stream<List<VoiVehicule>> watch({int? limit, Duration? bikesPeriod}) {
    final effectiveLimit = limit ?? defaultLimit;

    final location$ = _locationRepository.watchLocation(5);
    final bikes$ = _bikesRepository.watchVoiVehicules(
      period: bikesPeriod ?? const Duration(seconds: 30),
    );

    late final StreamController<List<VoiVehicule>> controller;
    StreamSubscription<Location>? locSub;
    StreamSubscription<Set<VoiVehicule>>? bikesSub;

    Location? _lastLoc;
    Set<VoiVehicule>? _lastBikes;

    void emitIfReady() {
      if (_lastLoc == null || _lastBikes == null) return;

      final loc = _lastLoc!;
      final sorted = _lastBikes!.toList()
        ..sort((a, b) {
          final da = _distanceMeters(loc, a);
          final db = _distanceMeters(loc, b);
          return da.compareTo(db);
        });

      final out = (effectiveLimit != 0)
          ? sorted.take(effectiveLimit).toList()
          : sorted;

      if (!controller.isClosed) {
        controller.add(out);
      }
    }

    controller = StreamController<List<VoiVehicule>>.broadcast(
      onListen: () {
        locSub = location$.listen((loc) {
          _lastLoc = loc;
          emitIfReady();
        }, onError: controller.addError);

        bikesSub = bikes$.listen((bikes) {
          _lastBikes = bikes;
          emitIfReady();
        }, onError: controller.addError);
      },
      onCancel: () async {
        await locSub?.cancel();
        await bikesSub?.cancel();
      },
    );

    return controller.stream;
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
