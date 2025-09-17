import 'package:result_dart/result_dart.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum PrefType {
  selectedReseau("selected_reseaux"),
  favouriteStop("favourite_stops");

  const PrefType(this.value);
  final String value;
}

class SharedPreferencesService {
  final SharedPreferences _prefs;
  SharedPreferencesService(this._prefs);

  Set<String> _readSet(PrefType type) =>
      (_prefs.getStringList(type.value) ?? const <String>[]).toSet();

  Future<bool> _writeSet(PrefType prefType, Set<String> ids) {
    final list = ids.toList()..sort(); // déterministe pour debug/diff
    return _prefs.setStringList(prefType.value, list);
  }

  Future<Result<Set<String>>> add(PrefType type, String item) async {
    final next = _readSet(type)..add(item);
    final ok = await _writeSet(type, next);
    if (ok) {
      return Success(next);
    }
    return Failure(Exception('add ${type.value}: écriture échouée'));
  }

  Future<Result<Set<String>>> remove(PrefType type, String item) async {
    final next = _readSet(type)..remove(item);
    final ok = await _writeSet(type, next);
    if (ok) {
      return Success(next);
    }
    return Failure(Exception('remove ${type.value}: écriture échouée'));
  }

  Set<String> get(PrefType type) => _readSet(type);

  Future<Result<Set<String>>> clear(PrefType type) async {
    final ok = await _prefs.remove(type.value);
    if (ok) {
      return Success(<String>{});
    }
    return Failure(Exception('clear ${type.value}: suppression échouée'));
  }
}
