import 'dart:async';

import 'package:appli_r/domain/entities/location/position.dart';
import 'package:appli_r/domain/entities/publicTransport/arret.dart';
import 'package:appli_r/domain/entities/publicTransport/nearest.dart';
import 'package:appli_r/domain/entities/publicTransport/reseau.dart';
import 'package:appli_r/domain/repositories/location_repository.dart';
import 'package:appli_r/domain/repositories/public_transport_repository.dart';

class WatchNearestStopsUseCase {
  final LocationRepository _locationRepository;
  final PublicTransportRepository _publicTransportRepository;

  /// Nombre d’arrêts à renvoyer (0 = pas de limite)
  final int defaultLimit;

  WatchNearestStopsUseCase(
    this._locationRepository,
    this._publicTransportRepository, {
    this.defaultLimit = 10,
  });

  Stream<List<Nearest>> watch({
    required Set<Reseau> reseaux,
    required int distanceMeters,
    int? limit,
  }) {
    final effectiveLimit = limit ?? defaultLimit;

    late final StreamController<List<Nearest>> controller;

    final location$ = _locationRepository.watchLocation(30);
    StreamSubscription<Location>? locSub;

    Location? lastLoc;

    Future<void> emitIfReady(Location loc) async {
      if (lastLoc == null) return;

      try {
        final arrets = await _publicTransportRepository
            .loadArretsAProximiteByReseaux(
              loc.latitude,
              loc.longitude,
              reseaux,
              distanceMeters,
            );

        final out = (effectiveLimit != 0)
            ? arrets.take(effectiveLimit).toList()
            : arrets;

        if (!controller.isClosed) {
          controller.add(out);
        }
      } catch (e, st) {
        if (!controller.isClosed) controller.addError(e, st);
      }
    }

    controller = StreamController<List<Nearest>>.broadcast(
      onListen: () {
        locSub = location$.listen(
          (loc) {
            lastLoc = loc;
            // ignore: unawaited_futures
            emitIfReady(loc);
          },
          onError: (e, st) {
            if (!controller.isClosed) controller.addError(e, st);
          },
        );
      },
      onCancel: () async {
        await locSub?.cancel();
      },
    );

    return controller.stream;
  }
}