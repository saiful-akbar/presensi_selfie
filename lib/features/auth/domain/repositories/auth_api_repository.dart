import 'package:presensi_selfie/features/auth/domain/entities/auth_user_entity.dart';
import 'package:presensi_selfie/features/auth/infrastructure/dtos/login_dto.dart';

abstract class AuthApiRepository {
  Future<AuthUserEntity> login(LoginDTO dto);
}
