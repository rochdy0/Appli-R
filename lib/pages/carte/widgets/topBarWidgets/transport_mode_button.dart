import 'package:appli_r/pages/carte/widgets/topBarWidgets/TransportModeWidgets/transport_mode_modal.dart';
import 'package:appli_r/viewmodels/transport_mode_view_model.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

void ouvrirReglages() async {
  if (!await Geolocator.openLocationSettings()) Geolocator.openAppSettings();
}

final iconMap = {
  TransportMode.car: Icons.directions_car,
  TransportMode.bike: Icons.directions_bike,
  TransportMode.publicTransport: Icons.directions_bus,
};

class TransportModeButton extends StatelessWidget {
  const TransportModeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Color.fromARGB(255, 67, 189, 189),
        shape: const CircleBorder(),
      ),
      onPressed: () {
        showModalBottomSheet(
          context: context,
          isDismissible: true, // empêche de fermer en tapant à l'extérieur
          enableDrag: true, // empêche de faire glisser pour fermer
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero, // plus aucun arrondi
          ),
          builder: (BuildContext context) {
            return TransportModeModal();
          },
        );
      },
      child: Icon(iconMap[context.watch<TransportModeViewModel>().selectedMode]),
    );
  }
}
