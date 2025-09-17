import 'package:appli_r/domain/entities/voi_vehicule.dart';

class NearestVoiVehicule extends VoiVehicule{
  final double distance;

  NearestVoiVehicule({
    required super.id,
    required super.deepLink,
    required super.lat,
    required super.lon,
    required super.isReserved,
    required super.isDisabled,
    required super.type,
    required super.kmRestant,
    required this.distance
  });

    factory NearestVoiVehicule.fromVoiVehicule(
    VoiVehicule v, {
    required double distance,
  }) {
    return NearestVoiVehicule(
      id: v.id,
      deepLink: v.deepLink,
      lat: v.lat,
      lon: v.lon,
      isReserved: v.isReserved,
      isDisabled: v.isDisabled,
      type: v.type,
      kmRestant: v.kmRestant,
      distance: distance,
    );
  }
}