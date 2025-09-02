/* import 'package:appli_r/viewmodels/bike_mode_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';

class PisteCyclablePolyline extends StatelessWidget {
  const PisteCyclablePolyline({super.key});

  @override
  Widget build(BuildContext context) {
    final polylignes = context.watch<BikeModeViewModel>().veloPoly;
    final pistesCyclable = polylignes.map((e) => );
    return PolylineLayer(polylines: polylines)
/*     return PolylineLayer(
      polylines: polylignes.map((typePisteCyclable) {
        return typePisteCyclable.map((pisteCyclable) {
          return Polyline(
            points: pisteCyclable.map((pt) => LatLng(pt.lat, pt.lon)).toList(),
            strokeWidth: 2.5,
            color: Colors.amber,
          );
        });
      }).toList(),
    ); */
  }
}
 */