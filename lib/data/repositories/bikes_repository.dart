import 'dart:async';

import 'package:appli_r/data/datasources/network/voi_api.dart';
import 'package:appli_r/data/mappers/bikes_mappers.dart';
import 'package:appli_r/domain/entities/voi_vehicule.dart';
import 'package:appli_r/domain/repositories/bikes_repository.dart';

class BikesRepositoryImpl implements BikesRepository {
  final VoiApi _voiApi;
  final Duration _defaultPeriod;

  final _controller = StreamController<Set<VoiVehicule>>.broadcast();
  Timer? _timer;
  Set<VoiVehicule>? _last;

  BikesRepositoryImpl(
    this._voiApi, {
    Duration period = const Duration(seconds: 30),
  }) : _defaultPeriod = period;

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
  Stream<Set<VoiVehicule>> watchVoiVehicules({Duration? period}) {
    final p = period ?? _defaultPeriod;

    // Lazy start: on démarre le polling quand le 1er écouteur arrive
    if (!_controller.hasListener) {
      _startPolling(p);
    }

    return _controller.stream;
  }

  void _startPolling(Duration p) {
    // tick immédiat
    _tick();
    // périodique
    _timer?.cancel();
    _timer = Timer.periodic(p, (_) => _tick());
  }

  Future<void> _tick() async {
    try {
      final set = await getVoiVehicules();
      if (_last == null || !(_last! == set)) {
        _last = set;
        if (!_controller.isClosed) _controller.add(set);
      }
    } catch (e, s) {
      if (!_controller.isClosed) _controller.addError(e, s);
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.close();
  }
}
