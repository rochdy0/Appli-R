import 'package:appli_r/pages/carte/widgets/bottomSheetWidgets/horaire_transport_card.dart';
import 'package:appli_r/viewmodels/public_transport_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomSheetCarte extends StatefulWidget {
  final void Function(bool isExpanded) onExpandChanged;
  final ValueNotifier<double> sheetExtentNotifier;

  const BottomSheetCarte({
    super.key,
    required this.onExpandChanged,
    required this.sheetExtentNotifier,
  });

  @override
  State<BottomSheetCarte> createState() => _BottomSheetCarteState();
}

class _BottomSheetCarteState extends State<BottomSheetCarte> {
  final DraggableScrollableController _controller =
      DraggableScrollableController();
  bool _wasExpanded = false;
  final List<double> _palierTailleSheet = [0.08, 0.4, 0.925];
  double _lastExtent = 0.3;

  @override
  Widget build(BuildContext context) {
    return NotificationListener<DraggableScrollableNotification>(
      onNotification: (notification) {
        final extent = notification.extent;
        if (extent != _lastExtent) {
          widget.sheetExtentNotifier.value = extent;
        }
        _lastExtent = extent;

        final isExpanded = extent >= 0.835;
        if (isExpanded != _wasExpanded) {
          _wasExpanded = isExpanded;
          widget.onExpandChanged(isExpanded);
        }

        return true;
      },
      child: DraggableScrollableSheet(
        controller: _controller,
        initialChildSize: 0.4,
        minChildSize: 0.08,
        maxChildSize: 0.925,
        builder: (context, scrollController) {
          return Listener(
            onPointerUp: (_) {
              // 🔁 À ce moment-là, le drag est relâché, on peut snapper
              final nearest = _palierTailleSheet.reduce(
                (a, b) =>
                    (_lastExtent - a).abs() < (_lastExtent - b).abs() ? a : b,
              );

              _controller.animateTo(
                nearest,
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeOut,
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              ),
              child: CustomScrollView(
                controller: scrollController,
                slivers: [
                  SliverAppBar(
                    automaticallyImplyLeading: false,
                    backgroundColor: Colors.transparent,
                    primary: false,
                    pinned: true,
                    centerTitle: false,
                    flexibleSpace: FlexibleSpaceBar(
                      background: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(30),
                          ),
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
                              "Arrêts à proximité",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            // Tu peux aussi mettre des boutons, menus, etc.
                          ],
                        ),
                      ),
                    ),
                  ),
                  SliverList.list(
                    children: [
                      Column(
                        spacing: 0,
                        children: context
                            .watch<PublicTransportViewModel>()
                            .transportsAProximite
                            .map(
                              (transport) =>
                                  HoraireTransportCard(transport: transport),
                            )
                            .toList(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
