import 'package:appli_r/viewmodels/transport_mode_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TransportModeChooseButton extends StatelessWidget {
  final String title;
  final Icon iconType;
  final TransportMode transportMode;

  const TransportModeChooseButton({
    super.key,
    required this.title,
    required this.iconType,
    required this.transportMode,
  });

  @override
  Widget build(BuildContext context) {
    final currentTransportMode = context
        .watch<TransportModeViewModel>()
        .selectedMode;
    return Column(
      spacing: 5,
      children: [
        Container(
          decoration: BoxDecoration(
            border: currentTransportMode == transportMode
                ? Border.all(
                    color: const Color.fromARGB(255, 67, 189, 189),
                    width: 2.5,
                  )
                : null,
            borderRadius: BorderRadius.circular(15),
          ),
          child: IconButton(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            iconSize: 45,
            icon: iconType,
            color: currentTransportMode == transportMode
                ? const Color.fromARGB(255, 67, 189, 189)
                : null,
            onPressed: () {
              context.read<TransportModeViewModel>().selectMode(transportMode);
            },
          ),
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: 12,
            color: currentTransportMode == transportMode
                ? const Color.fromARGB(255, 67, 189, 189)
                : null,
          ),
        ),
      ],
    );
  }
}
