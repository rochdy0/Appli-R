# appli_r

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


créer une map : 
télécharger le .osm.pbf de la région rhone alpes sur internet
convertir le .osm.pbf en .mbtiles avec docker run -it --rm -v $(pwd):/data ghcr.io/systemed/tilemaker:master /data/isere.osm.pbf --output /data/isere.mbtiles
on peut rajouter les arguments --process et --config pour custom et alléger le fichier (enlever les cours d'eau par exemple)
convertir le .mbtiles en mptiles clusterisé avec ./pmtiles convert ./isere.mbtiles ./isere.pmtiles

https://github.com/openmaptiles/maptiler-basic-gl-style/tree/master
Un exemple de style de map à modifier