class Reseau {
  final String id;
  final String imageFileName;

  Reseau({required this.id, required this.imageFileName});

  @override
  String toString() {
    return "Réseau $id";
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true; // optimisation
    return other is Reseau && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
