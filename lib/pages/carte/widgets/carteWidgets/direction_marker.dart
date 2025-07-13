import 'dart:math' as math;

import 'package:appli_r/services/location_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart' as latlng;
import 'package:provider/provider.dart';

class DirectionMarker extends StatelessWidget {
  const DirectionMarker({super.key});

  @override
  Widget build(BuildContext context) {
    final pos = context.watch<LocationService>().currentPosition!;
    final dir = context.watch<LocationService>().currentDirection;
    final double? heading = dir?.heading;

  if (dir == null || heading == null) {
    return const SizedBox(); // ou n'affiche rien temporairement
  }

    return MarkerLayer(
      markers: [
        // Cône de direction
        Marker(
          point: latlng.LatLng(pos.latitude, pos.longitude),
          width: 100,
          height: 100,
          child: Transform.rotate(
            angle: (heading! - 90) * (math.pi / 180),
            child: CustomPaint(
              painter: _ConePainter(color: Colors.blue, angleDegrees: 60),
            ),
          ),
        ),
      ],
    );
  }
}

class _ConePainter extends CustomPainter {
  final Color color;
  final double angleDegrees;

  _ConePainter({required this.color, required this.angleDegrees});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    final startAngle = -math.pi * (angleDegrees / 360);
    final sweepAngle = math.pi * (angleDegrees / 180);

    final path = Path()
      ..moveTo(center.dx, center.dy)
      ..arcTo(
        Rect.fromCircle(center: center, radius: radius),
        startAngle,
        sweepAngle,
        false,
      )
      ..close();

    final gradient = RadialGradient(
      center: Alignment.center,
      radius: 1.0,
      colors: [
        color.withOpacity(0.4), // centre
        color.withOpacity(0.005), // intermédiaire
        Colors.transparent, // bord invisible
      ],
      stops: const [0.0, 0.6, 1.0],
    );

    final paint = Paint()
      ..shader = gradient.createShader(
        Rect.fromCircle(center: center, radius: radius),
      )
      ..style = PaintingStyle.fill;

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
