import 'dart:async';
import 'package:appli_r/domain/entities/publicTransport/arret.dart';
import 'package:appli_r/domain/entities/publicTransport/ligne.dart';
import 'package:appli_r/domain/entities/publicTransport/ligne_shape.dart';
import 'package:appli_r/domain/repositories/public_transport_repository.dart';
import 'package:appli_r/domain/usecases/lines_from_favourite_networks.dart';
import 'package:appli_r/domain/usecases/stops_from_favourite_networks.dart';
import 'package:flutter/foundation.dart';

class PublicTransportMapViewmodel with ChangeNotifier {
  final PublicTransportRepository _publicTransportRepository;
  final WatchLinesFromFavouriteNetworks _linesFromFavouriteNetworks;
  final WatchStopsFromFavouriteNetworks _stopsFromFavouriteNetworks;
  PublicTransportMapViewmodel(
    this._publicTransportRepository,
    this._linesFromFavouriteNetworks,
    this._stopsFromFavouriteNetworks,
  ) {
    start();
  }

  StreamSubscription<Set<Ligne>>? _lineFavSub;
  StreamSubscription<Set<Arret>>? _stopFavSub;

  String? _error;
  bool _loading = false;
  Set<Ligne>? _lignes;
  Set<LigneShape>? _lignesShapes;
  Set<Arret>? _arrets;
  Set<Ligne>? get lignes => _lignes;
  Set<LigneShape>? get lignesShapes => _lignesShapes;
  Set<Arret>? get arrets => _arrets;
  String? get error => _error;
  bool get loading => _loading;

  Future<void> start() async {
    _loading = true;
    _error = null;
    notifyListeners();

    _lineFavSub?.cancel();
    _lineFavSub = _linesFromFavouriteNetworks.watch().listen(
      (lines) async {
        _lignes = lines;
        _lignesShapes = await _publicTransportRepository
            .loadLigneShapesByLignes(lines);
        notifyListeners();
      },
      onError: (e) {
        _error = 'watchLocation: $e';
        notifyListeners();
      },
    );

     _stopFavSub?.cancel();
    _stopFavSub = _stopsFromFavouriteNetworks.watch().listen(
      (stops) {
        _arrets = stops;
        notifyListeners();
      },
      onError: (e) {
        _error = 'watchLocation: $e';
        notifyListeners();
      },
    );

    _loading = false;
    notifyListeners();
  }

  Future<void> stop() async {
    await _lineFavSub?.cancel();
    await _stopFavSub?.cancel();
    _lineFavSub = null;
    _stopFavSub = null;
  }

  @override
  void dispose() {
    stop();
    super.dispose();
  }
}
