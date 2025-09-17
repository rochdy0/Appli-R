import 'package:appli_r/presentation/viewmodels/transport_mode_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomSheetTitle extends StatelessWidget {
  const BottomSheetTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final mode = context.select((TransportModeViewModel t) => t.selectedMode);
    return Text(switch (mode) {
      TransportMode.publicTransport => "Lignes à proximité",
      TransportMode.bike => "Voi à proximité",
      TransportMode.car => "Rien encore"
    }, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold));
  }
}
