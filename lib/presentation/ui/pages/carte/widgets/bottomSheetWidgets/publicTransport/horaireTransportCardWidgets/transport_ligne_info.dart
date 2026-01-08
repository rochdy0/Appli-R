import 'package:appli_r/domain/entities/publicTransport/arret.dart';
import 'package:appli_r/domain/entities/publicTransport/ligne.dart';
import 'package:appli_r/data/models/public_transport_timetable_arret.dart';
import 'package:flutter/material.dart';

class TransportLigneInfo extends StatelessWidget {
  final Ligne ligne;
  final Arret arret;
  final Pattern direction;

  const TransportLigneInfo({
    super.key,
    required this.ligne,
    required this.arret,
    required this.direction,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              "assets/images/logoLignes/${ligne.name}.webp",
              height: 35,
            ),
            GestureDetector(
              onTap: () {
                print("test");
              },
              child: Padding(padding: EdgeInsetsGeometry.only(left: 5), child: Icon(Icons.favorite_border, size: 22)),
            ),
          ],
        ),

        Text(arret.name, style: TextStyle(fontSize: 12, color: ligne.color)),
        Row(
          children: [
            Icon(Icons.arrow_right_alt_rounded, size: 22, color: ligne.color),
            Text(
              direction.lastStopName,
              style: TextStyle(fontSize: 12, color: ligne.color),
            ),
          ],
        ),
      ],
    );
  }
}
