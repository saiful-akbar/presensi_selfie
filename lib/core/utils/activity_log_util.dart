import 'package:intl/intl.dart';
import 'package:presensi_selfie/core/utils/database_util.dart';

class ActivityLog {
  // Aktifiitas login berhasil
  static Future<int> loginSuccess(String username) async {
    final now = DateTime.now();
    final currentTime = DateFormat('yyyy-MM-dd HH:mm:ss').format(now);
    final db = await DB.init();

    return db.insert('activity_logs', {
      'username': username,
      'content': 'Login berhasil.',
      'event_time': currentTime,
    });
  }

  // delete logs
  static Future<int> deleteAll() async {
    final db = await DB.init();

    return await db.delete('activity_logs');
  }

  // Mengambil semua logs
  static Future<List<Map<String, dynamic>>> getAll() async {
    final db = await DB.init();

    return await db.query('activity_logs');
  }
}
