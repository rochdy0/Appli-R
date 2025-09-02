import 'package:flutter/material.dart';

class LigneShape {
  final String id;
  final Color color;
  final List<LigneShapeSequence> sequence;

  LigneShape({required this.id, required this.color, required this.sequence});

  @override
  String toString() {
    return "LigneShape $id";
  }

  @override
  bool operator ==(Object other) => other is LigneShape && id == other.id;

  @override
  int get hashCode => id.hashCode;
}

class LigneShapeSequence {
  final int id;
  final double lat;
  final double lon;

  LigneShapeSequence({required this.id, required this.lat, required this.lon});
}
