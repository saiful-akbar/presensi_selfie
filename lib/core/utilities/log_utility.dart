import 'package:intl/intl.dart';
import 'package:presensi_selfie/core/utilities/database_utility.dart';

class LogUtility {
  final _db = DatabaseUtility();

  // Membuat catatan aktifitas
  Future<int> create({required String username, required String message}) async {
    final now = DateTime.now();
    final currentTime = DateFormat('yyyy-MM-dd HH:mm:ss').format(now);
    final db = await _db.init();

    return db.insert('activity_logs', {
      'username': username,
      'content': message,
      'event_time': currentTime,
    });
  }

  // delete logs
  Future<int> deleteAll() async {
    final db = await _db.init();

    return await db.delete('activity_logs');
  }

  // Mengambil semua logs
  Future<List<Map<String, dynamic>>> getAll() async {
    final db = await _db.init();

    return await db.query('activity_logs');
  }
}
