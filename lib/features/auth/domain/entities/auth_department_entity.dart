class AuthDepartmentEntity {
  final int id;
  final String code;
  final String name;

  AuthDepartmentEntity({required this.id, required this.code, required this.name});

  factory AuthDepartmentEntity.fromJson(Map<String, dynamic> json) {
    return AuthDepartmentEntity(
      id: json['id'],
      code: json['departement_code'],
      name: json['departement_name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'code': code, 'name': name};
  }
}
