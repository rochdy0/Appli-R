import 'package:appli_r/services/location_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart' as latlng;
import 'package:provider/provider.dart';

class GpsPulseMarker extends StatefulWidget {
  const GpsPulseMarker({super.key});

  @override
  State<GpsPulseMarker> createState() => _GpsPulseMarkerState();
}

class _GpsPulseMarkerState extends State<GpsPulseMarker>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final pos = context.watch<LocationService>().currentPosition;
    if (pos == null) return const SizedBox();

    return MarkerLayer(
      markers: [
        Marker(
          point: latlng.LatLng(pos.latitude, pos.longitude),
          width: 50,
          height: 50,
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              final progress = _controller.value;
              final double scale = 1 + progress * 2; // agrandissement
              final double opacity = (1 - progress).clamp(0.0, 1.0);

              return Center(
                child: Container(
                  width: 20 * scale,
                  height: 20 * scale,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue.withOpacity(opacity * 0.4),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
