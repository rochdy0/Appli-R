import 'package:appli_r/models/database.dart';
import 'package:drift/drift.dart';
import 'package:flutter/foundation.dart';

enum AgenceType { mReso, laRegion }

class PublicTransportViewModel extends ChangeNotifier {
  final AppDatabase _db;
  PublicTransportViewModel(this._db);

  Set<AgenceTransportData> agencesDisponibles = {};
  Set<AgenceTransportData> agencesSelectionnees = {};
  Set<ReseauData> reseauxDisponibles = {};
  Set<ReseauData> reseauxSelectionnes = {};
  Set<LigneData> lignes = {};
  Set<List<LignePolyData>> lignesPoly = {};

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

  String ligneCouleur(String ligneId) {
    return lignes.firstWhere((a) => a.id == ligneId).color!;
  }

  Future<void> init() async {
    await _loadAgencesDisponibles();
    notifyListeners();
  }
}
