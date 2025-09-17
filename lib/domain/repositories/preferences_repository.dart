import 'package:appli_r/domain/entities/publicTransport/reseau.dart';
import 'package:result_dart/result_dart.dart';

abstract class PreferencesRepository {
  Future<Result<Set<Reseau>>> addNetworkPreferences(String reseauId);

  Future<Result<Set<Reseau>>> removeNetworkPreferences(String reseauId);

  Stream<Set<Reseau>> watchNetworkPreferences();

   Future<Result<void>> addStopsPreferences(String ligneId, String poteauId);

    Future<Result<void>> removeStopsPreferences(String ligneId, String poteauId);

    Stream<Set<String>> watchStopsPreferences();
}