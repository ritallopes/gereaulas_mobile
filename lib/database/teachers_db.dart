import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class TeacherDb {
  static Database? _database;
  static const String tableName = 'teachers';

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    final path = join(await getDatabasesPath(), 'gereaulas.db');
    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute('''
          CREATE TABLE $tableName (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL,
            email TEXT NOT NULL,
            image_profile TEXT
          );
        ''');
      },
    );
  }

  Future<void> insertTeacher(Map<String, dynamic> teacherData) async {
    final db = await database;
    await db.insert(tableName, teacherData,
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Map<String, dynamic>>> getTeachers() async {
    final db = await database;
    return db.query(tableName);
  }

  Future<void> clearTable() async {
    final db = await database;
    await db.delete(tableName);
  }
}
