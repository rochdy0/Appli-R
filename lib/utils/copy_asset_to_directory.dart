import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

enum FilePersistence {
  temporary,
  persistent
}

Future<String> copyAssetToFile(String path, FilePersistence persistence) async {
  // Charge le fichier binaire depuis les assets
  final byteData = await rootBundle.load('assets/$path');
  final bytes = byteData.buffer.asUint8List();


  final tempDir = persistence == FilePersistence.temporary ? await getTemporaryDirectory() : await getApplicationDocumentsDirectory();
  final filePath = '${tempDir.path}/$path';

  // Écrit le fichier dans le système de fichiers local
  final file = File(filePath);
  await file.writeAsBytes(bytes);

  return filePath;
}