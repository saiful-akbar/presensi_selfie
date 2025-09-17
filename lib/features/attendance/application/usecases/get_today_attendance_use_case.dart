import 'package:presensi_selfie/features/attendance/application/dtos/get_today_attendance_dto.dart';
import 'package:presensi_selfie/features/attendance/domain/entities/today_attendance_entity.dart';
import 'package:presensi_selfie/features/attendance/infrastructure/apis/attendance_api.dart';

class GetTodayAttendanceUseCase {
  static final AttendanceApi _api = AttendanceApi();

  static Future<TodayAttendanceEntity> handle(GetTodayAttendanceDTO dto) async {
    return await _api.getTodayAttendance(dto);
  }
}
