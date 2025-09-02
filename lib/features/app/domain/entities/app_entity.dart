class AppEntity {
  final String appName;
  final String appVersion;
  final bool isMaintenance;
  final bool isUrgentUpdate;

  AppEntity({
    required this.appName,
    required this.appVersion,
    required this.isMaintenance,
    required this.isUrgentUpdate,
  });

  factory AppEntity.fromJson(Map<String, dynamic> json) {
    return AppEntity(
      appName: json['app_name'],
      appVersion: json['app_version'],
      isMaintenance: json['is_maintenance'] == 1,
      isUrgentUpdate: json['is_urgent_update'] == 1,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'app_name': appName,
      'app_version': appVersion,
      'is_maintenance': isMaintenance ? 1 : 0,
      'is_urgent_update': isUrgentUpdate ? 1 : 0,
    };
  }
}
