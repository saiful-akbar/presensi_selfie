import 'package:presensi_selfie/features/auth/infrastructure/datasources/auth_data.dart';

class SaveAuthTokenUseCase {
  static final _data = AuthData();

  static Future<void> handle(String token) async {
    await _data.saveToken(token);
  }
}
