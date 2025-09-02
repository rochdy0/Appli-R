import 'package:appli_r/data/datasources/local/publicTransport/public_transport_database.dart';
import 'package:appli_r/domain/entities/publicTransport/agence.dart';
import 'package:appli_r/domain/entities/publicTransport/arret.dart';
import 'package:appli_r/domain/entities/publicTransport/ligne.dart';
import 'package:appli_r/domain/entities/publicTransport/ligne_shape.dart';
import 'package:appli_r/domain/entities/publicTransport/reseau.dart';
import 'package:flutter/material.dart' hide Route;

extension AgenceMapper on AgencyData {
  Agence toDomain() => Agence(id: agencyId, nom: agencyName, imageFileName: '$agencyId.webp');
}

extension ReseauMapper on Reseau {
  static Reseau fromData(String id, String agenceId) => Reseau(id: id, agenceId: agenceId, imageFileName: '$id.webp');
}

extension LigneMapper on Route {
  static Ligne fromData(Route route, String agenceId) => Ligne(id: route.routeId, agenceId: agenceId, name: route.routeShortName, color: hexToColor(route.routeColor), textColor: hexToColor(route.routeTextColor));
}

extension LigneMapper2 on Route {
  Ligne toDomain() => Ligne(id: routeId, agenceId: agencyId, name: routeShortName, color: hexToColor(routeColor), textColor: hexToColor(routeTextColor));
}

extension LigneShapeMapper on Shape {
  static LigneShape fromData(String ligneId, Color color, List<Shape> shapes) => LigneShape(id: ligneId, color: color, sequence: shapes.map((shape) => LigneShapeSequence(id: shape.shapePtSequence, lat: shape.shapePtLat, lon: shape.shapePtLon)).toList());
}

extension ArretMapper on Stop {
  Arret toDomain() {
    final name = stopName.split(", ");
    return Arret(code: stopCode ,city: name[0], name: name[1], lat: stopLat, lon: stopLon);}
}

Color hexToColor(String hex) {
  hex = hex.replaceFirst('#', '');
  if (hex.length == 6) {
    hex = 'FF$hex'; // ajoute alpha
  }
  return Color(int.parse(hex, radix: 16));
}