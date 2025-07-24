import 'package:appli_r/pages/carte/widgets/bottomSheetWidgets/horaireTransportCardWidgets/horaire_display.dart';
import 'package:appli_r/pages/carte/widgets/bottomSheetWidgets/horaireTransportCardWidgets/transport_ligne_info.dart';
import 'package:appli_r/utils/real_time_transport.dart';
import 'package:appli_r/viewmodels/public_transport_view_model.dart';
import 'package:flutter/material.dart';

class HoraireTransportCard extends StatelessWidget {
  final TransportAProximite transport;

  const HoraireTransportCard({super.key, required this.transport});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          SizedBox(
            height: 90,
            child: ValueListenableBuilder<List<String>>(
              valueListenable: transport.horaires.directions,
              builder: (context, directions, _) {
                return PageView.builder(
                  itemCount: directions.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TransportLigneInfo(
                            ligne: transport.ligne,
                            arret: transport.arret,
                            direction: directions[index],
                          ),
                          ValueListenableBuilder<List<Horaire>>(
                            valueListenable: transport.horaires.horaires[index],
                            builder: (context, horaires, _) {
                              return HorairesDisplay(horaires: horaires);
                            },
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
