import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DB {
  static Database? _db;

  static Future<Database> init() async {
    if (_db != null) return _db!;

    // Tentukan lokasi file database
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, 'hris_mobile.db');

    // Hapus database.
    // await deleteDatabase(path);

    // Buka atau buat database
    _db = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        db.execute('''
          CREATE TABLE IF NOT EXISTS hris_mobile_log(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            username TEXT NOT NULL,
            content TEXT NOT NULL,
            latlong TEXT,
            location TEXT,
            photo TEXT,
            event_time TEXT
          )
        ''');

        db.execute('''
          CREATE TABLE IF NOT EXISTS TABLE hris_attendance(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            token TEXT NOT NULL,
            username TEXT NOT NULL,
            photo_in TEXT NOT NULL,
            photo_out TEXT,
            time_in TEXT NOT NULL,
            time_out TEXT,
            location_in TEXT NOT NULL,
            location_out TEXT,
            latlong_in TEXT NOT NULL,
            latlong_out TEXT,
            working_hours TEXT,
            overtime TEXT
          )
        ''');
      },
    );

    return _db!;
  }
}
