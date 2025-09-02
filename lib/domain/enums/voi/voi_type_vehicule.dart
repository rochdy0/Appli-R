import 'package:flutter/material.dart';

enum VoiTypeVehicule {
  bike(Icons.electric_bike, "E-Bike"),
  scooter(Icons.electric_scooter, "Scooter");

  final IconData icon;
  final String label;

  const VoiTypeVehicule(this.icon, this.label);

  static VoiTypeVehicule fromApiString(String value) {
    switch (value) {
      case 'voi_bike':
        return VoiTypeVehicule.bike;
      case 'voi_scooter':
        return VoiTypeVehicule.scooter;
      default:
        throw ArgumentError("Type de véhicule inconnu : $value");
    }
  }
}
