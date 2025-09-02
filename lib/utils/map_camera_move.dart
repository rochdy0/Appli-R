  import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

Future<void> animateMove(
  LatLng to,
  double zoom,
  MapController mapController,
  TickerProvider ticker,
) async {
  final actualZoom = mapController.camera.zoom;
  final actualPos = mapController.camera.center;

  final latTween = Tween<double>(begin: actualPos.latitude, end: to.latitude);
  final lngTween = Tween<double>(begin: actualPos.longitude, end: to.longitude);
  final zoomTween = Tween<double>(begin: actualZoom, end: zoom);

  final controller = AnimationController(
    duration: const Duration(milliseconds: 800),
    vsync: ticker,
  );

  final animation = CurvedAnimation(
    parent: controller,
    curve: Curves.easeInOut,
  );

  final completer = Completer<void>();

  controller.addListener(() {
    final lat = latTween.evaluate(animation);
    final lng = lngTween.evaluate(animation);
    final newZoom = zoomTween.evaluate(animation);
    mapController.move(LatLng(lat, lng), newZoom);
  });

  controller.addStatusListener((status) {
    if (status == AnimationStatus.completed) {
      controller.dispose();
      completer.complete(); // 👈 débloque l’attente
    }
  });

  controller.forward();

  await completer.future; // 👈 bloquant
}
