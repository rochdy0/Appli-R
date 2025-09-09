import 'dart:async';
import 'dart:collection';

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
  final Set<Agence> _selectedAgence = {};

  UnmodifiableSetView<Agence> get agences => UnmodifiableSetView(_agences);
  UnmodifiableSetView<Agence> get selectedAgence =>
      UnmodifiableSetView(_selectedAgence);

  Set<Reseau> _reseaux = {};
  Set<Reseau> _selectedReseaux = {};

  UnmodifiableSetView<Reseau> get reseaux => UnmodifiableSetView(_reseaux);
  UnmodifiableSetView<Reseau> get selectedReseaux =>
      UnmodifiableSetView(_selectedReseaux);

  final Set<Arret> _arrets = {};

  UnmodifiableSetView<Arret> get arrets => UnmodifiableSetView(_arrets);

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
    _restartRealtimeIfActive();
    repository.loadAgences().then((value) {
      _agences.addAll(value);
      notifyListeners();
    });
  }

  void selectAgence(Agence agence) async {
    if (!_agences.contains(agence)) {
      debugPrint("Agence sélectionnée inexistante ${agence.nom}!");
      return;
    }

    final action = _selectedAgence.contains(agence)
        ? SelectionAction.remove
        : SelectionAction.add;

    _reseaux = await repository.loadReseauxByAgence(agence);
    final prefReseaux = preferencesRepository.getSelectedReseaux();
    prefReseaux.fold((sucess) {
      _selectedReseaux = _reseaux.intersection(sucess);
    }, (fail) {

    });
    

    if (action == SelectionAction.remove) {
      _selectedAgence.remove(agence);
    } else {
      _selectedAgence.add(agence);
    }
    

    notifyListeners();
  }

  void selectReseau(Reseau reseau) async {
    if (!_reseaux.contains(reseau)) {
      debugPrint("Reseau sélectionnée inexistante ${reseau.id}!");
      return;
    }

    final result = _selectedReseaux.contains(reseau)
        ? await preferencesRepository.removeSelectedReseau(reseau.id)
        : await preferencesRepository.addSelectedReseau(reseau.id);
      result.fold((success) {
        _selectedReseaux = success;
      }, (error) {});
    _restartRealtimeIfActive();

    /*     repository.loadLignesByReseau(reseau).then((lignes) {
      _loadLignes(lignes, action);
      repository
          .loadLigneShapesByLignes(lignes)
          .then((shapes) => _loadLignesShapes(shapes, action));
    }); */

    /* final arretsFromReseau = await repository.loadArretsByReseau(reseau); */
    /* _loadArrets(arretsFromReseau, action);  */

    notifyListeners();
  }

  void startRealtime() {
    if (_rtSub != null) return; // déjà démarré
    if (_selectedReseaux.isEmpty) {
      // Rien à écouter si aucun réseau n’est sélectionné
      return;
    }

    _rtSub = nearestRealtimeUseCase
        .watchNearestArretsAllLinesRealtime()
        .listen((evt) {
          if (evt is NearestChanged) {
            _nearest = evt.nearest;

            notifyListeners();
          } else if (evt is TimetableUpdated) {
            _rtByPair[_pairKey(evt.arret, evt.ligne)] = evt.realtime;
            notifyListeners();
          }
        }, onError: (e, st) {});
  }

  Future<void> stopRealtime() async {
    await _rtSub?.cancel();
    _rtSub = null;
  }

  void _restartRealtimeIfActive() {
    /*     final wasActive = _rtSub != null; */
    /*     if (!wasActive) return; */
    stopRealtime().then((_) => startRealtime());
  }

  @override
  void dispose() {
    _rtSub?.cancel();
    super.dispose();
  }

  String _pairKey(Arret a, Ligne l) => '${a.code}|${l.agenceId}|${l.id}';
}

