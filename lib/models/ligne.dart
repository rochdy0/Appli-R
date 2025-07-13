import 'zone_arret.dart'; // Assure-toi que le modèle Cluster est bien dans ce fichier ou importé correctement

class Ligne {
  final String id;
  final String gtfsId;
  final String shortName;
  final String longName;
  final String color;
  List<ZoneArret>? zoneArret;

  Ligne({
    required this.id,
    required this.gtfsId,
    required this.shortName,
    required this.longName,
    required this.color,
  });

  factory Ligne.fromJson(Map<String, dynamic> json) {
    return Ligne(
      id: json['id'] as String,
      gtfsId: json['gtfsId'] as String,
      shortName: json['shortName'] as String,
      longName: json['longName'] as String,
      color: json['color'] as String
    );
  }
}
