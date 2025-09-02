import 'package:flutter/material.dart';

enum VoiNiveauBatterie {
  vide(Icons.battery_0_bar, "Vide"),
  tresFaible(Icons.battery_1_bar, "Très faible"),
  faible(Icons.battery_2_bar, "Faible"),
  moyenne(Icons.battery_3_bar, "Moyenne"),
  bonne(Icons.battery_4_bar, "Bonne"),
  presquePleine(Icons.battery_5_bar, "Presque pleine"),
  pleine(Icons.battery_full, "Pleine");

  final IconData icon;
  final String label;

  const VoiNiveauBatterie(this.icon, this.label);

  static VoiNiveauBatterie fromRange(double kmRestant) {
    if (kmRestant < 0 || kmRestant > 80000) {
      throw ArgumentError(
        "Valeur d'autonomie invalide : $kmRestant kilomètres (attendu entre 0 et 80)",
      );
    }

    return switch (kmRestant) {
      <= 0 => VoiNiveauBatterie.vide,
      < 16 => VoiNiveauBatterie.tresFaible,
      < 32 => VoiNiveauBatterie.faible,
      < 48 => VoiNiveauBatterie.moyenne,
      < 64 => VoiNiveauBatterie.bonne,
      < 80 => VoiNiveauBatterie.presquePleine,
      _ => VoiNiveauBatterie.pleine,
    };
  }
}
