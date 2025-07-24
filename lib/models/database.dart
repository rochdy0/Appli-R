import 'package:appli_r/utils/copy_asset_to_directory.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'database.g.dart'; // Généré automatiquement

class AgenceTransport extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get nom => text().withLength(min: 1, max: 255)();
  TextColumn get imageFileName => text().nullable()();
}

class Reseau extends Table {
  TextColumn get id => text()(); // Pas d'autoincrement
  IntColumn get agenceTransportId => integer().references(AgenceTransport, #id)();
  TextColumn get mode => text()();
  TextColumn get textColor => text().nullable().named('text_color')();
  TextColumn get imageFileName => text().nullable().named('image_file_name')();
  TextColumn get description => text().nullable().named('description')();

  @override
  Set<Column> get primaryKey => {id};
}

class Ligne extends Table {
  TextColumn get id => text().named('id')(); // Pas d'autoincrement
  TextColumn get reseauId => text().references(Reseau, #id).named('reseau_id')();
  TextColumn get gtfsId => text().named('gtfs_id')();
  TextColumn get shortName => text().nullable().named('short_name')();
  TextColumn get longName => text().nullable().named('long_name')();
  TextColumn get color => text().nullable().named('color')();

  @override
  Set<Column> get primaryKey => {id};
}

class LignePoly extends Table {
  TextColumn get ligneId => text().references(Ligne, #id)();
  IntColumn get num => integer()();
  RealColumn get lat => real()();
  RealColumn get lon => real()();

  @override
  Set<Column> get primaryKey => {ligneId, lat, lon};
}

class Arret extends Table {
  TextColumn get id => text()(); 
  IntColumn get num => integer()();
  TextColumn get code => text()();
  TextColumn get city => text().nullable()();
  TextColumn get name => text()();
  BoolColumn get visible => boolean()();
  RealColumn get lat => real()();
  RealColumn get lon => real()();

  @override
  Set<Column> get primaryKey => {id};
}

class Poteau extends Table {
  TextColumn get id => text()(); 
  TextColumn get code => text()();
  BoolColumn get visible => boolean()();
  TextColumn get arretId => text().references(Arret, #id)();
  RealColumn get lat => real()();
  RealColumn get lon => real()();

  @override
  Set<Column> get primaryKey => {id};
}

class PoteauLigne extends Table {
  TextColumn get poteauId => text().references(Poteau, #id)();
  TextColumn get ligneId => text().references(Ligne, #id)();

  @override
  Set<Column> get primaryKey => {poteauId, ligneId};
}


@DriftDatabase(tables: [AgenceTransport, Reseau, Ligne, LignePoly, Arret, Poteau, PoteauLigne])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  // Exemple de requête

}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final dbPath = p.join(dbFolder.path, 'cb.db');
    //File file = File(dbPath);
    //if (!await file.exists()) {
      copyAssetToFile('cb.db', FilePersistence.persistent);
      File file = File(dbPath);
    //}
    return NativeDatabase(file);
  });
}
