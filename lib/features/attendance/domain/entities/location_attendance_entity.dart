class LocationAttendanceEntity {
  final String time;
  final String timeCustomFormat;
  final String location;
  final String timeStandarFormat;

  // Constructor
  const LocationAttendanceEntity({
    required this.time,
    required this.timeCustomFormat,
    required this.location,
    required this.timeStandarFormat,
  });

  // Constractor named fromJson
  factory LocationAttendanceEntity.fromJson(Map<String, dynamic> json) {
    return LocationAttendanceEntity(
      time: json['time'] ?? '',
      timeCustomFormat: json['time_custom_format'] ?? '',
      location: json['location'] ?? '',
      timeStandarFormat: json['time_standar_format'] ?? '',
    );
  }
}
