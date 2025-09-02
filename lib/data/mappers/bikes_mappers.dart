
import 'package:appli_r/data/models/voi_vehicule_model.dart';
import 'package:appli_r/domain/entities/voi_vehicule.dart';
import 'package:appli_r/domain/enums/voi/voi_type_vehicule.dart';

extension VoiVehiculeMapper on VoiVehiculeModel {
  VoiVehicule toDomain()  {
      final decoded = Uri.decodeFull(rentalUri);
  final match = RegExp(r'voiapp://scooter/([a-zA-Z0-9]+)').firstMatch(decoded);

  final id = match?.group(1) ?? "UNKNOWN";
  final link = match?.group(0) ?? "UNKNOWN";

  return VoiVehicule(
    id: id,
    deepLink: link,
    lat: lat,
    lon: lon,
    isReserved: isReserved,
    isDisabled: isDisabled,
    type: VoiTypeVehicule.fromApiString(vehiculeType),
    kmRestant: currentRangeMeters / 1000,
  );

  }
}