/* import 'dart:async';

import 'package:appli_r/data/datasources/public_transport_database.dart';
import 'package:appli_r/data/repositories/public_transport_repository.dart';
import 'package:appli_r/data/services/location_service.dart';
import 'package:appli_r/utils/real_time_transport.dart';
import 'package:drift/drift.dart';
import 'package:flutter/foundation.dart';

enum AgenceType { mReso, laRegion }

typedef RealTimeTransport = ({
  ValueNotifier<List<String>> directions,
  List<ValueNotifier<List<Horaire>>> horaires,
});

typedef TransportAProximite = ({
  LigneData ligne,
  ArretData arret,
  RealTimeTransport horaires,
});

typedef SuggestionArret = ({ArretData arret, Set<LigneData> lignes});

class PublicTransportViewModel extends ChangeNotifier {
  final LocationService _locationService;
  List<AgenceTransportData> _agences = [];
  Set<AgenceTransportData> _selectedAgences = {};
  List<ReseauData> _reseaux = [];
  Set<ReseauData> _selectedReseaux = {};
  List<LigneData> _lignes = [];
  List<List<LignePolyData>> _lignesPoly = {};
  List<PoteauData> _poteaux = {};
  List<ArretData> _arrets = {};

  final PublicTransportRepository _publicTransportRepository;
  PublicTransportViewModel(
    this._publicTransportRepository,
    this._locationService,
  ) {
    _publicTransportRepository.fetchAgences().then((value) => _agences = value);
  }
  Timer? _refreshTimerHoraires;

  List<AgenceTransportData> get agences => _agences;
  Set<AgenceTransportData> get selectedAgences => _selectedAgences;
  List<ReseauData> get reseaux => _reseaux;
  Set<ReseauData> get selectedReseaux => _selectedReseaux;
  List<LigneData> get lignes => _lignes;

  final List<TransportAProximite> transportsAProximite = [];
  Set<SuggestionArret> suggestionArrets = {};

  void updateAgencesSelectionnees(int agenceId) async {
    final agence = agencesDisponibles.firstWhere((a) => a.id == agenceId);

    if (agencesSelectionnees.contains(agence)) {
      agencesSelectionnees.remove(agence);
    } else {
      agencesSelectionnees.add(agence);
    }
    await _loadReseauxDisponibles();
    await _loadLignes();
    await _loadLignesPoly();
    await _loadPoteaux();
    await _loadArrets();
    await _loadArretsAProximite();
    _startHorairesAutoRefresh();
    notifyListeners();
  }

  void updateReseauSelectionnees(String reseauId) async {
    final reseau = reseauxDisponibles.firstWhere((a) => a.id == reseauId);

    if (reseauxSelectionnes.contains(reseau)) {
      reseauxSelectionnes.remove(reseau);
    } else {
      reseauxSelectionnes.add(reseau);
    }

    await _loadLignes();
    await _loadLignesPoly();
    await _loadPoteaux();
    await _loadArrets();
    await _loadArretsAProximite();
    _startHorairesAutoRefresh();
    notifyListeners();
  }

  bool isInAgenceSelectionnee(int id) =>
      agencesSelectionnees.any((element) => element.id == id);
  bool isInReseauSelectionne(String id) =>
      reseauxSelectionnes.any((element) => element.id == id);

  Future<void> _loadArretsAProximite() async {
    if (arrets.isEmpty || !_locationService.isListening) {
      transportsAProximite.clear();
      notifyListeners();
      return;
    }
    final List<TransportAProximite> nouveauxTransportsAProximite = [];
    const distanceMax = 600;
    const metersPerDegree = 111_000.0;
    final delta = distanceMax / metersPerDegree;

    final currentPosition = _locationService.currentPosition!;
    final minLat = currentPosition.latitude - delta;
    final maxLat = currentPosition.latitude + delta;
    final minLon = currentPosition.longitude - delta;
    final maxLon = currentPosition.longitude + delta;

    final arretsIds = arrets.map((a) => a.id).toList();

    final approxArrets =
        await (_db.select(_db.arret)
              ..where((a) => a.lat.isBetweenValues(minLat, maxLat))
              ..where((a) => a.lon.isBetweenValues(minLon, maxLon))
              ..where((a) => a.id.isIn(arretsIds)))
            .get();

    for (final arret in approxArrets) {
      for (final ligne in lignes) {
        if (!transportsAProximite.any(
          (transport) => transport.ligne.id == ligne.id,
        )) {
          final result =
              await (_db.select(_db.poteau).join([
                    innerJoin(
                      _db.poteauLigne,
                      _db.poteauLigne.poteauId.equalsExp(_db.poteau.id),
                    ),
                  ])..where(
                    (_db.poteau.arretId.equals(arret.id) &
                        _db.poteauLigne.ligneId.equals(ligne.id)),
                  ))
                  .get();
          final poteaux = result
              .map((row) => row.readTable(_db.poteau))
              .toList();
          if (poteaux.isNotEmpty) {
            final horaireLigne = await getHoraires(ligne.id, arret.code);
            final List<ValueNotifier<List<Horaire>>> horaires = [];
            for (final elt in horaireLigne.horaires) {
              horaires.add(ValueNotifier(elt));
            }
            final TransportAProximite transportAProximite = (
              ligne: ligne,
              arret: arret,
              horaires: (
                directions: ValueNotifier(horaireLigne.directions),
                horaires: horaires,
              ),
            );
            nouveauxTransportsAProximite.add(transportAProximite);
          }
        }
      }
    }

    bool estDifferent =
        nouveauxTransportsAProximite.length != transportsAProximite.length;
    print(
      "premier check ${estDifferent} ${nouveauxTransportsAProximite.length} et ${transportsAProximite.length}",
    );
    if (!estDifferent) {
      for (int i = 0; i < transportsAProximite.length; i++) {
        if (transportsAProximite[i].arret !=
                nouveauxTransportsAProximite[i].arret ||
            transportsAProximite[i].ligne !=
                nouveauxTransportsAProximite[i].ligne) {
          estDifferent = true;
        }
      }
      print("deuxième check ${estDifferent}");
    }
    if (estDifferent) {
      transportsAProximite.clear();
      transportsAProximite.addAll(nouveauxTransportsAProximite);
      notifyListeners();
    }
  }

  void _startHorairesAutoRefresh() {
    _refreshTimerHoraires?.cancel();

    _refreshHoraires();

    _refreshTimerHoraires = Timer.periodic(Duration(seconds: 10), (_) {
      _refreshHoraires();
    });
  }

  Future<void> _refreshHoraires() async {
    // 1. Lancer tous les appels getHoraires en parallèle
    final futures = transportsAProximite.map((transport) {
      return getHoraires(transport.ligne.id, transport.arret.code);
    }).toList();

    final resultats = await Future.wait(futures);

    if (resultats.length != transportsAProximite.length) {
      print(
        "Incohérence : resultats.length = ${resultats.length}, transports = ${transportsAProximite.length}",
      );
      return;
    }
    // 2. Appliquer les résultats
    for (int i = 0; i < transportsAProximite.length; i++) {
      final transport = transportsAProximite[i];
      final horaireLigne = resultats[i];

      // Maj directions
      if (!listEquals(
        transport.horaires.directions.value,
        horaireLigne.directions,
      )) {
        transport.horaires.directions.value = horaireLigne.directions;
      }

      // S'assurer que la liste de ValueNotifier a la bonne taille
      while (transport.horaires.horaires.length <
          horaireLigne.horaires.length) {
        transport.horaires.horaires.add(ValueNotifier([]));
      }

      for (int j = 0; j < horaireLigne.horaires.length; j++) {
        if (!listEquals(
          transport.horaires.horaires[j].value,
          horaireLigne.horaires[j],
        )) {
          transport.horaires.horaires[j].value = horaireLigne.horaires[j];
        }
      }

      while (transport.horaires.horaires.length >
          horaireLigne.horaires.length) {
        transport.horaires.horaires.removeLast();
      }
    }
    /*     for (var i = 0; i < transportsAProximite.length; i++) {
      final horaireLigne = await getHoraires(
        transportsAProximite[i].ligne.id,
        transportsAProximite[i].arret.code,
      );

      // Mettre à jour les directions si elles ont changé
      if (!listEquals(
        transportsAProximite[i].horaires.directions.value,
        horaireLigne.directions,
      )) {
        transportsAProximite[i].horaires.directions.value =
            horaireLigne.directions;
      }

      // S'assurer que la liste de ValueNotifier est assez longue
      while (transportsAProximite[i].horaires.horaires.length <
          horaireLigne.horaires.length) {
        transportsAProximite[i].horaires.horaires.add(ValueNotifier([]));
      }

      // Mettre à jour les horaires un par un
      for (var j = 0; j < horaireLigne.horaires.length; j++) {
        if (!listEquals(
          transportsAProximite[i].horaires.horaires[j].value,
          horaireLigne.horaires[j],
        )) {
          transportsAProximite[i].horaires.horaires[j].value =
              horaireLigne.horaires[j];
        }
      }

      // Supprimer les ValueNotifier en trop si nécessaire
      while (transportsAProximite[i].horaires.horaires.length >
          horaireLigne.horaires.length) {
        transportsAProximite[i].horaires.horaires.removeLast();
      }
    } */
  }

  Future<void> _suggestionArrets(String input) async {
    if (input.isEmpty) {
      suggestionArrets = {};
    }

    final arrets = await (_db.select(
      _db.arret,
    )..where((a) => a.name.like('%${input}%'))).get();

    for (final arret in arrets) {
      final result = await (_db.select(_db.ligne).join([
        innerJoin(
          _db.poteauLigne,
          _db.poteauLigne.ligneId.equalsExp(_db.ligne.id),
        ),
        innerJoin(
          _db.poteau,
          _db.poteau.id.equalsExp(_db.poteauLigne.poteauId),
        ),
        innerJoin(_db.arret, _db.arret.id.equalsExp(_db.poteau.arretId)),
      ])..where(_db.arret.name.equals(arret.name))).get();

      final lignes = result.map((row) => row.readTable(_db.ligne)).toSet();

      final SuggestionArret arretSuggerre = (arret: arret, lignes: lignes);
      suggestionArrets.add(arretSuggerre);
    }

    notifyListeners();
  }

  String ligneCouleur(String ligneId) {
    return lignes.firstWhere((a) => a.id == ligneId).color!;
  }

  Future<void> init() async {
    await _loadAgencesDisponibles();
    _locationService.addListener(_loadArretsAProximite);
    notifyListeners();
  }
}
 */
