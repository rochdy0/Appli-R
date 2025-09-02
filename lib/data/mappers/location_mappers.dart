
import 'package:appli_r/domain/entities/location/position.dart';
import 'package:geolocator/geolocator.dart';

extension LocationMapper on Position {
  Location toDomain() => Location(latitude: latitude, longitude: longitude, accuracy: accuracy);
}