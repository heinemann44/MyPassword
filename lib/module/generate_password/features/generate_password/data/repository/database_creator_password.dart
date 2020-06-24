import 'dart:io';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Database db;

class DatabaseCreatorPassword {
  static const tableName = 'password';
  static const id = 'id';
  static const applicationName = 'application_name';
  static const password = 'password';
  static const showPassword = 'show_password';
  static const isDeleted = 'is_deleted';

  static void databaseLog(
    String functionName,
    String sql, [
    List<Map<String, dynamic>> selectQueryResult,
    int saveQueryResult,
    List<dynamic> params,
  ]) {
    print(functionName);
    print(sql);

    if (params != null) print(params);
    if (saveQueryResult != null) print(saveQueryResult);
  }

  Future<String> getDatabasePath(String databaseName) async {
    final String databasePath = await getDatabasesPath();
    final String path = join(databasePath, databaseName);

    if (await Directory(dirname(path)).exists()) {
//      await deleteDatabase(path);
    } else {
      await Directory(dirname(path)).create(recursive: true);
    }

    return path;
  }

  Future<void> initDatabase() async {
    final path = await getDatabasePath("my_password_db");
    db = await openDatabase(path, version: 1, onCreate: this._onCreateDatabase);
    print(db);
  }

  Future<void> _onCreateDatabase(Database database, int version) async {
    await this.createTable(database);
  }

  Future<void> createTable(Database database) async {
    final String sql = '''CREATE TABLE $tableName
    (
      $id INTEGER PRIMARY KEY,
      $applicationName TEXT,
      $password TEXT,
      $showPassword BIT NOT NULL,
      $isDeleted BIT NOT NULL
    )''';

    await database.execute(sql);
  }
}
