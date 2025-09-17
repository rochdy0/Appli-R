import 'dart:convert';
import 'package:appli_r/data/models/public_transport_timetable_arret.dart';
import 'package:http/http.dart' as http;

class PublicTransportApi {
  final http.Client client;

  PublicTransportApi({http.Client? client}) : client = client ?? http.Client();

  Future<RealTimeResponseModel> fetchPublicTransportTimeTable(
    String arretCode,
    String agenceId,
    String ligneId
  ) async {
     final url = Uri.parse(
      'https://data.mobilites-m.fr/api/routers/default/index/clusters/$agenceId:$arretCode/stoptimes?route=$agenceId:$ligneId',
    );

    final response = await client.get(
      url,
      headers: {'origin': 'test_mon_appli'},
    );

    if (response.statusCode != 200) {
      throw Exception('Erreur API Data Mobilite M : ${response.statusCode}');
    } 

     final data = json.decode(response.body) as List<dynamic>; 
     final List<Pattern> patterns = [];
     List<Horaire> horaires = [];
/*     final List<Pattern> patterns = [Pattern(id: "Test123", lastStopName: "LastStop")];
    List<Horaire> horaires = [Horaire(tripId: "SEM3847932", patternId: "test123", realtimeArrival: 10800, isRealTime: true)]; */
    try {
     for (final d in data) {
      patterns.add(Pattern.fromJson(d['pattern']));
      var i = 0;
      for (final h in d['times']) {
        i++;
         horaires.add(Horaire.fromJson(d['pattern']['id'],  h));
         if (i>2) break;
      }
    } 
    horaires = horaires.toList();
    }
  catch (e, stack) {
      print("Erreur dans loadArretsAProximiteByReseaux: $e");
      print(stack);
    }
    return RealTimeResponseModel(directions: patterns, horaires: horaires);
  }
}
