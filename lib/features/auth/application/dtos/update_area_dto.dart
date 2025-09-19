class UpdateAreaDTO {
  final String authToken;
  final String username;
  final int areaId;

  const UpdateAreaDTO({required this.authToken, required this.username, required this.areaId});

  // Mengambil parameter dalam format json
  Map<String, dynamic> toJson() {
    return {'username': username.toString(), 'area_id': areaId.toString()};
  }
}
