import 'package:appli_r/presentation/ui/pages/carte/widgets/bottomSheetWidgets/publicTransport/horaire_transport_card.dart';
import 'package:appli_r/presentation/viewmodels/public_transport_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PublicTransportContainer extends StatelessWidget {
  const PublicTransportContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final nearest = context.select((PublicTransportViewModel p) => p.nearest);

    return Column(
      children: nearest
          .map((transport) => HoraireTransportCard(transport: transport))
          .toList(),
    );
  }
}
