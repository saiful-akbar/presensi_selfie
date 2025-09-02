import 'package:presensi_selfie/features/auth/infrastructure/datasources/auth_data.dart';

class LogoutUseCase {
  static final _data = AuthData();

  static Future<void> handle() async {
    await _data.deleteToken();
    await _data.deleteUser();
  }
}
