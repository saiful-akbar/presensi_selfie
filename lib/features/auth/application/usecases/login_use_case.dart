import 'package:presensi_selfie/features/auth/domain/entities/auth_user_entity.dart';
import 'package:presensi_selfie/features/auth/infrastructure/apis/auth_api.dart';
import 'package:presensi_selfie/features/auth/application/dtos/login_dto.dart';

class LoginUseCase {
  static final AuthApi _api = AuthApi();

  static Future<AuthUserEntity?> handle(LoginDTO dto) async {
    return await _api.login(dto);
  }
}
