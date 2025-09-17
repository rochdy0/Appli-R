import 'dart:async';

import 'package:appli_r/data/datasources/local/preferences/shared_preferences_reseaux.dart';
import 'package:appli_r/data/mappers/public_transport_mappers.dart';
import 'package:appli_r/domain/entities/publicTransport/reseau.dart';
import 'package:appli_r/domain/repositories/preferences_repository.dart';
import 'package:result_dart/result_dart.dart';
import 'package:rxdart/subjects.dart';

enum RepositoryAction { add, remove }

class PreferencesRepositoryImpl implements PreferencesRepository {
  final SharedPreferencesService _preferencesService;

  final _reseauxSubject = BehaviorSubject<Set<Reseau>>();
  final _stopsSubject = BehaviorSubject<Set<String>>();

  PreferencesRepositoryImpl(this._preferencesService) {
    _reseauxSubject.add(
      _preferencesService
          .get(PrefType.selectedReseau)
          .map((s) => ReseauMapper.fromData(s))
          .toSet(),
    );
    _stopsSubject.add(_preferencesService.get(PrefType.favouriteStop));
  }

  Future<Result<Set<Reseau>>> _updateReseauPreferences(
    RepositoryAction action,
    String value,
  ) async {
    final futureResult = switch (action) {
      RepositoryAction.add => _preferencesService.add(
        PrefType.selectedReseau,
        value,
      ),
      RepositoryAction.remove => _preferencesService.remove(
        PrefType.selectedReseau,
        value,
      ),
    };

    final serviceResult = await futureResult;
    return serviceResult.fold(
      (updated) {
        final mappedSet = updated.map(ReseauMapper.fromData).toSet();
        _reseauxSubject.add(mappedSet);
        return Success(mappedSet);
      },
      (failure) {
        _reseauxSubject.addError(failure);
        return Failure(failure);
      },
    );
  }

  Future<Result<Set<String>>> _updateStopPreferences(
    RepositoryAction action,
    String ligneId,
    String poteauId,
  ) async {
    final value = "$ligneId|$poteauId";
    final futureResult = switch (action) {
      RepositoryAction.add => _preferencesService.add(
        PrefType.favouriteStop,
        value,
      ),
      RepositoryAction.remove => _preferencesService.remove(
        PrefType.favouriteStop,
        value,
      ),
    };

    final serviceResult = await futureResult;
    return serviceResult.fold(
      (updated) {
        _stopsSubject.add(updated);
        return Success(updated);
      },
      (failure) {
        _stopsSubject.addError(failure);
        return Failure(failure);
      },
    );
  }

  @override
  Future<Result<Set<Reseau>>> addNetworkPreferences(String reseauId) =>
      _updateReseauPreferences(RepositoryAction.add, reseauId);

  @override
  Future<Result<Set<Reseau>>> removeNetworkPreferences(String reseauId) =>
      _updateReseauPreferences(RepositoryAction.remove, reseauId);

  @override
  Stream<Set<Reseau>> watchNetworkPreferences() => _reseauxSubject.stream;

  @override
  Future<Result<void>> addStopsPreferences(String ligneId, String poteauId) =>
      _updateStopPreferences(RepositoryAction.add, ligneId, poteauId);

  @override
  Future<Result<void>> removeStopsPreferences(String ligneId, String poteauId) =>
      _updateStopPreferences(RepositoryAction.remove, ligneId, poteauId);

  @override
  Stream<Set<String>> watchStopsPreferences() => _stopsSubject.stream;

  void dispose() {
    _reseauxSubject.close();
    _stopsSubject.close();
  }
}
