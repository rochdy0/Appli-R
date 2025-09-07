import 'package:appli_r/domain/enums/location/permission_status.dart';
import 'package:appli_r/presentation/viewmodels/location_viewmodel.dart';
import 'package:appli_r/utils/map_camera_move.dart';
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

  @override
  Widget build(BuildContext context) {
    final locationViewModel = context.read<LocationViewModel>();
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Color.fromARGB(255, 67, 189, 189),
        shape: const CircleBorder(),
      ),
      onPressed: () {
        /* if (locationViewModel.perm! == LocationPermissionStatus.deniedForever) {
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
/*                     Navigator.of(context).pop();
                    locationViewModel.start(); */
                  },
                  child: Text('Fermer'),
                ),
              ],
            ),
          );
        }
        if (locationViewModel.perm! == LocationPermissionStatus.granted) {
          final pos = locationViewModel.location!;
          final position = LatLng(pos.latitude, pos.longitude);
          animateMove(position, 16, _mapController, this);
        } */
      },
      child: Icon(Icons.my_location),
    );
  }
}
