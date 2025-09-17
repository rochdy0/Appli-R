import 'package:appli_r/domain/entities/publicTransport/reseau.dart';
import 'package:appli_r/presentation/viewmodels/public_transport_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ReseauTile extends StatelessWidget {
  final Reseau reseau;
  const ReseauTile(this.reseau, {super.key});

  @override
  Widget build(BuildContext context) {
    final isSelected = context.select(
      (PublicTransportViewModel p) => p.selectedReseaux.contains(reseau),
    );
    final viewModel = context.read<PublicTransportViewModel>();

    return AnimatedContainer(
  duration: const Duration(milliseconds: 150),
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
        onPressed: () => viewModel.selectReseau(reseau),
        child: Image.asset("assets/images/${reseau.imageFileName}", height: 40),
      ),
    );
  }
}
