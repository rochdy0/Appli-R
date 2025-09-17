class Agence {
  final String id;
  final String nom;
  final String imageFileName;

  Agence({
    required this.id,
    required this.nom,
    required this.imageFileName,
  });

  @override
  String toString() {
    return "Agence $id du nom $nom avec image $imageFileName";
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Agence &&
          id == other.id &&
          nom == other.nom &&
          imageFileName == other.imageFileName;
          
  @override
  int get hashCode =>
      id.hashCode ^
      nom.hashCode ^
      imageFileName.hashCode;
}