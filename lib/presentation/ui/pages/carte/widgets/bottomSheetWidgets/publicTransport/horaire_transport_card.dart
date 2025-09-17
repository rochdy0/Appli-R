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
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              SizedBox(
                height: 90,
                child: PageView.builder(
                  itemCount: pattern.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TransportLigneInfo(
                            ligne: transport.ligne,
                            arret: transport.arret,
                            direction: pattern[index],
                          ),
                          Column(
                            spacing: 0,
                            children: [
/*                               SizedBox(
                                height: 25, // Hauteur souhaitée
                                child: IconButton(
                                  iconSize: 20,
                                  style: ButtonStyle(
                                    overlayColor: WidgetStateProperty.all(
                                      Colors.transparent,
                                    ),
                                    splashFactory: NoSplash.splashFactory,
                                  ),
                                  icon: Icon(Icons.favorite_border),
                                  onPressed: () {

                                  },
                                ),
                              ), */
                              HorairesDisplay(
                                patternId: pattern[index].id,
                                transport: transport,
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
