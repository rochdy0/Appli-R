import 'package:appli_r/data/models/public_transport_timetable_arret.dart';
import 'package:appli_r/domain/entities/publicTransport/nearest.dart';
import 'package:appli_r/presentation/viewmodels/public_transport_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HorairesDisplay extends StatelessWidget {
  final String patternId;
  final Nearest transport;

  const HorairesDisplay({
    super.key,
    required this.patternId,
    required this.transport,
  });

  @override
  Widget build(BuildContext context) {
    final horaires = context.select(
      (PublicTransportViewModel p) => p
          .timetableFor(transport.arret, transport.ligne)!
          .horaires
          .where((h) => h.patternId == patternId)
          .toList(),
    ); /* [Horaire(tripId: "SEM3847932", patternId: "test123", realtimeArrival: 10800, isRealTime: true)]; */

    return Row(
      children: horaires.map((horaire) {
        DateTime todayMidnight = DateTime.now();
        todayMidnight = DateTime(
          todayMidnight.year,
          todayMidnight.month,
          todayMidnight.day,
        );
        // Ajouter tes secondes
        DateTime target = todayMidnight.add(
          Duration(seconds: horaire.realtimeArrival),
        );
        // Calculer la différence
        int diff = target.difference(DateTime.now().toUtc()).inMinutes;
        if (diff < 0)
          diff +=
              1440; // Si l'horaire est après minuit et il est 23h la diff passe dans les négatifs

        bool isInMinutes = diff < 60;
        String twoDigits(int n) => n.toString().padLeft(2, '0');
        final format = switch (diff) {
          >= 60 => "${twoDigits(target.hour)}:${twoDigits(target.minute)}",
          0 => "<1",
          < 60 => diff.toString(),
          _ => "Erreur",
        };
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
/*               Align(
                alignment: Alignment.topLeft,
                child: Transform.flip(
                  flipX: true,
                  child: const Icon(Icons.rss_feed, size: 15),
                ),
              ), */

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(format, style: const TextStyle(fontSize: 15)),
                  if (isInMinutes)
                    const Text('min', style: TextStyle(fontSize: 10)),
                ],
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
