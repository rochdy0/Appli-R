import 'package:appli_r/presentation/ui/pages/carte/widgets/topBarWidgets/TransportModeWidgets/public_transport_configuration.dart';
import 'package:appli_r/presentation/ui/pages/carte/widgets/topBarWidgets/TransportModeWidgets/transport_mode_choose_button.dart';
import 'package:appli_r/presentation/viewmodels/transport_mode_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TransportConfigurationModal extends StatelessWidget {
  const TransportConfigurationModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Type de Carte",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(Icons.close),
                ),
              ],
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TransportModeChooseButton(
                title: "Bus/Tram",
                iconType: Icon(Icons.tram),
                transportMode: TransportMode.publicTransport,
              ),
              TransportModeChooseButton(
                title: "Vélo",
                iconType: Icon(Icons.directions_bike),
                transportMode: TransportMode.bike,
              ),
              TransportModeChooseButton(
                title: "Voiture",
                iconType: Icon(Icons.directions_car),
                transportMode: TransportMode.car,
              ),
            ],
          ),

          const Divider(
            height: 25,
            thickness: 1,
            color: Color.fromARGB(255, 232, 233, 237),
          ),
          switch (context.watch<TransportModeViewModel>().selectedMode) {
            TransportMode.publicTransport => PublicTransportConfiguration(),
            TransportMode.bike => SizedBox.shrink(),
            TransportMode.car => SizedBox.shrink()
          },
        ],
      ),
    );
  }
}
