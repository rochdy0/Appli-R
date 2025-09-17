import 'package:appli_r/presentation/ui/pages/carte/widgets/topBarWidgets/TransportConfigurationModal/publicTransport/agence_configuration.dart';
import 'package:appli_r/presentation/ui/pages/carte/widgets/topBarWidgets/TransportConfigurationModal/publicTransport/reseau_configuration.dart';
import 'package:appli_r/presentation/viewmodels/public_transport_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PublicTransportConfiguration extends StatelessWidget {
  const PublicTransportConfiguration({super.key});

  @override
  Widget build(BuildContext context) {
    final isAnyAgenceSelected = context.select(
      (PublicTransportViewModel p) => p.selectedAgence != null,
    );
    return Column(
      spacing: 5,
      children: [
        const AgenceConfiguration(),

        if (isAnyAgenceSelected) ...[
          const Divider(
            height: 25,
            thickness: 1,
            color: Color.fromARGB(255, 232, 233, 237),
          ),
          const ReseauConfiguration(),
        ],
      ],
    );
  }
}
