import 'package:appli_r/models/database.dart';
import 'package:appli_r/utils/hex_to_color.dart';
import 'package:flutter/material.dart';

class TransportLigneInfo extends StatelessWidget {
  final LigneData ligne;
  final ArretData arret;
  final String direction;

  const TransportLigneInfo({
    super.key,
    required this.ligne,
    required this.arret,
    required this.direction,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          "assets/images/logoLignes/${ligne.shortName}.webp",
          height: 35,
        ),
        Text(
          direction,
          style: TextStyle(
            fontSize: 12,
            color: hexToColor(ligne.color!),
          ),
        ),
        Text(
          "${arret.name} (${arret.city})",
          style: TextStyle(
            fontSize: 12,
            color: hexToColor(ligne.color!),
          ),
        ),
      ],
    );
  }
}
