import 'dart:async';
import 'package:appli_r/data/mappers/location_mappers.dart';
import 'package:appli_r/domain/entities/location/position.dart';
import 'package:appli_r/domain/enums/location/permission_status.dart';
import 'package:appli_r/domain/repositories/location_repository.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:geolocator/geolocator.dart';
import 'package:rxdart/rxdart.dart';

class LocationRepositoryImpl implements LocationRepository {
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
      return position.toDomain();
    } catch (e) {
      throw Exception("getCurrentLocation : $e");
    }
  }

  @override
  Stream<Location> watchLocation(int bruit) {
    return Rx.fromCallable(ensurePermission)
        .flatMap<Location>(
          (status) => status != LocationPermissionStatus.granted
              ? Stream.error(
                  Exception("watchLocation : Permissions non accordées"),
                )
              : Rx.concat<Location>([
                  Stream.fromFuture(
                    Geolocator.getLastKnownPosition().then((value) {
                      if (value != null) {
                        return value.toDomain();
                      }
                      return Future.error("No first location");
                    })
                  ),
                  Geolocator.getPositionStream()
                      .map((p) => p.toDomain())
                      .distinct(
                        (a, b) =>
                            Geolocator.distanceBetween(
                              a.latitude,
                              a.longitude,
                              b.latitude,
                              b.longitude,
                            ) <
                            bruit, // mètres
                      ),
                ]),
        )
        .shareReplay(maxSize: 1);
  }

  @override
  Stream<double> watchHeading() {
    return Rx.fromCallable(ensurePermission).flatMap<double>((status) {
      if (status != LocationPermissionStatus.granted) {
        return Stream.error(
          Exception("watchHeading : Permissions non accordées"),
        );
      }

      final events = FlutterCompass.events;
      if (events == null) {
        return Stream.error(Exception("watchHeading : CompassStream null"));
      }

      return events
          .map((e) => e.heading)
          .where((h) => h != null)
          .map((h) => h!)
          .where((h) => !h.isNaN)
          .distinct((a, b) => (a - b).abs() < 1);
    });
  }
}
