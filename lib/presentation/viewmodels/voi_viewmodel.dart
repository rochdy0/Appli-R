import 'dart:async';
import 'dart:collection';

import 'package:appli_r/domain/entities/voi_vehicule.dart';
import 'package:appli_r/domain/repositories/bikes_repository.dart';
import 'package:appli_r/domain/usecases/nearest_bikes_usecase.dart';
import 'package:flutter/foundation.dart';


class VoiViewModel extends ChangeNotifier {
  final BikesRepository repository;
  final WatchNearestVehiclesUseCase _watchNearestVehiclesUseCase;

  Set<VoiVehicule> _vehicules = {};
  List<VoiVehicule> _proximityVehicules = [];

  StreamSubscription? _allSub;
  StreamSubscription? _proximitySub;

  VoiVehicule? _selectedVehicule;

  UnmodifiableSetView<VoiVehicule> get vehicules => UnmodifiableSetView(_vehicules);
  UnmodifiableListView<VoiVehicule> get proximityVehicules => UnmodifiableListView(_proximityVehicules);
  VoiVehicule? get selectedVehicule => _selectedVehicule;

  VoiViewModel(this.repository, this._watchNearestVehiclesUseCase) {
    _allSub = repository.watchVoiVehicules().listen((data) {
      _vehicules = data;
      notifyListeners();
    });
    _proximitySub = _watchNearestVehiclesUseCase.watch().listen((data) {
      _proximityVehicules = data;
      notifyListeners();
    });
  }

  void selectVehicule(VoiVehicule vehicule) {
    if (!_vehicules.contains(vehicule)) {
      debugPrint("Véhicule sélectionné inexistant ${vehicule.id}!");
      return;
    }
    _selectedVehicule = vehicule;
    notifyListeners();
  }

  void clearSelection() {
    if (_selectedVehicule != null) {
      _selectedVehicule = null;
      notifyListeners();
    }
  }

  @override
  void dispose() {
    _allSub?.cancel();
    _proximitySub?.cancel();
    super.dispose();
  }
}
