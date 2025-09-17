import 'package:appli_r/domain/entities/publicTransport/agence.dart';
import 'package:appli_r/presentation/viewmodels/public_transport_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AgenceTile extends StatelessWidget {
  final Agence agence;
  const AgenceTile(this.agence, {super.key});

  @override
  Widget build(BuildContext context) {
    final isSelected = context.select(
      (PublicTransportViewModel p) => p.selectedAgence == agence,
    );
    final viewModel = context.read<PublicTransportViewModel>();

    return AnimatedContainer(
      duration: const Duration(milliseconds: 50),
      decoration: BoxDecoration(
        border: isSelected
            ? Border.all(color: const Color(0xFF43BDBD), width: 2.5)
            : null,
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextButton(
        style: ButtonStyle(
          overlayColor: WidgetStateProperty.all(Colors.transparent),
          splashFactory: NoSplash.splashFactory,
        ),
        onPressed: () => viewModel.selectAgence(agence),
        child: Image.asset("assets/images/${agence.imageFileName}", height: 80),
      ),
    );
  }
}
