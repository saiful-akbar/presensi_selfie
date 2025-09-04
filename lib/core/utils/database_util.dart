import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DB {
  static Database? _db;

  static Future<Database> init() async {
    if (_db != null) return _db!;

    // Tentukan lokasi file database
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, 'hris_mobile.db');

    await deleteDatabase(path);

    // Buka atau buat database
    _db = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        db.execute('''
          CREATE TABLE activity_logs(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            username TEXT NOT NULL,
            content TEXT NOT NULL,
            latlong TEXT,
            photo TEXT,
            event_time TEXT
          )
        ''');
      },
    );

    return _db!;
  }
}
