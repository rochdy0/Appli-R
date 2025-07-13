import 'package:appli_r/models/agence_transport.dart';

class Truc {
  final List<AgenceTransport> agences;

  Truc({ required this.agences });

      factory Truc.fromJson(List<dynamic> json) {
    return Truc(
      agences: (json as List<dynamic>? ?? [])
          .map((e) => AgenceTransport.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}