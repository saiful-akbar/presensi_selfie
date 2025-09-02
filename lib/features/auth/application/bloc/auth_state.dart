import 'package:presensi_selfie/features/auth/domain/entities/auth_user_entity.dart';

sealed class AuthState {
  final String? token;
  final AuthUserEntity? user;

  AuthState({this.token, this.user});
}

// Initial State
class AuthInitial extends AuthState {}

// Auth value
class AuthValue extends AuthState {
  AuthValue({super.token, super.user});
}
