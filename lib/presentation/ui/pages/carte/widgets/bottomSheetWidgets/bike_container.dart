import 'package:appli_r/presentation/ui/pages/carte/widgets/bottomSheetWidgets/bike/voi_proximity_vehicules.dart';
import 'package:appli_r/presentation/ui/pages/carte/widgets/bottomSheetWidgets/bike/voi_vehicule_detail.dart';
import 'package:appli_r/presentation/viewmodels/voi_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BikeContainer extends StatelessWidget {
  const BikeContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final mode = context.select((VoiViewModel vm) => vm.selectedVehicule);
    if (mode == null) {
      return VoiProximityVehicules();
    }
    return VoiVehiculeDetail();
  }
}