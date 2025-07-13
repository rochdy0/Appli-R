import 'package:appli_r/models/reseau.dart';

class AgenceTransport {
  final String nom;
  final String imageFileName;
  final List<Reseau> reseaux;

  AgenceTransport({required this.nom, required this.imageFileName, required this.reseaux});

    factory AgenceTransport.fromJson(Map<String, dynamic> json) {
    return AgenceTransport(
      nom: json['agenceTransport'] as String,
      imageFileName: json['imageFileName'] as String,
      reseaux: (json['reseaux'] as List<dynamic>? ?? [])
          .map((e) => Reseau.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}