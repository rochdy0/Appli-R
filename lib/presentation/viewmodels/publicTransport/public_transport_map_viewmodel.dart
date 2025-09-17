import 'dart:async';
import 'package:appli_r/domain/entities/publicTransport/arret.dart';
import 'package:appli_r/domain/entities/publicTransport/ligne.dart';
import 'package:appli_r/domain/entities/publicTransport/ligne_shape.dart';
import 'package:appli_r/domain/usecases/lines_shapes_from_favourite_networks.dart';
import 'package:appli_r/domain/usecases/stops_from_favourite_networks.dart';
import 'package:flutter/foundation.dart';

class PublicTransportMapViewmodel with ChangeNotifier {
  final WatchStopsFromFavouriteNetworks _stopsFromFavouriteNetworks;
  final WatchLinesShapesFromFavouriteNetworks _linesShapesFromFavouriteNetworks;
  PublicTransportMapViewmodel(
    this._stopsFromFavouriteNetworks,
    this._linesShapesFromFavouriteNetworks,
  ) {
    start();
  }

  StreamSubscription<Set<LigneShape>>? _lineShapeFavSub;
  StreamSubscription<Set<Arret>>? _stopFavSub;

  String? _error;
  bool _loading = false;
  Set<LigneShape>? _lignesShapes;
  Set<Arret>? _arrets;
  Set<LigneShape>? get lignesShapes => _lignesShapes;
  Set<Arret>? get arrets => _arrets;
  String? get error => _error;
  bool get loading => _loading;

  Future<void> start() async {
    _loading = true;
    _error = null;
    notifyListeners();

    _lineShapeFavSub?.cancel();
    _lineShapeFavSub = _linesShapesFromFavouriteNetworks.watch().listen(
      (shapes) {
        _lignesShapes = shapes;
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
    await _lineShapeFavSub?.cancel();
    await _stopFavSub?.cancel();
    _lineShapeFavSub = null;
    _stopFavSub = null;
  }

  @override
  void dispose() {
    stop();
    super.dispose();
  }
}
