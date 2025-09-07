import 'dart:async';

import 'package:appli_r/data/datasources/local/preferences/shared_preferences.dart';
import 'package:appli_r/data/mappers/public_transport_mappers.dart';
import 'package:appli_r/domain/entities/publicTransport/reseau.dart';
import 'package:appli_r/domain/repositories/preferences_repository.dart';
import 'package:result_dart/result_dart.dart';

class PreferencesRepositoryImpl implements PreferencesRepository {
  final SharedPreferencesService _preferencesService;

  Set<Reseau>? _last;

  final _controllerReseau = StreamController<Set<Reseau>>.broadcast();

  PreferencesRepositoryImpl(this._preferencesService) {
    _loadInitial();
  }

  void _loadInitial() {
    final result = _preferencesService.getSelectedReseaux();
    result.fold(
      (set) {
        _last = set.map((s) => ReseauMapper.fromData(s)).toSet();
      },
      (err) {
        _controllerReseau.addError(err);
      },
    );
  }

  @override
  Future<Result<Set<Reseau>>> addSelectedReseau(String reseauId) async {
    final serviceResult = await _preferencesService.addSelectedReseau(reseauId);

    return serviceResult.fold(
      (updated) {
        final updatedReseaux = updated
            .map((s) => ReseauMapper.fromData(s))
            .toSet();
        _last = updatedReseaux;
        _controllerReseau.add(Set.unmodifiable(updatedReseaux));
        return Success(updatedReseaux);
      },
      (failure) {
        _controllerReseau.addError(failure);
        return Failure(failure);
      },
    );
  }

  @override
  Future<Result<Set<Reseau>>> removeSelectedReseau(String reseauId) async {
    final serviceResult = await _preferencesService.removeSelectedReseau(
      reseauId,
    );

    return serviceResult.fold(
      (updated) {
        final updatedReseaux = updated
            .map((s) => ReseauMapper.fromData(s))
            .toSet();
        _last = updatedReseaux;
        _controllerReseau.add(Set.unmodifiable(updatedReseaux));
        return Success(updatedReseaux);
      },
      (failure) {
        _controllerReseau.addError(failure);
        return Failure(failure);
      },
    );
  }

  @override
  Result<Set<Reseau>> getSelectedReseaux() {
    final serviceResult = _preferencesService.getSelectedReseaux();
    return serviceResult.fold(
      (updated) {
        final updatedReseaux = updated
            .map((s) => ReseauMapper.fromData(s))
            .toSet();
        _last = updatedReseaux;
        _controllerReseau.add(Set.unmodifiable(updatedReseaux));
        return Success(updatedReseaux);
      },
      (failure) {
        _controllerReseau.addError(failure);
        return Failure(failure);
      },
    );
  }

  @override
  Stream<Set<Reseau>> watchReseauPreferences() async* {
    if (_last != null) {
      yield Set.unmodifiable(_last!);
    }
    yield* _controllerReseau.stream;
  }

  void dispose() {
    _controllerReseau.close();
  }
}
