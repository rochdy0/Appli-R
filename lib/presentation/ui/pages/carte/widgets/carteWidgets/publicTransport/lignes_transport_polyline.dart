import 'package:appli_r/presentation/viewmodels/publicTransport/public_transport_map_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';

class LignesTransportPolyline extends StatelessWidget {
  const LignesTransportPolyline({super.key});

  @override
  Widget build(BuildContext context) {
    final polylignes = context.watch<PublicTransportMapViewmodel>().lignesShapes;
    if (polylignes == null) {
      return const SizedBox(); // ou n'affiche rien temporairement
    }
    return PolylineLayer(
      polylines: polylignes.map((lignePoly) {
        return Polyline(
          points: lignePoly.sequence
              .map((pt) => LatLng(pt.lat, pt.lon))
              .toList(),
          strokeWidth: 2.5,
          color: lignePoly.color,
        );
      }).toList(),
    );
  }
}
