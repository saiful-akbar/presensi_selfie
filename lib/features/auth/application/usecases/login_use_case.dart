import 'package:presensi_selfie/features/auth/domain/entities/auth_user_entity.dart';
import 'package:presensi_selfie/features/auth/infrastructure/apis/auth_api.dart';
import 'package:presensi_selfie/features/auth/infrastructure/datasources/auth_data.dart';
import 'package:presensi_selfie/features/auth/infrastructure/dtos/login_dto.dart';

class LoginUseCase {
  final LoginDTO _dto;
  final AuthApi api = AuthApi();
  final AuthData data = AuthData();

  LoginUseCase(this._dto);

  Future<AuthUserEntity?> handle() async {
    return await api.login(_dto);
  }
}
