class PresenceLocationEntity {
  final String time;
  final String timeCustomFormat;
  final String location;
  final String timeStandarFormat;

  PresenceLocationEntity({
    required this.time,
    required this.timeCustomFormat,
    required this.location,
    required this.timeStandarFormat,
  });

  factory PresenceLocationEntity.fromJson(Map<String, dynamic> json) {
    return PresenceLocationEntity(
      time: json['time'],
      timeCustomFormat: json['time_custom_format'],
      location: json['location'],
      timeStandarFormat: json['time_standar_format'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'time': time,
      'time_custom_format': timeCustomFormat,
      'location': location,
      'time_standar_format': timeStandarFormat,
    };
  }
}
