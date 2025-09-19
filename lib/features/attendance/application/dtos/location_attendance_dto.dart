class LocationAttendanceDTO {
  final String authToken;
  final String username;
  final String latitude;
  final String longitude;

  // Constructor
  const LocationAttendanceDTO(
    this.authToken, {
    required this.username,
    required this.latitude,
    required this.longitude,
  });

  // Mengambil parameter langsung dalam format json
  Map<String, String> toJson() {
    return {'username': username, 'lat': latitude, 'long': longitude};
  }
}
