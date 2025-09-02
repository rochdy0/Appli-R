import 'package:appli_r/domain/entities/location/position.dart';
import 'package:appli_r/domain/enums/location/permission_status.dart';

abstract class LocationRepository {
  Future<LocationPermissionStatus> ensurePermission();

  Future<Location> getCurrentLocation();

  Stream<Location> watchLocation(int bruit);

  Stream<double> watchHeading();
}