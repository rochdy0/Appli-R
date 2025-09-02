import 'package:appli_r/domain/enums/voi/voi_niveau_batterie.dart';
import 'package:appli_r/domain/enums/voi/voi_type_vehicule.dart';

class VoiVehicule {
  final String id;
  final String deepLink;
  final double lat;
  final double lon;
  final bool isReserved;
  final bool isDisabled;
  final VoiTypeVehicule type;
  final double kmRestant;

  const VoiVehicule({
    required this.id,
    required this.deepLink,
    required this.lat,
    required this.lon,
    required this.isReserved,
    required this.isDisabled,
    required this.type,
    required this.kmRestant,
  });

  @override
  String toString() => 'VoiVehicule($id, ${type.label}, $kmRestant km restant)';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VoiVehicule &&
          id == other.id &&
          deepLink == other.deepLink &&
          lat == other.lat &&
          lon == other.lon &&
          type == other.type &&
          kmRestant == other.kmRestant;

  @override
  int get hashCode =>
      id.hashCode ^
      deepLink.hashCode ^
      lat.hashCode ^
      lon.hashCode ^
      type.hashCode ^
      kmRestant.hashCode;

  /// Niveau de batterie calculé
  VoiNiveauBatterie get niveauBatterie =>
      VoiNiveauBatterie.fromRange(kmRestant);
}