import 'package:appli_r/presentation/viewmodels/bike_mode_viewmodel.dart';
import 'package:appli_r/presentation/viewmodels/car_mode_viewmodel.dart';
import 'package:appli_r/presentation/viewmodels/public_transport_viewmodel.dart';
import 'package:flutter/foundation.dart';

enum TransportMode {
  car,
  bike,
  publicTransport,
}

class TransportModeViewModel extends ChangeNotifier {
  final CarModeViewModel carMode;
  final BikeModeViewModel bikeMode;
  final PublicTransportViewModel ptMode;

  TransportModeViewModel({
    required this.carMode,
    required this.bikeMode,
    required this.ptMode,
  });

  TransportMode _selectedMode = TransportMode.publicTransport;

  TransportMode get selectedMode => _selectedMode;

  void selectMode(TransportMode mode) {
    if (_selectedMode != mode) {
      _selectedMode = mode;
      notifyListeners();
    }
  }

    dynamic get currentModeViewModel {
    switch (_selectedMode) {
      case TransportMode.car:
        return carMode;
      case TransportMode.bike:
        return bikeMode;
      case TransportMode.publicTransport:
        return ptMode;
    }
  }
}
