import 'package:appli_r/presentation/ui/pages/carte/widgets/topBarWidgets/TransportConfigurationModal/publicTransport/agence_tile.dart';
import 'package:appli_r/presentation/viewmodels/public_transport_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AgenceConfiguration extends StatelessWidget {
  const AgenceConfiguration({super.key});

  @override
  Widget build(BuildContext context) {
    final agences = context.select(
      (PublicTransportViewModel p) => p.agences.toList(),
    );
    return Column(
      spacing: 5,
      children: [
        Text(
          "Agences de transport",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.1,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: agences.length,
              itemBuilder: (context, index) => AgenceTile(agences[index]),
            ),
          ),
        ),
      ],
    );
  }
}
