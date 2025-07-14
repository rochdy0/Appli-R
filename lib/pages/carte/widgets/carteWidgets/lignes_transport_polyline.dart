import 'package:appli_r/viewmodels/public_transport_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';

class LignesTransportPolyline extends StatelessWidget {
  const LignesTransportPolyline({super.key});

  @override
  Widget build(BuildContext context) {
    final polylignes = context.watch<PublicTransportViewModel>().lignesPoly;

    return PolylineLayer(
      polylines: 
      polylignes.map((lignePoly) {
        return Polyline(
          points: lignePoly.
          map((pt) => LatLng(pt.lon, pt.lat)).toList(), 
          strokeWidth: 2.5,
          color: Color(int.parse('FF${context.watch<PublicTransportViewModel>().ligneCouleur(lignePoly.first.ligneId)}', radix: 16)),
        );
      }).toList()
    );
  }
}
