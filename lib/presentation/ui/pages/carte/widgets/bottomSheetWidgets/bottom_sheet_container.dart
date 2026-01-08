import 'package:appli_r/presentation/ui/pages/carte/widgets/bottomSheetWidgets/bike_container.dart';
import 'package:appli_r/presentation/ui/pages/carte/widgets/bottomSheetWidgets/bottom_sheet_title.dart';
import 'package:appli_r/presentation/ui/pages/carte/widgets/bottomSheetWidgets/public_transport_container.dart';
import 'package:appli_r/presentation/viewmodels/transport_mode_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomSheetContainer extends StatelessWidget {
  final ScrollController scrollController;
  const BottomSheetContainer({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    final mode = context.select((TransportModeViewModel t) => t.selectedMode);
    return CustomScrollView(
      controller: scrollController,
      slivers: [
        SliverAppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          primary: false,
          pinned: true,
          centerTitle: false,
          /* collapsedHeight: 84, */ // ou 72/80 selon ton contenu
          expandedHeight: 70,
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
                  BottomSheetTitle()

                  // Tu peux aussi mettre des boutons, menus, etc.
                ],
              ),
            ),
          ),
        ),
        SliverList.list(
          children: [
            ...switch (mode) {
              TransportMode.publicTransport => [
                  PublicTransportContainer()
              ],
              TransportMode.bike => [
                BikeContainer()
              ],
              TransportMode.car => [],
            },
          ],
        ),
      ],
    );
  }
}
