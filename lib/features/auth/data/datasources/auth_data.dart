import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:presensi_selfie/features/auth/domain/repositories/auth_repository.dart';

class AuthData implements AuthRepository {
  final _storage = FlutterSecureStorage();

  // Simpan token
  @override
  Future<void> saveToken(String token) async {
    try {
      await _storage.write(key: 'auth_token', value: token);
    } catch (e) {
      throw Exception('Gagal menyimpan token.');
    }
  }

  // Mengambil token
  @override
  Future<String?> getToken() async {
    try {
      String? token = await _storage.read(key: 'auth_token');
      return token;
    } catch (e) {
      throw Exception('Gagal mengambil token.');
    }
  }

  @override
  Future<void> deleteToken() async {
    try {
      await _storage.delete(key: 'auth_token');
    } catch (e) {
      Exception('Gagal menghapus token');
    }
  }
}
