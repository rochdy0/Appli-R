import 'package:appli_r/presentation/ui/pages/carte/widgets/bottomSheetWidgets/bike/voi_proximity_vehicules.dart';
import 'package:appli_r/presentation/ui/pages/carte/widgets/bottomSheetWidgets/bike/voi_vehicule_detail.dart';
import 'package:appli_r/presentation/ui/pages/carte/widgets/bottomSheetWidgets/publicTransport/horaire_transport_card.dart';
import 'package:appli_r/presentation/viewmodels/public_transport_viewmodel.dart';
import 'package:appli_r/presentation/viewmodels/transport_mode_viewmodel.dart';
import 'package:appli_r/presentation/viewmodels/voi_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomSheetContainer extends StatelessWidget {
  final ScrollController scrollController;
  const BottomSheetContainer({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: scrollController,
      slivers: [
        SliverAppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          primary: false,
          pinned: true,
          centerTitle: false,
          collapsedHeight: 84, // ou 72/80 selon ton contenu
          expandedHeight: 84,
          flexibleSpace: FlexibleSpaceBar(
            background: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              ),
              child: Column(
                children: [
                  // 👉 Poignée en haut
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Center(
                      child: Container(
                        width: 40,
                        height: 4,
                        decoration: BoxDecoration(
                          color: Colors.grey[400],
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 12),

                  // 👉 Texte ou autre
                  const Text(
                    "test à proximité",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),

                  // Tu peux aussi mettre des boutons, menus, etc.
                ],
              ),
            ),
          ),
        ),
        SliverList.list(
          children: [
            ...switch (context.watch<TransportModeViewModel>().selectedMode) {
              TransportMode.publicTransport => [
                  ...context
                    .select((PublicTransportViewModel p) => p.nearest)
                    .map(
                      (transport) => HoraireTransportCard(transport: transport),
                    ),
              ],
              TransportMode.bike => [
                context.watch<VoiViewModel>().selectedVehicule != null
                    ? VoiVehiculeDetail()
                    : VoiProximityVehicules(),
              ],
              TransportMode.car => [],
            },
          ],
        ),
      ],
    );
  }
}
