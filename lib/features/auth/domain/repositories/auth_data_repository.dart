import 'package:presensi_selfie/features/auth/domain/entities/auth_user_entity.dart';

abstract class AuthDataRepository {
  // Simpan token ke storage.
  Future<void> saveToken(String token);

  // Mengambil token
  Future<String?> getToken();

  // Hapus token
  Future<void> deleteToken();

  // Simpan data user pada secure storage
  Future<void> saveUser(AuthUserEntity entity);

  // Mangambil data user
  Future<AuthUserEntity?> getUser();

  // Menghapus data user
  Future<void> deleteUser();
}
