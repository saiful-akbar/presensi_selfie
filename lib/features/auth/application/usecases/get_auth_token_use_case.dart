import 'package:presensi_selfie/features/auth/infrastructure/datasources/auth_data.dart';

class GetAuthTokenUseCase {
  static final AuthData _data = AuthData();

  static Future<String?> handle() async {
    return await _data.getToken();
  }
}
