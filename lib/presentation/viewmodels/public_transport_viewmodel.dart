import 'dart:async';

import 'package:appli_r/data/models/public_transport_timetable_arret.dart';
import 'package:appli_r/domain/entities/publicTransport/agence.dart';
import 'package:appli_r/domain/entities/publicTransport/arret.dart';
import 'package:appli_r/domain/entities/publicTransport/ligne.dart';
import 'package:appli_r/domain/entities/publicTransport/nearest.dart';
import 'package:appli_r/domain/entities/publicTransport/reseau.dart';
import 'package:appli_r/domain/repositories/preferences_repository.dart';
import 'package:appli_r/domain/repositories/public_transport_repository.dart';
import 'package:appli_r/domain/usecases/timetable_nearest_stops_usecase.dart';
import 'package:flutter/material.dart';

enum SelectionAction { add, remove }

class PublicTransportViewModel extends ChangeNotifier {
  final PublicTransportRepository repository;
  final NearestArretsAllLinesRealtimeUseCase nearestRealtimeUseCase;
  final PreferencesRepository preferencesRepository;

  final Set<Agence> _agences = {};
  Agence? _selectedAgence;

  Set<Agence> get agences => Set.unmodifiable(_agences);
  Agence? get selectedAgence => _selectedAgence;

  Set<Reseau> _reseaux = {};
  Set<Reseau> _selectedReseaux = {};
  StreamSubscription<Set<Reseau>>? _prefReseauxSub;

  Set<Reseau> get reseaux => Set.unmodifiable(_reseaux);
  Set<Reseau> get selectedReseaux =>
      Set.unmodifiable(_selectedReseaux);


  StreamSubscription<NearRealtimeEvent>? _rtSub;
  List<Nearest> _nearest = const [];
  final Map<String, RealTimeResponseModel> _rtByPair =
      {}; // key = a|agence|ligne
  List<Nearest> get nearest => _nearest;
  RealTimeResponseModel? timetableFor(Arret a, Ligne l) =>
      _rtByPair[_pairKey(a, l)];
  bool hasTimetable(Arret a, Ligne l) => _rtByPair.containsKey(_pairKey(a, l));

  PublicTransportViewModel(
    this.repository,
    this.nearestRealtimeUseCase,
    this.preferencesRepository,
  ) {
    startRealtime();
    repository.loadAgences().then((value) {
      _agences.addAll(value);
      notifyListeners();
    });

        _prefReseauxSub = preferencesRepository.watchNetworkPreferences().listen(
      (evt) {
          _selectedReseaux = evt;
      },
      onError: (e, st) {},
    );
  }

  void selectAgence(Agence agence) async {
    if (!_agences.contains(agence)) {
      debugPrint("Agence sélectionnée inexistante ${agence.nom}!");
      return;
    }

    final action = _selectedAgence == agence
        ? SelectionAction.remove
        : SelectionAction.add;
    if (action == SelectionAction.remove) {
      _selectedAgence = null;
      _reseaux.clear();
    } else {
      _selectedAgence = agence;
      _reseaux = await repository.loadReseauxByAgence(agence);
    }
    notifyListeners();
  }

  void selectReseau(Reseau reseau) async {
    if (!_reseaux.contains(reseau)) {
      debugPrint("Reseau sélectionnée inexistante ${reseau.id}!");
      return;
    }
    final action = _selectedReseaux.contains(reseau)
        ? SelectionAction.remove
        : SelectionAction.add;
    if (action == SelectionAction.remove) {
      _selectedReseaux.remove(reseau);
    } else {
      _selectedReseaux.add(reseau);
    }

    notifyListeners();
    final result = action == SelectionAction.remove
        ? await preferencesRepository.removeNetworkPreferences(reseau.id)
        : await preferencesRepository.addNetworkPreferences(reseau.id);
    result.fold(
      (success) {
        // OK, rien à faire, l'état local est déjà correct
      },
      (error) {
        // rollback
        if (action == SelectionAction.remove) {
          _selectedReseaux.add(reseau);
        } else {
          _selectedReseaux.remove(reseau);
        }
        notifyListeners();
      },
    );
  }

  void startRealtime() {
    if (_rtSub != null) return; // déjà démarré

    _rtSub = nearestRealtimeUseCase.watchNearestArretsAllLinesRealtime().listen(
      (evt) {
        if (evt is NearestChanged) {
          _nearest = evt.nearest;

          notifyListeners();
        } else if (evt is TimetableUpdated) {
          _rtByPair[_pairKey(evt.arret, evt.ligne)] = evt.realtime;
          notifyListeners();
        }
      },
      onError: (e, st) {},
    );
  }

  Future<void> stopRealtime() async {
    await _rtSub?.cancel();
    _rtSub = null;
  }

  @override
  void dispose() {
    _rtSub?.cancel();
    _prefReseauxSub?.cancel();
    super.dispose();
  }

  String _pairKey(Arret a, Ligne l) => '${a.code}|${l.agenceId}|${l.id}';
}