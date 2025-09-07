import 'dart:async';

import 'package:appli_r/domain/entities/publicTransport/ligne.dart';
import 'package:appli_r/domain/entities/publicTransport/reseau.dart';
import 'package:appli_r/domain/repositories/preferences_repository.dart';
import 'package:appli_r/domain/repositories/public_transport_repository.dart';

class WatchLinesFromFavouriteNetworks {
  final PublicTransportRepository _publicTransportRepository;
  final PreferencesRepository _preferencesRepository;

  WatchLinesFromFavouriteNetworks(
    this._publicTransportRepository,
    this._preferencesRepository,
  );

  Stream<Set<Ligne>> watch() {
    final preference = _preferencesRepository.watchReseauPreferences();

    late final StreamController<Set<Ligne>> controller;
    StreamSubscription<Set<Reseau>>? prefSub;

    Set<Reseau>? lastPref;

    void emitIfReady() async {
      if (lastPref == null) return;
      final reseauIds = lastPref!.map((r) => r.id).toSet();
      final out = await _publicTransportRepository.loadLignesByReseaux(
        reseauIds,
      );

      if (!controller.isClosed) {
        controller.add(out);
      }
    }

    controller = StreamController<Set<Ligne>>.broadcast(
      onListen: () {
        prefSub = preference.listen((pref) {
          lastPref = pref;
          emitIfReady();
        }, onError: controller.addError);
      },
      onCancel: () async {
        await prefSub?.cancel();
      },
    );

    return controller.stream;
  }
}
