import 'package:presensi_selfie/features/attendance/domain/entities/location_attendance_entity.dart';
import 'package:presensi_selfie/features/attendance/domain/entities/today_attendance_entity.dart';

sealed class AttendanceEvent {}

// Simpan presensi terakhir hari ini
class SaveTodayAttendance extends AttendanceEvent {
  final TodayAttendanceEntity value;

  SaveTodayAttendance(this.value);
}

// Simpan lokasi untuk presensi.
class SaveLocationAttendance extends AttendanceEvent {
  final LocationAttendanceEntity value;

  SaveLocationAttendance(this.value);
}

// Hapus presensi terakhir hari ini
class ResetAttendance extends AttendanceEvent {}
