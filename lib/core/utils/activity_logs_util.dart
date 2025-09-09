import 'package:intl/intl.dart';
import 'package:presensi_selfie/core/utils/database_util.dart';

class ActivityLog {
  // Aktifiitas login berhasil
  static Future<int> loginSuccess(String username) async {
    final now = DateTime.now();
    final currentTime = DateFormat('yyyy-MM-dd HH:mm:ss').format(now);
    final db = await DB.init();

    return db.insert('hris_mobile_log', {
      'username': username,
      'content': 'Login berhasil.',
      'event_time': currentTime,
    });
  }

  // Membuat catatan aktifitas
  static Future<int> create(String username, String text) async {
    final now = DateTime.now();
    final currentTime = DateFormat('yyyy-MM-dd HH:mm:ss').format(now);
    final db = await DB.init();

    return db.insert('hris_mobile_log', {
      'username': username,
      'content': text,
      'event_time': currentTime,
    });
  }

  // delete logs
  static Future<int> deleteAll() async {
    final db = await DB.init();

    return await db.delete('hris_mobile_log');
  }

  // Mengambil semua logs
  static Future<List<Map<String, dynamic>>> getAll() async {
    final db = await DB.init();

    return await db.query('hris_mobile_log');
  }
}
