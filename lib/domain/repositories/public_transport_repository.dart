import 'package:appli_r/data/models/public_transport_timetable_arret.dart';
import 'package:appli_r/domain/entities/publicTransport/agence.dart';
import 'package:appli_r/domain/entities/publicTransport/arret.dart';
import 'package:appli_r/domain/entities/publicTransport/ligne.dart';
import 'package:appli_r/domain/entities/publicTransport/ligne_shape.dart';
import 'package:appli_r/domain/entities/publicTransport/nearest.dart';
import 'package:appli_r/domain/entities/publicTransport/reseau.dart';

abstract class PublicTransportRepository {
  Future<Set<Agence>> loadAgences();
  Future<Set<Reseau>> loadReseauxByAgence(Agence agence);
  Future<Set<Ligne>> loadLignesByReseau(Reseau reseau);
  Future<Set<LigneShape>> loadLigneShapesByLignes(Set<Ligne> lignes);
  Future<List<Nearest>> loadArretsAProximiteByReseaux(double latitude, double longitude, Set<Reseau> reseaux, int distance);
  Stream<RealTimeResponseModel> watchArretsTimeTable(Arret arret, Ligne ligne);
}