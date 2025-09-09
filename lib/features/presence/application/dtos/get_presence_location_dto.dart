class GetPresenceLocationDTO {
  final String authToken;
  final String username;
  final double latitude;
  final double longitude;

  GetPresenceLocationDTO({
    required this.authToken,
    required this.username,
    required this.latitude,
    required this.longitude,
  });

  Map<String, dynamic> getBodyJson() {
    return {'username': username, 'lat': latitude, 'long': longitude};
  }
}
