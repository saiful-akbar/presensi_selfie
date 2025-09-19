import 'dart:convert';
import 'package:presensi_selfie/core/constants/api_endpoint_constant.dart';
import 'package:presensi_selfie/core/utilities/api_utility.dart';
import 'package:presensi_selfie/features/attendance/application/dtos/location_attendance_dto.dart';
import 'package:presensi_selfie/features/attendance/application/dtos/today_attendance_dto.dart';
import 'package:presensi_selfie/features/attendance/domain/entities/location_attendance_entity.dart';
import 'package:presensi_selfie/features/attendance/domain/entities/today_attendance_entity.dart';
import 'package:presensi_selfie/features/attendance/domain/repositories/attendance_api_repository.dart';

class AttendanceApi implements AttendanceApiRepository {
  final ApiUtility _api = ApiUtility();

  // Mengambil presensi terakhir pada hari ini.
  @override
  Future<TodayAttendanceEntity?> getTodayAttendance(TodayAttendanceDTO dto) async {
    try {
      final response = await _api.post(
        ApiEndpointConstant.getTodayAttendance,
        authToken: dto.authToken,
        parameters: dto.toJson(),
      );

      final responseJson = jsonDecode(response.body);
      final data = responseJson['data'];

      if (data is List && data.isNotEmpty) {
        return TodayAttendanceEntity.fromJson(data.first);
      }

      return null;
    } catch (e) {
      throw Exception('Gagal mengambil absensi hari ini.');
    }
  }

  // Mengambil lokasi dari server untuk presensi
  @override
  Future<LocationAttendanceEntity> getLocation(LocationAttendanceDTO dto) async {
    try {
      final response = await _api.post(
        ApiEndpointConstant.getLocation,
        authToken: dto.authToken,
        parameters: dto.toJson(),
      );

      final responseJson = jsonDecode(response.body);
      final responseData = responseJson['data'];
      final data = responseData is List ? responseData.first : responseData;

      return LocationAttendanceEntity.fromJson(data);
    } catch (e) {
      throw Exception('Terjadi kesalahan, Gagal mengambil lokasi');
    }
  }
}
