import 'package:appli_r/data/models/public_transport_timetable_arret.dart';
import 'package:appli_r/domain/entities/publicTransport/nearest.dart';
import 'package:appli_r/presentation/viewmodels/public_transport_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class HorairesDisplay extends StatelessWidget {
  final String patternId;
  final Nearest transport; 

  const HorairesDisplay({super.key, required this.patternId, required this.transport});

  @override
  Widget build(BuildContext context) {
    final horaires = context.select((PublicTransportViewModel p) => p.timetableFor(transport.arret, transport.ligne)!.horaires.where((h) => h.patternId == patternId).toList());
    return Row(
      children: horaires
          .map(
            (horaire) {
final test = DateTime.fromMillisecondsSinceEpoch(horaire.realtimeArrival * 1000);
  final minutes = Duration(hours: test.hour-1, minutes: test.minute, seconds: test.second);
  final now = DateTime.now();
  final nowMinutes = Duration(hours: now.hour, minutes: now.minute, seconds: now.second);
  final diff = (minutes - nowMinutes).inMinutes;

    bool isInMinutes = diff < 60;
     String twoDigits(int n) => n.toString().padLeft(2, '0');
  final formatted = "${twoDigits(test.hour)}:${twoDigits(test.minute)}";
              return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    isInMinutes ? diff.toString() : formatted,
                    style: const TextStyle(fontSize: 15),
                  ),
                   if (isInMinutes)
                    const Text(
                      'min',
                      style: TextStyle(fontSize: 10),
                    ), 
                ],
              ),
            );}
          )
          .toList(),
    );
  }
}
