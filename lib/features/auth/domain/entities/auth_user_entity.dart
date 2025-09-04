import 'package:presensi_selfie/features/auth/domain/entities/auth_area_entity.dart';
import 'package:presensi_selfie/features/auth/domain/entities/auth_departement_entity.dart';
import 'package:presensi_selfie/features/auth/domain/entities/auth_head_entity.dart';
import 'package:presensi_selfie/features/auth/domain/entities/auth_language_entity.dart';
import 'package:presensi_selfie/features/auth/domain/entities/auth_level_entity.dart';
import 'package:presensi_selfie/features/auth/domain/entities/auth_position_entity.dart';
import 'package:presensi_selfie/features/auth/domain/entities/auth_shift_entity.dart';

class AuthUserEntity {
  final String token;
  final String username;
  final String name;
  final String email;
  final bool isActive;
  final bool isAdmin;
  final bool isAi;
  final AuthLanguageEntity language;
  final String nik;
  final String firebaseId;
  final String timeZone;
  final bool isBanned;
  final String startWorkingHour;
  final String endWorkingHour;
  final String? areaChangeDate;
  final bool isUnderHo;
  final AuthLevelEntity level;
  final AuthDepartementEntity departement;
  final AuthPositionEntity position;
  final AuthAreaEntity area;
  final AuthHeadEntity head;
  final AuthShiftEntity shift;

  AuthUserEntity({
    required this.token,
    required this.username,
    required this.name,
    required this.email,
    required this.isActive,
    required this.isAdmin,
    required this.isAi,
    required this.language,
    required this.nik,
    required this.firebaseId,
    required this.timeZone,
    required this.isBanned,
    required this.startWorkingHour,
    required this.endWorkingHour,
    required this.areaChangeDate,
    required this.isUnderHo,
    required this.level,
    required this.departement,
    required this.position,
    required this.area,
    required this.head,
    required this.shift,
  });

  factory AuthUserEntity.fromJson(Map<String, dynamic> json) {
    final head = json['head'];

    return AuthUserEntity(
      token: json['token'],
      username: json['username'],
      name: json['name'],
      email: json['email'],
      isActive: json['is_active'] == 1,
      isAdmin: json['is_admin'] == 1,
      isAi: json['is_ai'] == 1,
      language: AuthLanguageEntity.fromJson(json['language']),
      nik: json['nik'],
      firebaseId: json['firebase_id'],
      timeZone: json['time_zone'],
      isBanned: json['is_banned'] == 1,
      startWorkingHour: json['start_working_hour'],
      endWorkingHour: json['end_working_hour'],
      areaChangeDate: json['area_change_date'],
      isUnderHo: json['is_under_ho'] == 1,
      level: AuthLevelEntity.fromJson(json['level']),
      departement: AuthDepartementEntity.fromJson(json['departement']),
      position: AuthPositionEntity.fromJson(json['position']),
      area: AuthAreaEntity.fromJson(json['area']),
      head: AuthHeadEntity.fromJson(head is List ? head.first : head),
      shift: AuthShiftEntity.fromJson(json['shift']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'token': token,
      'username': username,
      'name': name,
      'email': email,
      'isActive': isActive,
      'isAdmin': isAdmin,
      'isAi': isAi,
      'language': language.toJson(),
      'nik': nik,
      'firebaseId': firebaseId,
      'timeZone': timeZone,
      'isBanned': isBanned,
      'startWorkingHour': startWorkingHour,
      'endWorkingHour': endWorkingHour,
      'areaChangeDate': areaChangeDate,
      'isUnderHo': isUnderHo,
      'level': level.toJson(),
      'departement': departement.toJson(),
      'position': position.toJson(),
      'area': area.toJson(),
      'head': head.toJson(),
      'shift': shift.toJson(),
    };
  }
}
