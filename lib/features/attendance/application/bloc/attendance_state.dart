import 'package:presensi_selfie/features/attendance/domain/entities/location_attendance_entity.dart';
import 'package:presensi_selfie/features/attendance/domain/entities/today_attendance_entity.dart';

sealed class AttendanceState {
  final TodayAttendanceEntity? todayAttendance;
  final LocationAttendanceEntity? location;

  const AttendanceState({this.todayAttendance, this.location});
}

// Initial state
class AttendanceInitial extends AttendanceState {}

// Value
class AttendanceValue extends AttendanceState {
  AttendanceValue({super.todayAttendance, super.location});

  AttendanceValue copyWith({
    TodayAttendanceEntity? todayAttendance,
    LocationAttendanceEntity? location,
  }) {
    return AttendanceValue(
      todayAttendance: todayAttendance ?? this.todayAttendance,
      location: location ?? this.location,
    );
  }
}
