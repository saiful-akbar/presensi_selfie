class AuthShiftEntity {
  final int id;
  final String name;

  AuthShiftEntity({required this.id, required this.name});

  factory AuthShiftEntity.fromJson(Map<String, dynamic> json) {
    return AuthShiftEntity(id: json['id'], name: json['shift_name']);
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name};
  }
}
