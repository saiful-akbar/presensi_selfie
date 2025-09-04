class AuthLevelEntity {
  final int id;
  final String code;
  final String name;

  AuthLevelEntity({required this.id, required this.code, required this.name});

  factory AuthLevelEntity.fromJson(Map<String, dynamic> json) {
    return AuthLevelEntity(
      id: json['id'],
      code: json['level_code'],
      name: json['level_name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'code': code, 'name': name};
  }
}
