import 'package:appli_r/presentation/viewmodels/public_transport_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';

class ArretsTransport extends StatelessWidget {
  const ArretsTransport({super.key});

  @override
  Widget build(BuildContext context) {
     final zoom = context.select((MapController mc) => mc.camera.zoom);
/*     if (zoom > 19) {
      return MarkerLayer(
        markers: context
            .watch<PublicTransportViewModel>()
            .poteaux
            .map(
              (poteau) => Marker(
                point: LatLng(poteau.lat, poteau.lon),
                width: 20,
                height: 20,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.rectangle,
                    border: Border.all(color: Colors.white, width: 3),
                  ),
                  child: Icon(Icons.directions_bus),
                ),
              ),
            )
            .toList(),
      );
    } else  */if (zoom > 15) {
      final arrets = context.select((PublicTransportViewModel vm) => vm.arrets);
      return MarkerLayer(
        markers: arrets
            .map(
              (arret) => Marker(
                point: LatLng(arret.lat, arret.lon),
                width: 500,
                height: 60,
                alignment: Alignment.centerRight,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Icon(
                        Icons.directions_bus,
                        size: 16,
                        color: Colors.white,
                      ),
                    ),
                    //SizedBox(width: 6),
                    Stack(
                      children: [
                        // Contour
                        Text(
                          arret.name,
                          style: TextStyle(
                            fontSize: 12,
                            foreground: Paint()
                              ..style = PaintingStyle.stroke
                              ..strokeWidth = 3
                              ..color = Colors.white,
                          ),
                        ),
                        // Texte plein
                        Text(
                          arret.name,
                          style: TextStyle(fontSize: 12, color: Colors.black),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
            .toList(),
      );
    } else {
      return SizedBox.shrink();
    }
  }
}
