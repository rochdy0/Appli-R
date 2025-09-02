import 'package:appli_r/domain/entities/publicTransport/arret.dart';
import 'package:appli_r/domain/entities/publicTransport/ligne.dart';

class Poteau {
  final String id;
  final Arret arret;
  final double lat;
  final double lon;
  Set<Ligne> lignes = {};

  Poteau({
    required this.id,
    required this.arret,
    required this.lat,
    required this.lon,
  });

/*   factory Poteau.fromData(PoteauTableData data, Arret arret) {
    return Poteau(
      id: data.id,
      arret: arret,
      lat: data.lat,
      lon: data.lon
    );
  } */
}
