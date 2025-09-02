import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:presensi_selfie/features/auth/domain/entities/auth_user_entity.dart';
import 'package:presensi_selfie/features/auth/domain/repositories/auth_data_repository.dart';

class AuthData implements AuthDataRepository {
  final _storage = FlutterSecureStorage();

  // Simpan token.
  @override
  Future<void> saveToken(String token) async {
    try {
      await _storage.write(key: 'auth_token', value: token);
    } catch (e) {
      throw Exception('Gagal menyimpan token.');
    }
  }

  // Mengambil token.
  @override
  Future<String?> getToken() async {
    try {
      String? token = await _storage.read(key: 'auth_token');
      return token;
    } catch (e) {
      throw Exception('Gagal mengambil token.');
    }
  }

  // Hapus token dari storage.
  @override
  Future<void> deleteToken() async {
    try {
      await _storage.delete(key: 'auth_token');
    } catch (e) {
      Exception('Gagal menghapus token');
    }
  }

  @override
  Future<void> saveUser(AuthUserEntity entity) async {
    try {
      await _storage.write(
        key: 'auth_user',
        value: jsonEncode(entity.toJson()),
      );
    } catch (e) {
      throw Exception('Gagal menyimpan data user pada storage');
    }
  }

  // Mengambil data user.
  @override
  Future<AuthUserEntity?> getUser() async {
    try {
      final userJson = await _storage.read(key: 'auth_user');

      if (userJson == null) {
        return null;
      }

      return AuthUserEntity.fromJson(jsonDecode(userJson));
    } catch (e) {
      throw Exception('Gagal mengambil data user.');
    }
  }

  // Menghapus data user
  @override
  Future<void> deleteUser() async {
    try {
      await _storage.delete(key: 'auth_user');
    } catch (e) {
      Exception('Gagal menghapus data user');
    }
  }
}
