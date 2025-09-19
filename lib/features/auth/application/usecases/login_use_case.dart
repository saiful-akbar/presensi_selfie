import 'package:presensi_selfie/features/auth/application/dtos/login_dto.dart';
import 'package:presensi_selfie/features/auth/infrastructure/apis/auth_api.dart';

class LoginUseCase {
  static final AuthApi _api = AuthApi();

  static Future<Map<String, dynamic>> handle(LoginDTO dto) async {
    return await _api.login(dto);
  }
}
