import 'package:appli_r/utils/real_time_transport.dart';
import 'package:flutter/material.dart';

class HorairesDisplay extends StatelessWidget {
  final List<Horaire> horaires;

  const HorairesDisplay({super.key, required this.horaires});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: horaires
          .map(
            (horaire) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    horaire.horaire,
                    style: const TextStyle(fontSize: 15),
                  ),
                  if (horaire.isInMinutes)
                    const Text(
                      'min',
                      style: TextStyle(fontSize: 10),
                    ),
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}
