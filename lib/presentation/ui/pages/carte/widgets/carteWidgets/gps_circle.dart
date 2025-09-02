import 'package:appli_r/presentation/viewmodels/location_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';

class GpsCircleLayer extends StatelessWidget {
  const GpsCircleLayer({super.key});

  @override
  Widget build(BuildContext context) {
    final pos = context.select((LocationViewModel l) => l.location);
    if (pos == null) return const SizedBox();
    return CircleLayer(
      circles: [
        CircleMarker(
          point: LatLng(pos.latitude, pos.longitude),
          useRadiusInMeter: true,
          radius: pos.accuracy,
          color: Colors.blue.withOpacity(0.3),
          borderColor: Colors.blue,
          borderStrokeWidth: 1,
        ),
      ],
    );
  }
}
