import 'dart:async';
import 'package:appli_r/data/mappers/location_mappers.dart';
import 'package:appli_r/domain/entities/location/position.dart';
import 'package:appli_r/domain/enums/location/permission_status.dart';
import 'package:appli_r/domain/repositories/location_repository.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:geolocator/geolocator.dart';

class LocationRepositoryImpl implements LocationRepository {
  Location? _lastLoc;
  @override
  Future<LocationPermissionStatus> ensurePermission() async {
    final enabled = await Geolocator.isLocationServiceEnabled();
    if (!enabled) return LocationPermissionStatus.disabled;

    var perm = await Geolocator.checkPermission();
    if (perm == LocationPermission.denied) {
      perm = await Geolocator.requestPermission();
    }
    if (perm == LocationPermission.denied) {
      return LocationPermissionStatus.denied;
    }
    if (perm == LocationPermission.deniedForever) {
      return LocationPermissionStatus.deniedForever;
    }
    return LocationPermissionStatus.granted;
  }

  @override
  Future<Location> getCurrentLocation() async {
    final status = await ensurePermission();
    if (status != LocationPermissionStatus.granted) {
      throw Exception("getCurrentLocation : Permissions non accordées");
    }

    try {
      final position = await Geolocator.getCurrentPosition();
      final loc = position.toDomain();
      _lastLoc = loc;
      return loc;
    } catch (e) {
      throw Exception("getCurrentLocation : $e");
    }
  }

  @override
  Stream<Location> watchLocation(int bruit) async* {
    final status = await ensurePermission();
    if (status != LocationPermissionStatus.granted) {
      throw Exception("watchLocation : Permissions non accordées");
    }
    final stream = Geolocator.getPositionStream();
    final cached = _lastLoc;
    if (cached != null) {
      yield cached;
    } else {
      final last = await Geolocator.getLastKnownPosition();
      if (last != null) {
        final loc = last.toDomain();
        _lastLoc = loc;
        yield loc;
      }
    }
    yield* stream.asBroadcastStream(  onListen: (sub) {
print("on a un listener");
  },
  onCancel: (sub) {
    print("on en a perdu un");
  },)
        .distinct((a, b) {
          final d = Geolocator.distanceBetween(
            a.latitude,
            a.longitude,
            b.latitude,
            b.longitude,
          );
          return d < bruit; // mètres
        })
        .map((position) {
          _lastLoc = position.toDomain();
          return position.toDomain();
        });
  }

  @override
  Stream<double> watchHeading() async* {
    final status = await ensurePermission();
    if (status != LocationPermissionStatus.granted) {
      throw Exception("watchHeading : Permissions non accordées");
    }
    final compassStream = FlutterCompass.events;
    if (compassStream == null) {
      throw Exception("watchHeading : CompassStream null");
    }
    yield* compassStream
        .where((e) => e.heading != null)
        .map((e) => e.heading!)
        .distinct((a, b) => (a - b).abs() < 1); // ~1° de tolérance
  }
}
