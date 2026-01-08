import 'package:appli_r/domain/entities/publicTransport/nearest.dart';
import 'package:appli_r/presentation/ui/pages/carte/widgets/bottomSheetWidgets/publicTransport/horaireTransportCardWidgets/horaire_display.dart';
import 'package:appli_r/presentation/ui/pages/carte/widgets/bottomSheetWidgets/publicTransport/horaireTransportCardWidgets/transport_ligne_info.dart';
import 'package:appli_r/presentation/viewmodels/public_transport_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HoraireTransportCard extends StatelessWidget {
  final Nearest transport;

  const HoraireTransportCard({super.key, required this.transport});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final pattern = context.select((PublicTransportViewModel p) {
          final test = p.timetableFor(transport.arret, transport.ligne);
          return test?.directions;
        });
        if (pattern == null) return const SizedBox();
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 91,
            child: PageView.builder(
              itemCount: pattern.length,
              itemBuilder: (context, index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TransportLigneInfo(
                      ligne: transport.ligne,
                      arret: transport.arret,
                      direction: pattern[index],
                    ),
                    HorairesDisplay(
                      patternId: pattern[index].id,
                      transport: transport,
                    ),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}
