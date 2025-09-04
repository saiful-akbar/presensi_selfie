class AuthPositionEntity {
  final int id;
  final String name;

  AuthPositionEntity({required this.id, required this.name});

  factory AuthPositionEntity.fromJson(Map<String, dynamic> json) {
    return AuthPositionEntity(id: json['id'], name: json['position_name']);
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name};
  }
}
