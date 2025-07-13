
import 'package:appli_r/models/ligne.dart';

class Reseau {

  final String type;
  final String mode;
  final String textColor;
  final String imageFileName;
  final String description;
  final List<Ligne> lignes;

  Reseau({
    required this.type,
    required this.mode,
    required this.textColor,
    required this.imageFileName,
    required this.description,
    required this.lignes
  });

  // Convertit du JSON vers un objet Reseau
  factory Reseau.fromJson(Map<String, dynamic> json) {
    return Reseau(
      type: json['type'] as String,
      mode: json['type'] as String,
      textColor: json['type'] as String,
      imageFileName: json['imageFileName'] as String,
      description: json['description'] as String,
      lignes: (json['lignes'] as List<dynamic>)
          .map((e) => Ligne.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

}