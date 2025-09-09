import 'dart:async';

import 'package:appli_r/data/models/public_transport_timetable_arret.dart';
import 'package:appli_r/domain/entities/publicTransport/arret.dart';
import 'package:appli_r/domain/entities/publicTransport/ligne.dart';
import 'package:appli_r/domain/entities/publicTransport/nearest.dart';
import 'package:appli_r/domain/repositories/public_transport_repository.dart';
import 'package:appli_r/domain/usecases/nearest_stops_usecase.dart';
import 'package:rxdart/rxdart.dart';

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

  Stream<NearRealtimeEvent> watchNearestArretsAllLinesRealtime() =>
     _watchNearestStopsUseCase.watch().switchMap(
      (nearestList) => Rx.merge<NearRealtimeEvent>([
        Stream.value(NearestChanged(nearestList)),
        ...nearestList.map(
          (n) => _publicTransportRepository
              .watchArretsTimeTable(n.arret, n.ligne)
              .where((rt) => rt.directions.isNotEmpty)
              .map<NearRealtimeEvent>(
                (rt) => TimetableUpdated(
                  arret: n.arret,
                  ligne: n.ligne,
                  realtime: rt,
                ),
              ),
        ),
      ]),
    );
}
