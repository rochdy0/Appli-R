import 'dart:async';

import 'package:appli_r/data/models/public_transport_timetable_arret.dart';
import 'package:appli_r/domain/entities/publicTransport/arret.dart';
import 'package:appli_r/domain/entities/publicTransport/ligne.dart';
import 'package:appli_r/domain/entities/publicTransport/nearest.dart';
import 'package:appli_r/domain/entities/publicTransport/reseau.dart';
import 'package:appli_r/domain/repositories/public_transport_repository.dart';
import 'package:appli_r/domain/usecases/nearest_stops_usecase.dart';

sealed class NearRealtimeEvent {
  const NearRealtimeEvent();
}

class NearestChanged extends NearRealtimeEvent {
  final List<Nearest> nearest;
  const NearestChanged(this.nearest);
}

class TimetableUpdated extends NearRealtimeEvent {
  final Ligne ligne;
  final Arret arret;
  final RealTimeResponseModel realtime;
  const TimetableUpdated({
    required this.ligne,
    required this.arret,
    required this.realtime,
  });
}

class NearestArretsAllLinesRealtimeUseCase {
  final PublicTransportRepository _publicTransportRepository;

  final WatchNearestStopsUseCase _watchNearestStopsUseCase;

  NearestArretsAllLinesRealtimeUseCase(
    this._publicTransportRepository,
    this._watchNearestStopsUseCase,
  );

  Stream<NearRealtimeEvent> watchNearestArretsAllLinesRealtime({
  required Set<Reseau> reseaux,
  required int distanceMeters,
}) {
  final controller = StreamController<NearRealtimeEvent>.broadcast();

  StreamSubscription<List<Nearest>>? nearSub;

  // key = "arretCode|agenceId|ligneId" pour être sûr d’éviter les collisions
  final subsByKey = <String, StreamSubscription<RealTimeResponseModel>>{};

  String key(Nearest n) => '${n.arret.code}|${n.ligne.agenceId}|${n.ligne.id}';

  Future<void> attach(Nearest n) async {
    final k = key(n);
    if (subsByKey.containsKey(k)) return;
    final sub = _publicTransportRepository
        .watchArretsTimeTable(n.arret, n.ligne)
        .listen(
      (rt) {
        if (!controller.isClosed) {
          controller.add(TimetableUpdated(
            arret: n.arret,
            ligne: n.ligne,
            realtime: rt,
          ));
        }
      },
      onError: (e, st) {
        if (!controller.isClosed) controller.addError(e, st);
      },
    );
    subsByKey[k] = sub;
  }

  Future<void> detachKey(String k) async {
    final sub = subsByKey.remove(k);
    if (sub != null) await sub.cancel();
  }

  Future<void> cleanup() async {
    await nearSub?.cancel();
    await Future.wait(subsByKey.values.map((s) => s.cancel()));
    subsByKey.clear();
  }

  controller.onListen = () {
    nearSub = _watchNearestStopsUseCase
        .watch(reseaux: reseaux, distanceMeters: distanceMeters)
        .listen(
      (nearestList) async {
        if (!controller.isClosed) controller.add(NearestChanged(nearestList));

        final newKeys = nearestList.map(key).toSet();
        final oldKeys = subsByKey.keys.toSet();

        // Détacher ce qui n’est plus dans le top proche
        final removed = oldKeys.difference(newKeys);
        if (removed.isNotEmpty) {
          await Future.wait(removed.map(detachKey));
        }

        // Attacher les nouvelles paires
        final added = newKeys.difference(oldKeys);
        if (added.isNotEmpty) {
          final byKey = {for (final n in nearestList) key(n): n};
          for (final k in added) {
            final n = byKey[k];
            if (n != null) await attach(n);
          }
        }
      },
      onError: (e, st) {
        if (!controller.isClosed) controller.addError(e, st);
      },
    );
  };

  controller.onCancel = () async {
    // broadcast: onCancel est appelé quand le dernier abonné part
    if (!controller.hasListener) {
      await cleanup();
      // Ne pas close si tu veux pouvoir réutiliser ce stream plus tard.
      // await controller.close(); // <- active si tu veux un stream one-shot
    }
  };

  return controller.stream;
}

}
