import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'models/guide.dart';

class LocalDatabase {
  Database? _database;
  static String path = '';

   static connectToDataBase() async {
    var databasesPath = await getDatabasesPath();
    path = join(databasesPath, 'guides_database.db');
  }

  Future<Database?> get database async {
    if (_database == null)
      _database = await _createDatabase();
    return _database;
  }
  _createDatabase() async {
    await connectToDataBase();
    _database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
          // When creating the db, create the table
          await db.execute(
              'CREATE TABLE guides ('
                  'name TEXT, '
                  'icon TEXT, '
                  'startDate TEXT, '
                  'endDate TEXT, '
                  'url TEXT)');
        });
  }

  saveToDatabase(List<Guide> guides) async {
    final db = await database;
    for (Guide guide in guides){
      await db?.insert(
        'guides',
        guide.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }


}