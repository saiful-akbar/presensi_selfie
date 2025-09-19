import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseUtility {
  Database? _db;

  Future<Database> init() async {
    if (_db != null) return _db!;

    // Tentukan lokasi file database
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, 'hris_mobile.db');

    // HANYA saat development
    await deleteDatabase(path);

    // Buka atau buat database
    _db = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        db.execute('''
          CREATE TABLE IF NOT EXISTS activity_logs(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            username TEXT,
            content TEXT,
            latlong TEXT,
            location TEXT,
            photo TEXT,
            event_time TEXT
          )
        ''');

        db.execute('''
          CREATE TABLE IF NOT EXISTS attendances(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            token TEXT,
            username TEXT,
            photo_in TEXT,
            photo_out TEXT,
            time_in TEXT,
            time_out TEXT,
            location_in TEXT,
            location_out TEXT,
            latitude_in REAL,
            latitude_out REAL,
            longitude_in REAL,
            longitude_out REAL,
            working_hours TEXT,
            overtime TEXT
          )
        ''');
      },
    );

    return _db!;
  }
}
