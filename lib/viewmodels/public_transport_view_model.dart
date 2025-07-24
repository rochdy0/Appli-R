import 'dart:async';

import 'package:appli_r/models/database.dart';
import 'package:appli_r/services/location_service.dart';
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
  final AppDatabase _db;
  final LocationService _locationService;
  PublicTransportViewModel(this._db, this._locationService);
  Timer? _refreshTimerHoraires;

  Set<AgenceTransportData> agencesDisponibles = {};
  Set<AgenceTransportData> agencesSelectionnees = {};
  Set<ReseauData> reseauxDisponibles = {};
  Set<ReseauData> reseauxSelectionnes = {};
  Set<LigneData> lignes = {};
  Set<List<LignePolyData>> lignesPoly = {};
  Set<PoteauData> poteaux = {};
  Set<ArretData> arrets = {};
  List<TransportAProximite> transportsAProximite = [];
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

  Future<void> _loadAgencesDisponibles() async {
    final agencesSQL = await (_db.select(_db.agenceTransport)).get();
    agencesDisponibles = agencesSQL.toSet();
  }

  Future<void> _loadReseauxDisponibles() async {
    if (agencesSelectionnees.isEmpty) {
      reseauxDisponibles = {};
      notifyListeners();
      return;
    }

    final agenceIds = agencesSelectionnees.map((a) => a.id).toList();
    final reseauxSQL = await (_db.select(
      _db.reseau,
    )..where((r) => r.agenceTransportId.isIn(agenceIds))).get();
    reseauxDisponibles = reseauxSQL.toSet();

    notifyListeners();
  }

  Future<void> _loadLignes() async {
    if (reseauxSelectionnes.isEmpty) {
      lignes = {};
      notifyListeners();
      return;
    }

    final reseauxIds = reseauxSelectionnes.map((a) => a.id).toList();

    final lignesSQL = await (_db.select(
      _db.ligne,
    )..where((r) => r.reseauId.isIn(reseauxIds))).get();

    lignes = lignesSQL.toSet();
    notifyListeners();
  }

  Future<void> _loadLignesPoly() async {
    if (lignes.isEmpty) {
      lignesPoly = {};
      notifyListeners();
      return;
    }

    final lignesPolyList = await Future.wait(
      lignes.map((ligne) {
        return (_db.select(_db.lignePoly)
              ..where((r) => r.ligneId.equals(ligne.id))
              ..orderBy([
                (r) => OrderingTerm(expression: r.num, mode: OrderingMode.asc),
              ]))
            .get();
      }),
    );
    lignesPoly = lignesPolyList.toSet();

    notifyListeners();
  }

  Future<void> _loadPoteaux() async {
    if (lignes.isEmpty) {
      poteaux = {};
      notifyListeners();
      return;
    }

    final lignesIds = lignes.map((a) => a.id).toList();

    final results = await (_db.select(_db.poteau).join([
      innerJoin(
        _db.poteauLigne,
        _db.poteauLigne.poteauId.equalsExp(_db.poteau.id),
      ),
    ])..where(_db.poteauLigne.ligneId.isIn(lignesIds))).get();
    poteaux = results.map((row) => row.readTable(_db.poteau)).toSet();
    notifyListeners();
  }

  Future<void> _loadArrets() async {
    if (poteaux.isEmpty) {
      arrets = {};
      notifyListeners();
      return;
    }
    final poteauxIds = poteaux.map((a) => a.id).toList();

    final results = await (_db.select(_db.arret).join([
      innerJoin(_db.poteau, _db.poteau.arretId.equalsExp(_db.arret.id)),
    ])..where(_db.poteau.id.isIn(poteauxIds))).get();
    arrets = results.map((row) => row.readTable(_db.arret)).toSet();

    notifyListeners();
  }

  Future<void> _loadArretsAProximite() async {
    if (arrets.isEmpty || !_locationService.isListening) {
      transportsAProximite = [];
      notifyListeners();
      return;
    }
    transportsAProximite = [];
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
            transportsAProximite.add(transportAProximite);
          }
        }
      }
    }
    notifyListeners();
  }

  void _startHorairesAutoRefresh() {
    _refreshTimerHoraires?.cancel();

    _refreshHoraires();

    _refreshTimerHoraires = Timer.periodic(Duration(seconds: 10), (_) {
      _refreshHoraires();
    });
  }

  Future<void> _refreshHoraires() async {
    for (var i = 0; i < transportsAProximite.length; i++) {
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
    }
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
