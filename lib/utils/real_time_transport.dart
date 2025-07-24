import 'dart:convert';
import 'package:http/http.dart' as http;

typedef Horaire = ({String horaire, bool isRealTime, bool isInMinutes});

typedef RealTimeTransportResponse = ({List<String> directions, List<List<Horaire>> horaires});

Future<RealTimeTransportResponse> getHoraires(
  String ligneId,
  String arretCode,
) async {
  final url = Uri.parse(
    'https://data.mobilites-m.fr/api/routers/default/index/clusters/$arretCode/stoptimes?route=$ligneId',
  );

  final response = await http.get(url, headers: {'origin': 'test_mon_appli'});

  if (response.statusCode == 200) {
    final RealTimeTransportResponse horairesLigne = (directions: [], horaires: []);

    final List<dynamic> result = json.decode(response.body);
    for (var j = 0; j<result.length; j++) {
      horairesLigne.directions.add(result[j]["pattern"]["lastStopName"] as String);
      horairesLigne.horaires.add([]);
      for (var i = 0; (i < result[j]["times"].length && i < 3); i++) {
        final elt = result[j]["times"][i];
        final serviceDay = elt["serviceDay"];
        final realtimeArrival = elt["realtimeArrival"];
        DateTime arrivalTime = DateTime.fromMillisecondsSinceEpoch(
          (serviceDay + realtimeArrival) * 1000,
        );
        DateTime now = DateTime.now();
        Duration diff = arrivalTime.difference(now);
        int minutesRemaining = diff.inMinutes;
        final String temps = switch (minutesRemaining) {
          < 1 => '<1',
          > 60 => '${arrivalTime.hour}:${arrivalTime.minute}',
          _ => minutesRemaining.toString(),
        };
        final isRealTime = elt["realtime"] as bool;
        final isInMinutes = minutesRemaining <= 60;

        final Horaire horaire = (
          horaire: temps,
          isRealTime: isRealTime,
          isInMinutes: isInMinutes,
        );
        horairesLigne.horaires[j].add(horaire);
      }
    }
    return horairesLigne;
  } else {
    throw Exception('Erreur GET: ${response.statusCode} - ${response.body}');
  }
}
