import 'package:appli_r/viewmodels/line_geometry_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:provider/provider.dart';

class LignesTransportPolyline extends StatelessWidget {
  const LignesTransportPolyline({super.key});

  @override
  Widget build(BuildContext context) {
    final polylignes = context.watch<LineGeometryViewModel>().polyline;

    return PolylineLayer(
      polylines: [
        Polyline(
          points: polylignes, 
          strokeWidth: 2,
          color: Colors.blue,
        ),
      ],
    );
  }
}
