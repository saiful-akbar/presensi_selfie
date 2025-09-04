import 'package:presensi_selfie/features/auth/domain/entities/auth_departement_entity.dart';

class AuthHeadEntity {
  final String nik;
  final String name;
  final String email;
  final AuthDepartementEntity department;

  AuthHeadEntity({
    required this.nik,
    required this.name,
    required this.email,
    required this.department,
  });

  factory AuthHeadEntity.fromJson(Map<String, dynamic> json) {
    final departement = json['departement'];

    return AuthHeadEntity(
      nik: json['nik'],
      name: json['name'],
      email: json['email'],
      department: AuthDepartementEntity.fromJson(
        departement is List ? departement.first : departement,
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nik': nik,
      'name': name,
      'email': email,
      'department': department.toJson(),
    };
  }
}
