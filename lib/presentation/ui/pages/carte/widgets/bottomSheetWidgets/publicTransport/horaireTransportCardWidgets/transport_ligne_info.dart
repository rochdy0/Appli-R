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
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          "assets/images/logoLignes/${ligne.name}.webp",
          height: 35,
        ),
        Text(
          direction.lastStopName,
          style: TextStyle(
            fontSize: 12,
            color: ligne.color,
          ),
        ),
        Text(
          "${arret.name} (${arret.city})",
          style: TextStyle(
            fontSize: 12,
            color: ligne.color,
          ),
        ),
      ],
    ); 
  }
}
