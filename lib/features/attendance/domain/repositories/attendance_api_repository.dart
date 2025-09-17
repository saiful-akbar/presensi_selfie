import 'package:presensi_selfie/features/attendance/application/dtos/get_today_attendance_dto.dart';
import 'package:presensi_selfie/features/attendance/domain/entities/today_attendance_entity.dart';

abstract class AttendanceApiRepository {
  // Mengambil presensi terakhir pada hari ini.
  Future<TodayAttendanceEntity> getTodayAttendance(GetTodayAttendanceDTO dto);
}
