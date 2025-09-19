class AuthUserEntity {
  final String token;
  final String username;
  final String name;
  final String email;
  final bool isActive;
  final bool isAdmin;
  final bool isAi;
  final String nik;
  final String firebaseId;
  final String timeZone;
  final bool isBanned;
  final String startWorkingHour;
  final String endWorkingHour;
  final DateTime? areaChangeDate;
  final bool isUnderHo;

  AuthUserEntity({
    required this.token,
    required this.username,
    required this.name,
    required this.email,
    required this.isActive,
    required this.isAdmin,
    required this.isAi,
    required this.nik,
    required this.firebaseId,
    required this.timeZone,
    required this.isBanned,
    required this.startWorkingHour,
    required this.endWorkingHour,
    required this.areaChangeDate,
    required this.isUnderHo,
  });

  factory AuthUserEntity.fromJson(Map<String, dynamic> json) {
    final changeDate = json['area_change_date'];
    final areaChangeDate = changeDate != null ? DateTime.parse(changeDate) : null;

    return AuthUserEntity(
      token: json['token'],
      username: json['username'],
      name: json['name'],
      email: json['email'],
      isActive: json['is_active'] == 1,
      isAdmin: json['is_admin'] == 1,
      isAi: json['is_ai'] == 1,
      nik: json['nik'],
      firebaseId: json['firebase_id'],
      timeZone: json['time_zone'],
      isBanned: json['is_banned'] == 1,
      startWorkingHour: json['start_working_hour'],
      endWorkingHour: json['end_working_hour'],
      areaChangeDate: areaChangeDate,
      isUnderHo: json['is_under_ho'] == 1,
    );
  }
}
