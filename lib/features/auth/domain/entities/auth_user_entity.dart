class AuthUserEntity {
  final String token;
  final String username;
  final String name;
  final String email;
  final bool isActive;
  final bool isAdmin;
  final String nik;
  final String timeZone;

  AuthUserEntity({
    required this.token,
    required this.username,
    required this.name,
    required this.email,
    required this.isActive,
    required this.isAdmin,
    required this.nik,
    required this.timeZone,
  });

  factory AuthUserEntity.fromJson(Map<String, dynamic> json) {
    return AuthUserEntity(
      token: json['token'],
      username: json['username'],
      name: json['name'],
      email: json['email'],
      isActive: json['isActive'],
      isAdmin: json['isAdmin'],
      nik: json['nik'],
      timeZone: json['timeZone'],
    );
  }

  // Fotmat ke bentuk Map (json)
  Map<String, dynamic> toJson() {
    return {
      'token': token,
      'username': username,
      'name': name,
      'email': email,
      'isActive': isActive,
      'isAdmin': isAdmin,
      'nik': nik,
      'timeZone': timeZone,
    };
  }
}
