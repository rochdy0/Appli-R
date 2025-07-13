import 'package:appli_r/services/location_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';

void ouvrirReglages() async {
  if (!await Geolocator.openLocationSettings()) Geolocator.openAppSettings();
}

class LocalisationButton extends StatefulWidget {
  const LocalisationButton({super.key});

  @override
  State<LocalisationButton> createState() => _LocalisationButtonState();
}

class _LocalisationButtonState extends State<LocalisationButton>
    with TickerProviderStateMixin {
  late MapController _mapController;

  @override
  void initState() {
    super.initState();
    _mapController = Provider.of<MapController>(context, listen: false);
  }

  void animateMove(LatLng to) {
    final double actualZoom = _mapController.camera.zoom;
    final LatLng actualPos = _mapController.camera.center; 

    final latTween = Tween<double>(begin: actualPos.latitude, end: to.latitude);
    final lngTween = Tween<double>(begin: actualPos.longitude, end: to.longitude);
    Tween<double>? zoomTween;
  
    if (actualZoom < 14) 
    {
      zoomTween = Tween<double>(begin: actualZoom, end: 15);
    }

    final controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this, // ← ton widget doit with TickerProviderStateMixin
    );

    Animation<double> animation = CurvedAnimation(
      parent: controller,
      curve: Curves.easeInOut,
    );

    controller.addListener(() {
      final double lat = latTween.evaluate(animation);
      final double lng = lngTween.evaluate(animation);
      final double zoom = zoomTween?.evaluate(animation) ?? actualZoom;

      _mapController.move(LatLng(lat, lng), zoom);
    });

    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.dispose();
      }
    });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Color.fromARGB(255, 67, 189, 189),
        shape: const CircleBorder(),
      ),
      onPressed: () {
        LocationService locationService = Provider.of<LocationService>(
          context,
          listen: false,
        );
        final permissionStatus = locationService.permissionStatus;
        if (permissionStatus == LocationPermissionStatus.deniedForever) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Icon(Icons.my_location),
              content: Text(
                """Activez la localisation dans les réglages pour utiliser cette fonctionnalité.""",
              ),
              actions: [
                TextButton(
                  onPressed: () => ouvrirReglages(),
                  child: Text('Accéder aux réglages'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    locationService.listenToPositionStream();
                  },
                  child: Text('Fermer'),
                ),
              ],
            ),
          );
        }
        if (locationService.permissionStatus ==
            LocationPermissionStatus.granted) {
          final pos = context.read<LocationService>().currentPosition!;
          final position = LatLng(pos.latitude, pos.longitude);
          animateMove(position);
        }
      },
      child: Icon(Icons.my_location),
    );
  }
}
