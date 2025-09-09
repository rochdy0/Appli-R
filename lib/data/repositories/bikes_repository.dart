import 'dart:async';

import 'package:appli_r/data/datasources/network/voi_api.dart';
import 'package:appli_r/data/mappers/bikes_mappers.dart';
import 'package:appli_r/domain/entities/voi_vehicule.dart';
import 'package:appli_r/domain/repositories/bikes_repository.dart';
import 'package:rxdart/rxdart.dart';

class BikesRepositoryImpl implements BikesRepository {
  final VoiApi _voiApi;

  BikesRepositoryImpl(this._voiApi);

  @override
  Future<Set<VoiVehicule>> getVoiVehicules() async {
    try {
      final result = await _voiApi.fetchVehicle();
      return result.map((vehicle) => vehicle.toDomain()).toSet();
    } catch (e, stack) {
      print("Erreur dans getVoiVehicules: $e");
      print(stack);
      return {};
    }
  }

  @override
  Stream<Set<VoiVehicule>> watchVoiVehicules() {
    return Stream<void>.periodic(const Duration(seconds: 30))
        .startWith(null)
        .exhaustMap(
          (_) => Stream.fromFuture(
            getVoiVehicules(),
          ).onErrorResume((_, _) => const Stream<Set<VoiVehicule>>.empty()),
        )
        /*         .distinct((a, b) => a == b) */
        .shareReplay(maxSize: 1);
  }
}
