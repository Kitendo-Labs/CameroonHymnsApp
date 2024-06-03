// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class SembastDatabase {
  SembastDatabase() {
    init();
  }
  late Database _instance;
  Database get instance => _instance;

  bool _hasBeenInitialised = false;

  Future<bool> init() async {
    if (_hasBeenInitialised) return true;
    try {
      final dbDirectory = await getApplicationDocumentsDirectory();
      await dbDirectory.create(recursive: true);
      final dbPath = join(dbDirectory.path, 'db.sembast');
      _instance = await databaseFactoryIo.openDatabase(dbPath);
      debugPrint(_instance.path);
      return _hasBeenInitialised = true;
    } catch (e) {
      debugPrint(e.toString());
      debugPrint('FAILED TO LOAD DATABASE');
      return false;
    }
  }
}
