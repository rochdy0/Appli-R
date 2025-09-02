import 'package:flutter/foundation.dart';

class BikeModeViewModel extends ChangeNotifier {
  BikeModeViewModel();

/*   Set<List<VeloPolyData>> veloPoly = {};

  Future<void> _loadVeloPoly() async {
    final routes = ["chronovelo", "voieverte"];
    final veloPolyList = await Future.wait(
      routes.map((route) {
        final routePoly =  (_db.select(_db.veloPoly)
              ..where((r) => r.typeVoie.equals(route))
              ..orderBy([
                (r) => OrderingTerm(expression: r.num, mode: OrderingMode.asc),
              ]))
            .get();
            return routePoly;
      }),
    );
    veloPoly = veloPolyList.toSet();
    notifyListeners();
  }

  Future<void> init() async {
    await _loadVeloPoly();
    notifyListeners();
  } */
}
