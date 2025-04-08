import 'dart:developer';

import 'package:path/path.dart';
import 'package:rick_and_morty/models/character_result.dart';
import 'package:rick_and_morty/services/database/database_name_field.dart';
import 'package:rick_and_morty/services/database/database_update.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHandler {
  static final DatabaseHandler _databaseHandler = DatabaseHandler._internal();
  final int _versionDb = 1;

  factory DatabaseHandler() {
    _databaseHandler._createPath();
    _databaseHandler._initDatabase();
    return _databaseHandler;
  }

  DatabaseHandler._internal();

  Database? mainDb;

  Future<String> _createPath() async {
    var databasesPath = await getDatabasesPath();
    return join(databasesPath, "rick_and_morty_db.db");
  }

  Future<void> _onConfigure(Database db) async {
    db.execute("PRAGMA foreign_keys = ON;");
  }

  Future<void> _onCreate(Database db, int version) async {
    for (int ver = 0; ver <= version; ver++) {
      DatabaseUpdate().dbOperationsVersion(db, ver);
    }
  }

  Future<void> _onUpdate(db, oldVersion, newVersion) async {
    for (int version = oldVersion; version <= newVersion; version++) {
      DatabaseUpdate().dbOperationsVersion(db, version);
    }
  }

  Future<void> _initDatabase() async {
    try {
      mainDb = await openDatabase(
        await _createPath(),
        version: _versionDb,
        onConfigure: _onConfigure,
        onCreate: _onCreate,
        onUpgrade: _onUpdate,
        onOpen: (db) {
          log("Database opened");
        },
      );
    } on Exception catch (e) {
      log("[--- $e ---]");
    }
  }

  /// Запись персонажа в БД
  Future<void> saveCharacterToFavourite({
    required CharacterResult character,
  }) async {
    try {
      if (!await checkCharacterInFavourite(character: character)) {
        await mainDb!.insert(
          DatabaseNameField.nameTableFavourites,
          character.toJson(),
        );
        log("Данные добавлены успешно");
      } else {
        log("Запись с ID = ${character.id} существует");
      }
    } catch (e) {
      log("Error inserting data: $e");
    }
  }

  /// Удаление персонажа из БД
  Future<void> removeCharacterFromFavourite({
    required CharacterResult character,
  }) async {
    try {
      if (await checkCharacterInFavourite(character: character)) {
        await mainDb!.delete(
          DatabaseNameField.nameTableFavourites,
          where:
              "${DatabaseNameField.nameColumnId} = ? AND ${DatabaseNameField.nameColumnNameCharacter} = ?",
          whereArgs: [character.id, character.name],
        );
        log("Данные удалены успешно");
      } else {
        log("Запись с ID = ${character.id} не существует");
      }
    } catch (e) {
      log("Error inserting data: $e");
    }
  }

  /// Получение всех записей из БД
  Future<List<CharacterResult>> loadCharacterFromFavourite() async {
    final List<Map<String, dynamic>> maps = await mainDb!.query(
      DatabaseNameField.nameTableFavourites,
    );
    return List.generate(maps.length, (i) {
      return CharacterResult.fromJson(maps[i]);
    });
  }

  /// Проверка существует ли запись в БД
  Future<bool> checkCharacterInFavourite({
    required CharacterResult character,
  }) async {
    try {
      // Проверка на существование записи с таким идентификатором
      var existingRecord = await mainDb!.query(
        DatabaseNameField.nameTableFavourites,
        where:
            "${DatabaseNameField.nameColumnId} = ? AND ${DatabaseNameField.nameColumnNameCharacter} = ?",
        whereArgs: [character.id, character.name],
      );
      return existingRecord.isNotEmpty;
    } catch (e) {
      log("Error inserting data: $e");
    }
    return false;
  }
}
