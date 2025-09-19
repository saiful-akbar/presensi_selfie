import 'package:presensi_selfie/features/attendance/application/dtos/location_attendance_dto.dart';
import 'package:presensi_selfie/features/attendance/domain/entities/location_attendance_entity.dart';
import 'package:presensi_selfie/features/attendance/infrastructure/apis/attendance_api.dart';

class GetLocationAttendance {
  static final _api = AttendanceApi();

  static Future<LocationAttendanceEntity> handle(LocationAttendanceDTO dto) async {
    return await _api.getLocation(dto);
  }
}
