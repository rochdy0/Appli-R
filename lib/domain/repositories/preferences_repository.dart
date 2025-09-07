import 'package:appli_r/domain/entities/publicTransport/reseau.dart';
import 'package:result_dart/result_dart.dart';

abstract class PreferencesRepository {
  Future<Result<Set<Reseau>>> addSelectedReseau(String reseauId);

  Future<Result<Set<Reseau>>> removeSelectedReseau(String reseauId);

  Result<Set<Reseau>> getSelectedReseaux();

  Stream<Set<Reseau>> watchReseauPreferences();
}