import 'dart:math' as math;

import 'package:appli_r/presentation/viewmodels/voi_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VoiProximityVehicules extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 0,
      children: context
          .watch<VoiViewModel>()
          .proximityVehicules
          .map((vehicule) => 
          GestureDetector(
            onTap: ()  {
              context
          .read<VoiViewModel>().selectVehicule(vehicule);},
            child: SizedBox(width: MediaQuery.of(context).size.width, child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Icon(vehicule.type.icon, size: 40,),
            Text(vehicule.id.toUpperCase()),
                            Transform.rotate(
                  angle: math.pi / 2,
                  child: Icon(size: 30, vehicule.niveauBatterie.icon),
                ),
          ],),))
          )
          .toList(),
    );
  }
}
