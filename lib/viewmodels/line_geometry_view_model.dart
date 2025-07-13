import 'package:drift/drift.dart';
import 'package:flutter/foundation.dart';
import 'package:latlong2/latlong.dart';
import '../models/database.dart'; // ton AppDatabase drift

class LineGeometryViewModel extends ChangeNotifier {
  final AppDatabase _db;

  LineGeometryViewModel(this._db);

  List<LatLng> _polyline = [];

  List<LatLng> get polyline => _polyline;

  /// Charge les coordonnées GPS d'une ligne (dans l'ordre)
  Future<void> loadPolyline(String ligneId) async {
    final rawPoints = await (_db.select(_db.lignePoly)
          ..where((tbl) => tbl.ligneId.equals(ligneId))
          ..orderBy([(tbl) => OrderingTerm(expression: tbl.num)]))
        .get();
  
    _polyline = rawPoints
        .map((pt) => LatLng(pt.lon, pt.lat))
        .toList();
        print("taille de la liste");
        print(_polyline.length);
    notifyListeners();
  }

  void clear() {
    _polyline = [];
    notifyListeners();
  }
}
