import 'package:presensi_selfie/features/auth/domain/entities/auth_area_entity.dart';
import 'package:presensi_selfie/features/auth/domain/entities/auth_department_entity.dart';
import 'package:presensi_selfie/features/auth/domain/entities/auth_language_entity.dart';
import 'package:presensi_selfie/features/auth/domain/entities/auth_level_entity.dart';
import 'package:presensi_selfie/features/auth/domain/entities/auth_position_entity.dart';
import 'package:presensi_selfie/features/auth/domain/entities/auth_shift_entity.dart';
import 'package:presensi_selfie/features/auth/domain/entities/auth_user_entity.dart';

sealed class AuthEvent {}

// simpan token
class SaveAuthToken extends AuthEvent {
  final String value;

  SaveAuthToken(this.value);
}

// simpan data user
class SaveAuthUser extends AuthEvent {
  final AuthUserEntity value;

  SaveAuthUser(this.value);
}

// simpan data language
class SaveAuthLanguage extends AuthEvent {
  final AuthLanguageEntity value;

  SaveAuthLanguage(this.value);
}

// simpan data Level
class SaveAuthLevel extends AuthEvent {
  final AuthLevelEntity value;

  SaveAuthLevel(this.value);
}

// simpan data Department
class SaveAuthDepartment extends AuthEvent {
  final AuthDepartmentEntity value;

  SaveAuthDepartment(this.value);
}

// simpan data Position
class SaveAuthPosition extends AuthEvent {
  final AuthPositionEntity value;

  SaveAuthPosition(this.value);
}

// simpan data Area
class SaveAuthArea extends AuthEvent {
  final AuthAreaEntity value;

  SaveAuthArea(this.value);
}

// simpan data Shift
class SaveAuthShift extends AuthEvent {
  final AuthShiftEntity value;

  SaveAuthShift(this.value);
}

// Hapus data auth
class DeleteAUthData extends AuthEvent {}
