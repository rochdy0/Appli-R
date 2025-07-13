import 'dart:async';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/foundation.dart';

enum LocationPermissionStatus { granted, denied, deniedForever, disabled }

class LocationService with ChangeNotifier {
  Position? _currentPosition;
  CompassEvent? _currentDirection;
  StreamSubscription<Position>? _positionSubscription;
  StreamSubscription<CompassEvent>? _directionSubscription;
  bool _isListening = false;
  LocationPermissionStatus _permissionStatus =
      LocationPermissionStatus.disabled;

  Position? get currentPosition => _currentPosition;
  CompassEvent? get currentDirection => _currentDirection;
  bool get isListening => _isListening;
  LocationPermissionStatus get permissionStatus => _permissionStatus;

  /// Demande les permissions de localisation
  Future<void> _checkPermission() async {
    final isEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isEnabled) {
      _permissionStatus = LocationPermissionStatus.disabled;
      notifyListeners();
      return;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        _permissionStatus = LocationPermissionStatus.denied;
        notifyListeners();
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      _permissionStatus = LocationPermissionStatus.deniedForever;
      notifyListeners();
      return;
    }
    _permissionStatus = LocationPermissionStatus.granted;
    notifyListeners();
    return;
  }

  /// Récupère une fois la position
  Future<void> fetchCurrentPosition() async {
    await _checkPermission();
    if (_permissionStatus == LocationPermissionStatus.granted) {
      _currentPosition = await Geolocator.getCurrentPosition();
      notifyListeners();
    }
  }

  /// Active l’écoute continue de la position
  Future<void> listenToPositionStream() async {
    await _checkPermission();
    if (_permissionStatus == LocationPermissionStatus.granted) {
      if (!_isListening) {
        _isListening = true;
        _positionSubscription = Geolocator.getPositionStream().listen((
          position,
        ) {
          _currentPosition = position;
          notifyListeners();
        });
        _directionSubscription = FlutterCompass.events!.listen((direction) {
          _currentDirection = direction;
          notifyListeners();
        });
      }
    }
  }

  /// Arrête le suivi
  void stopListening() {
    _positionSubscription?.cancel();
    _directionSubscription?.cancel();
    _isListening = false;
  }

  @override
  void dispose() {
    stopListening();
    super.dispose();
  }
}
