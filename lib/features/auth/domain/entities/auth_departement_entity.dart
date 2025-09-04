class AuthDepartementEntity {
  final int id;
  final String code;
  final String name;

  AuthDepartementEntity({
    required this.id,
    required this.code,
    required this.name,
  });

  factory AuthDepartementEntity.fromJson(Map<String, dynamic> json) {
    return AuthDepartementEntity(
      id: json['id'],
      code: json['departement_code'],
      name: json['departement_name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'code': code, 'name': name};
  }
}
