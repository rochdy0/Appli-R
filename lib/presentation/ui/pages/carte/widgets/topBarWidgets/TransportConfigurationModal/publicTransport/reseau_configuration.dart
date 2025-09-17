import 'package:appli_r/presentation/ui/pages/carte/widgets/topBarWidgets/TransportConfigurationModal/publicTransport/reseau_tile.dart';
import 'package:appli_r/presentation/viewmodels/public_transport_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ReseauConfiguration extends StatelessWidget {
  const ReseauConfiguration({super.key});

  @override
  Widget build(BuildContext context) {
    final reseaux = context.select(
      (PublicTransportViewModel p) => p.reseaux.toList(),
    );
    return Column(
      spacing: 5,
      children: [
        Text(
          "Réseaux de transport",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.1,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: reseaux.length,
              itemBuilder: (context, index) => ReseauTile(reseaux[index]),
            ),
          ),
        ),
      ],
    );
  }
}
