import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class ImageDb {
  late Database _database;

  Future<void> initDatabase() async {
    _database = await openDatabase(
      join(await getDatabasesPath(), 'your_database_name.db'),
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE image (
            id INTEGER PRIMARY KEY,
            image_path TEXT,
            name TEXT
          )
        ''');
      },
      version: 1,
    );
  }

  // Create
  Future<void> insertImage(Image image) async {
    await _database.insert(
      'image',
      image.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Read
  Future<List<Image>> getImagens() async {
    final List<Map<String, dynamic>> maps = await _database.query('image');

    return List.generate(maps.length, (i) {
      return Image(
        id: maps[i]['id'],
        imagePath: maps[i]['image_path'],
        name: maps[i]['name'],
      );
    });
  }

  // Update
  Future<void> updateImage(Image image) async {
    await _database.update(
      'image',
      image.toMap(),
      where: 'id = ?',
      whereArgs: [image.id],
    );
  }

  // Delete
  Future<void> deleteImage(int id) async {
    await _database.delete(
      'image',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}

class Image {
  final int? id;
  final String imagePath;
  final String name;

  Image({this.id, required this.imagePath, required this.name});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'image_path': imagePath,
      'name': name,
    };
  }
}
