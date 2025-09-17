class GetTodayAttendanceDTO {
  final String authToken;
  final String username;

  GetTodayAttendanceDTO({required this.authToken, required this.username});

  // Merubah ke format json
  Map<String, String> toJson() {
    return {'username': username};
  }
}
