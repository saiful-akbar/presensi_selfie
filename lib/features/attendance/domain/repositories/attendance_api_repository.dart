import 'package:presensi_selfie/features/attendance/application/dtos/location_attendance_dto.dart';
import 'package:presensi_selfie/features/attendance/application/dtos/today_attendance_dto.dart';
import 'package:presensi_selfie/features/attendance/domain/entities/location_attendance_entity.dart';
import 'package:presensi_selfie/features/attendance/domain/entities/today_attendance_entity.dart';

abstract class AttendanceApiRepository {
  // Mengambil presensi terakhir pada hari ini.
  Future<TodayAttendanceEntity?> getTodayAttendance(TodayAttendanceDTO dto);

  // Mengambil lokasi dan waktu server untuk presensi
  Future<LocationAttendanceEntity?> getLocation(LocationAttendanceDTO dto);
}
