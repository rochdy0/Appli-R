import 'package:appli_r/utils/map_camera_move.dart';
import 'package:appli_r/presentation/viewmodels/voi_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';
import 'package:vibration/vibration.dart';

class VoiVehiculesMarker extends StatefulWidget {
  const VoiVehiculesMarker({super.key});
  @override
  State<VoiVehiculesMarker> createState() => _VoiVehiculesMarkerState();
}

class _VoiVehiculesMarkerState extends State<VoiVehiculesMarker>
    with TickerProviderStateMixin {
  late MapController _mapController;

  @override
  void initState() {
    super.initState();
    _mapController = Provider.of<MapController>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    final markers = context.watch<VoiViewModel>().vehicules.map((vehicule) {
      final targetColor =
          context.watch<VoiViewModel>().selectedVehicule == vehicule
          ? const Color.fromARGB(255, 243, 105, 97)
          : Colors.white;
      return Marker(
        point: LatLng(vehicule.lat, vehicule.lon),
        width: 40,
        height: 40,

        child: GestureDetector(
          onTap: () async {
            await animateMove(LatLng(vehicule.lat, vehicule.lon), 18, _mapController, this);
            context.read<VoiViewModel>().selectVehicule(vehicule);
            Vibration.vibrate(duration: 5, amplitude: 200);
            
          },
          child: TweenAnimationBuilder<Color?>(
            tween: ColorTween(
              begin:
                  targetColor, // ← on s'en fout, Flutter gère l'interpolation
              end: targetColor,
            ),
            duration: const Duration(milliseconds: 100),
            builder: (context, color, child) {
              return Container(
                decoration: BoxDecoration(
                  color:
                      context.read<VoiViewModel>().selectedVehicule == vehicule
                      ? Color.fromARGB(255, 243, 105, 97)
                      : Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.grey, width: 0.5),
                ),
                child: Center(
                  child: Icon(
                    vehicule.type.icon,
                    color:
                        context.read<VoiViewModel>().selectedVehicule ==
                            vehicule
                        ? Colors.white
                        : Color.fromARGB(255, 243, 105, 97),
                    size: 20,
                  ),
                ),
              );
            },
          ),
        ),
      );
    }).toList();
    return MarkerLayer(markers: markers);
    /*     return MarkerClusterLayerWidget(
      options: MarkerClusterLayerOptions(
        maxClusterRadius: 100,
        disableClusteringAtZoom: 18,
        size: Size(40, 40),
        onMarkerTap: (markers) => print("ttttt"),
        builder: (context, cluster) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.grey, width: 0.5),
            ),
            child: Center(child: Text(cluster.length.toString())),
          );
        },
        markers: markers,
      ),
    ); */
  }
}

LatLng calculerCentreMoyen(List<Marker> markers) {
  if (markers.isEmpty) {
    throw Exception("Liste vide !");
  }

  double sommeLat = 0;
  double sommeLon = 0;

  for (final marker in markers) {
    sommeLat += marker.point.latitude;
    sommeLon += marker.point.longitude;
  }

  double latMoyenne = sommeLat / markers.length;
  double lonMoyenne = sommeLon / markers.length;

  return LatLng(latMoyenne, lonMoyenne);
}
