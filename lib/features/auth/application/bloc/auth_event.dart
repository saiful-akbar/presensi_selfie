import 'package:presensi_selfie/features/auth/domain/entities/auth_user_entity.dart';

sealed class AuthEvent {}

// simpan token
class SaveAuthToken extends AuthEvent {
  final String token;

  SaveAuthToken(this.token);
}

// simpan data user
class SaveAuthUser extends AuthEvent {
  final AuthUserEntity user;

  SaveAuthUser(this.user);
}

// Check auth
class CheckAuth extends AuthEvent {}
