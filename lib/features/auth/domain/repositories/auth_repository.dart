abstract class AuthRepository {
  // Simpan token ke storage.
  Future<void> saveToken(String token);

  // Mengambil token
  Future<String?> getToken();

  // Hapus token
  Future<void> deleteToken();
}
