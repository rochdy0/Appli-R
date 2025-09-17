import 'package:flutter/widgets.dart';

class Ligne {
  final String id;
  final String agenceId;
  final String name;
  final String imageFileName;
  final Color color;
  final Color textColor;

  Ligne({
    required this.id,
    required this.agenceId,
    required this.name,
    required this.imageFileName,
    required this.color,
    required this.textColor,
  });

  @override
  bool operator ==(Object other) => other is Ligne && id == other.id;

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() {
    return "Ligne $name";
  }
}
