import 'dart:async';
import 'package:appli_r/domain/entities/publicTransport/ligne.dart';
import 'package:appli_r/domain/entities/publicTransport/ligne_shape.dart';
import 'package:appli_r/domain/repositories/public_transport_repository.dart';
import 'package:appli_r/domain/usecases/lines_from_favourite_networks.dart';
import 'package:flutter/foundation.dart';

class PublicTransportMapViewmodel with ChangeNotifier {
  final PublicTransportRepository _publicTransportRepository;
  final WatchLinesFromFavouriteNetworks _linesFromFavouriteNetworks;
  PublicTransportMapViewmodel(this._publicTransportRepository, this._linesFromFavouriteNetworks) {start();}

  StreamSubscription<Set<Ligne>>? _lineFavSub;
  
  String? _error;
  bool _loading = false;
  Set<Ligne>? _lignes;
  Set<LigneShape>? _lignesShapes;
  Set<Ligne>? get lignes => _lignes;
  Set<LigneShape>? get lignesShapes => _lignesShapes;
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
        _lignesShapes = await _publicTransportRepository.loadLigneShapesByLignes(lines);
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
    _lineFavSub = null;
  }

  @override
  void dispose() {
    stop();
    super.dispose();
  }
}
