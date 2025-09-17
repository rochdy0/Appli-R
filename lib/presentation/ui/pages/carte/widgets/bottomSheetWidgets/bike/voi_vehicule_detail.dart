import 'dart:math' as math;

import 'package:appli_r/domain/entities/voi_vehicule.dart';
import 'package:appli_r/presentation/viewmodels/voi_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class VoiVehiculeDetail extends StatelessWidget {
  const VoiVehiculeDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final VoiVehicule? vehicule = context.select((VoiViewModel vm) => vm.selectedVehicule);
    if (vehicule == null) {
      return SizedBox.shrink();
    }
    const titre = TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
    const sousTitre = TextStyle(fontSize: 11);
    return Column(
      spacing: 15,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Icon(size: 30, Icons.lock_open),
                Text("0,49 €", style: titre),
                Text("+ 0,23 € / min", style: sousTitre),
              ],
            ),
            Column(
              children: [
                Icon(size: 30, vehicule.type.icon),
                Text(vehicule.id.toUpperCase(), style: titre),
                Text(vehicule.type.label, style: sousTitre),
              ],
            ),
            Column(
              children: [
                Transform.rotate(
                  angle: math.pi / 2,
                  child: Icon(size: 30, vehicule.niveauBatterie.icon),
                ),
                Text(vehicule.niveauBatterie.label, style: titre),
                Text(
                  "${(vehicule.kmRestant).toString()} km d'autonomie",
                  style: sousTitre,
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          height: 65,
          child: 
                ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 67, 189, 189),
            foregroundColor: Colors.white,
            elevation: 3
          ),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [Text("Déverouiller avec  ", style: TextStyle(fontSize: 18)), Image.asset("assets/images/Voi.webp", width: 60,)]),
          onPressed: () async {
            if (await canLaunchUrl(Uri.parse(vehicule.deepLink))) {
              launchUrl(Uri.parse(vehicule.deepLink));
            } else {
              launchUrl(
                Uri.parse(
                  "https://apps.apple.com/fr/app/voi-e-scooters-e-bikes/id1395921017",
                ),
              );
            }
          },
        )
        ),
      ],
    );
  }
}
