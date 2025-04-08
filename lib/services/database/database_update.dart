import 'dart:developer';

import 'package:rick_and_morty/services/database/database_name_field.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseUpdate {
  Future<void> dbOperationsVersion(Database db, int version) async {
    switch (version) {
      case 1:
        await _dbChangesV1(db);
        break;
    }
  }

  ///Базы данных v1
  Future<void> _dbChangesV1(Database db) async {
    try {
      await db.execute('''
          CREATE TABLE ${DatabaseNameField.nameTableFavourites}
          (
            ${DatabaseNameField.nameColumnId} INTEGER PRIMARY KEY,
            ${DatabaseNameField.nameColumnNameCharacter} TEXT NOT NULL,
            ${DatabaseNameField.nameColumnStatus} TEXT NOT NULL,
            ${DatabaseNameField.nameColumnImage} TEXT NOT NULL,
            ${DatabaseNameField.nameColumnGender} TEXT NOT NULL
          )
          ''');
    } on Exception catch (e) {
      log("[--- $e ---]");
    }
  }
}
