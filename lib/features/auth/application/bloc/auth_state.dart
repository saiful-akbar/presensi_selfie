import 'package:presensi_selfie/features/auth/domain/entities/auth_area_entity.dart';
import 'package:presensi_selfie/features/auth/domain/entities/auth_department_entity.dart';
import 'package:presensi_selfie/features/auth/domain/entities/auth_language_entity.dart';
import 'package:presensi_selfie/features/auth/domain/entities/auth_level_entity.dart';
import 'package:presensi_selfie/features/auth/domain/entities/auth_position_entity.dart';
import 'package:presensi_selfie/features/auth/domain/entities/auth_shift_entity.dart';
import 'package:presensi_selfie/features/auth/domain/entities/auth_user_entity.dart';

sealed class AuthState {
  final String? token;
  final AuthUserEntity? user;
  final AuthLanguageEntity? language;
  final AuthLevelEntity? level;
  final AuthDepartmentEntity? department;
  final AuthPositionEntity? position;
  final AuthAreaEntity? area;
  final AuthShiftEntity? shift;

  AuthState({
    this.token,
    this.user,
    this.language,
    this.level,
    this.department,
    this.position,
    this.area,
    this.shift,
  });
}

// Initial State
class AuthInitial extends AuthState {}

// Auth value
class AuthValue extends AuthState {
  AuthValue({
    super.token,
    super.user,
    super.language,
    super.level,
    super.department,
    super.position,
    super.area,
    super.shift,
  });

  AuthValue copyWith({
    String? token,
    AuthUserEntity? user,
    AuthLanguageEntity? language,
    AuthLevelEntity? level,
    AuthDepartmentEntity? department,
    AuthPositionEntity? position,
    AuthAreaEntity? area,
    AuthShiftEntity? shift,
  }) {
    return AuthValue(
      token: token ?? this.token,
      user: user ?? this.user,
      language: language ?? this.language,
      level: level ?? this.level,
      department: department ?? this.department,
      position: position ?? this.position,
      area: area ?? this.area,
      shift: shift ?? this.shift,
    );
  }
}
