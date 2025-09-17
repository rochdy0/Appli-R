import 'package:appli_r/presentation/viewmodels/publicTransport/public_transport_map_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';

class LignesTransportPolyline extends StatelessWidget {
  const LignesTransportPolyline({super.key});

  @override
  Widget build(BuildContext context) {
    final polylignes = context.select((PublicTransportMapViewmodel p) => p.lignesShapes);
    if (polylignes == null) {
      return const SizedBox(); // ou n'affiche rien temporairement
    }
return PolylineLayer(
  polylines: polylignes
      .map((lignePoly) {
        final points = lignePoly.sequence
            .map((pt) => LatLng(pt.lat, pt.lon))
            .toList();

        if (points.isEmpty) return null; // on ignore
        return Polyline(
          points: points,
          strokeWidth: 2.5,
          color: lignePoly.color,
        );
      })
      .whereType<Polyline>() // enlève les null
      .toList(),
);
  }
}
