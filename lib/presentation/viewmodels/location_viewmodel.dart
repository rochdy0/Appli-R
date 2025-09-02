import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:appli_r/domain/entities/location/position.dart';
import 'package:appli_r/domain/repositories/location_repository.dart';
import 'package:appli_r/domain/enums/location/permission_status.dart';

class LocationViewModel with ChangeNotifier {
  final LocationRepository _locationRepository;
  LocationViewModel(this._locationRepository) {start();}

  StreamSubscription<Location>? _locSub;
  StreamSubscription<double>? _headSub;

  Location? _location;
  double? _heading;
  
  String? _error;
  bool _loading = false;
  LocationPermissionStatus? _perm;
  Location? get location => _location;
  double? get heading => _heading;
  String? get error => _error;
  bool get loading => _loading;
  LocationPermissionStatus? get perm => _perm;

  Future<void> start() async {
    _loading = true;
    _error = null;
    notifyListeners();

    _perm = await _locationRepository.ensurePermission();
    if (_perm != LocationPermissionStatus.granted) {
      _error = 'Permissions non accordées ($_perm)';
      _loading = false;
      notifyListeners();
      return;
    }

    // Position
    _locSub?.cancel();
    _locSub = _locationRepository.watchLocation(5).listen(
      (loc) {
        _location = loc;
        notifyListeners();
      },
      onError: (e) {
        _error = 'watchLocation: $e';
        notifyListeners();
      },
    );

    // Cap
    _headSub?.cancel();
    _headSub = _locationRepository.watchHeading().listen(
      (h) {
        _heading = h;
        notifyListeners();
      },
      onError: (e) {
        _error = 'watchHeading: $e';
        notifyListeners();
      },
    );

    _loading = false;
    notifyListeners();
  }

  Future<void> stop() async {
    await _locSub?.cancel();
    await _headSub?.cancel();
    _locSub = null;
    _headSub = null;
  }

  @override
  void dispose() {
    stop();
    super.dispose();
  }
}
