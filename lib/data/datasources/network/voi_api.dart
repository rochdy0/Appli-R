import 'dart:convert';
import 'package:appli_r/data/models/voi_vehicule_model.dart';
/* import 'package:http/http.dart' as http; */
import 'dart:io';
import 'package:http/io_client.dart';

class VoiApi {
  /* final http.Client client = http.Client(); */
  final client = IOClient(
    HttpClient()
      ..autoUncompress = true
      ..idleTimeout = const Duration(minutes: 2)
      ..connectionTimeout = const Duration(seconds: 5),
  );

  Future<Set<VoiVehiculeModel>> fetchVehicle() async {
    final url = Uri.parse(
      'https://api.voiapp.io/gbfs/fr/6bb6b5dc-1cda-4da7-9216-d3023a0bc54a/v2/358/free_bike_status.json',
    );

    final response = await client.get(url);

    if (response.statusCode != 200) {
      throw Exception('Erreur API VOI : ${response.statusCode}');
    }

    final data = json.decode(response.body) as Map<String, dynamic>;
    final List bikes = data["data"]["bikes"];

    return bikes.map((json) => VoiVehiculeModel.fromJson(json)).toSet();
  }
}
