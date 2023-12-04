import 'dart:io';
import 'package:path_provider/path_provider.dart';

import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;

class UserDb {
  //operações com o bd SQLite
  static Future<sql.Database> database() async {
    final dbPath = await sql.getDatabasesPath();
    return sql.openDatabase(
      path.join(dbPath, 'gereaula.db'),
      onCreate: (db, version) {
        //executa o ddl para cirar o banco
        return db.execute(
            'CREATE TABLE users (id TEXT PRIMARY KEY, email TEXT, password TEXT)');
      },
      version: 1,
    );
  }

  static Future<void> insert(String table, Map<String, Object> data) async {
    final db = await UserDb.database();
    await db.insert(
      table,
      data,
      conflictAlgorithm: sql.ConflictAlgorithm.replace,
    );
  }

  static Future<List<Map<String, dynamic>>> getData(String table) async {
    final db = await UserDb.database();
    return db.query(table);
  }

  Future<String> saveImageToAppDirectory(File? imageFile, String name) async {
    if(imageFile == null) return '';
    final appDocumentsDirectory = await getApplicationDocumentsDirectory();
    final savedImagePath = '${appDocumentsDirectory.path}/${name}';

    await imageFile.copy(savedImagePath);
    return savedImagePath;
  }
}
