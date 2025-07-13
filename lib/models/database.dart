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

}

class Reseau extends Table {
  TextColumn get id => text()(); // Pas d'autoincrement
  IntColumn get agenceTransportId => integer().references(AgenceTransport, #id)();
  TextColumn get mode => text()();
  TextColumn get textColor => text().nullable()();
  TextColumn get imageFileName => text().nullable()();
  TextColumn get description => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

class Ligne extends Table {
  TextColumn get id => text()(); // Pas d'autoincrement
  TextColumn get reseauId => text().references(Reseau, #id)();
  TextColumn get gtfsId => text()();
  TextColumn get shortName => text().nullable()();
  TextColumn get longName => text().nullable()();
  TextColumn get color => text().nullable()();

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
  TextColumn get name => text().nullable()();
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
    final dbPath = p.join(dbFolder.path, 'db.db');
    File file = File(dbPath);
    if (!await file.exists()) {
      copyAssetToFile('db.db', FilePersistence.persistent);
      file = File(dbPath);
    }
    return NativeDatabase(file);
  });
}
