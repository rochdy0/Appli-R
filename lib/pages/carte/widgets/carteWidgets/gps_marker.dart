import 'package:appli_r/services/location_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';

class GpsMarkerLayer extends StatelessWidget {
  const GpsMarkerLayer({super.key});

  @override
  Widget build(BuildContext context) {
    final pos = context.watch<LocationService>().currentPosition!;
        return MarkerLayer(
          markers: [
            Marker(
              point: LatLng(pos.latitude, pos.longitude),
              width: 20,
              height: 20,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 3),
                ),
              ),
            ),
          ],
        );
  }
}
