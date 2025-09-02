import 'package:appli_r/presentation/viewmodels/location_viewmodel.dart';
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
      duration: Duration(seconds: 3),
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
    final pos = context.select((LocationViewModel l) => l.location);
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
              final double scale = progress * 2; // agrandissement
              final double opacity = (1 - progress).clamp(0.0, 1.0);

              return Center(
                child: Container(
                  width: 40 * scale,
                  height: 40 * scale,
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
