import 'dart:ui';

Color hexToColor(String hex) {
  hex = hex.replaceFirst('#', '');
  if (hex.length == 6) {
    hex = 'FF$hex'; // ajoute alpha
  }
  return Color(int.parse(hex, radix: 16));
}