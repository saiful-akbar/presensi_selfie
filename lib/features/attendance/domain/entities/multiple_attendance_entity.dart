class MultipleAttendanceEntity {
  final bool isAllowed;
  final DateTime createdAt;

  // Constructor
  MultipleAttendanceEntity({required this.isAllowed, required this.createdAt});

  // Constructor named
  factory MultipleAttendanceEntity.fromJson(Map<String, dynamic> json) {
    return MultipleAttendanceEntity(
      isAllowed: json['is_allowed'] == 1,
      createdAt: DateTime.parse(json['created_at'] as String),
    );
  }
}
