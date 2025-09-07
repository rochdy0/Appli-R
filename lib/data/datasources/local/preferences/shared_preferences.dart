import 'package:result_dart/result_dart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  final SharedPreferences _prefs;
  SharedPreferencesService(this._prefs);

  static const _kSelectedReseaux = 'selected_reseaux';
  Set<String> _readSet() =>
      (_prefs.getStringList(_kSelectedReseaux) ?? const <String>[]).toSet();

  Future<bool> _writeSet(Set<String> ids) {
    final list = ids.toList()..sort(); // déterministe pour debug/diff
    return _prefs.setStringList(_kSelectedReseaux, list);
  }

  Future<Result<Set<String>>> addSelectedReseau(String reseauId) async {
    final next = _readSet()..add(reseauId);
    final ok = await _writeSet(next);
    if (ok) {
      return Success(next);
    }
    return Failure(Exception('addSelectedReseau: écriture échouée'));
  }

  Future<Result<Set<String>>> removeSelectedReseau(String reseauId) async {
    final next = _readSet()..remove(reseauId);
    final ok = await _writeSet(next);
    if (ok) {
      return Success(next);
    }
    return Failure(Exception('removeSelectedReseau: écriture échouée'));
  }

  Result<Set<String>> getSelectedReseaux() => Success(_readSet());

  Future<Result<Set<String>>> clearSelectedReseaux() async {
    final ok = await _prefs.remove(_kSelectedReseaux);
    if (ok) {
      return Success(<String>{});
    }
    return Failure(Exception('clearSelectedReseaux: suppression échouée'));
  }
}
