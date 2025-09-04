class AuthAreaEntity {
  final int id;
  final String name;

  AuthAreaEntity({required this.id, required this.name});

  factory AuthAreaEntity.fromJson(Map<String, dynamic> json) {
    return AuthAreaEntity(id: json['id'], name: json['area_name']);
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name};
  }
}
