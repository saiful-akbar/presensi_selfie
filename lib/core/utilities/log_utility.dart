import 'package:intl/intl.dart';
import 'package:presensi_selfie/core/utilities/database_utility.dart';

class LogUtility {
  final _database = DatabaseUtility();

  // Membuat catatan aktifitas
  Future<int> create({
    required String username,
    required String message,
  }) async {
    final now = DateTime.now();
    final currentTime = DateFormat('yyyy-MM-dd HH:mm:ss').format(now);
    final db = await _database.init();

    return db.insert('hris_mobile_log', {
      'username': username,
      'content': message,
      'event_time': currentTime,
    });
  }

  // delete logs
  Future<int> deleteAll() async {
    final db = await _database.init();

    return await db.delete('hris_mobile_log');
  }

  // Mengambil semua logs
  Future<List<Map<String, dynamic>>> getAll() async {
    final db = await _database.init();

    return await db.query('hris_mobile_log');
  }
}
