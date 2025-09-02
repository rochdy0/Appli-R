class Reseau {
  final String id;
  final String agenceId;
  final String imageFileName;

  Reseau({required this.id, required this.agenceId, required this.imageFileName});

  @override
  String toString() {
    return "Réseau $id";
  }
}
