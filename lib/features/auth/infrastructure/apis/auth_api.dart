import 'dart:convert';

import 'package:presensi_selfie/core/constants/api_endpoint_constant.dart';
import 'package:presensi_selfie/core/utilities/api_utility.dart';
import 'package:presensi_selfie/core/utilities/log_utility.dart';
import 'package:presensi_selfie/features/auth/application/dtos/login_dto.dart';
import 'package:presensi_selfie/features/auth/application/dtos/update_area_dto.dart';
import 'package:presensi_selfie/features/auth/domain/repositories/auth_api_repository.dart';

class AuthApi extends AuthApiRepository {
  final _api = ApiUtility();
  final _log = LogUtility();

  // Login user.
  @override
  Future<Map<String, dynamic>> login(LoginDTO dto) async {
    try {
      final response = await _api.post(ApiEndpointConstant.login, body: dto.toJson());

      if (response.statusCode != 200) {
        throw Exception('Server error: ${response.statusCode}');
      }

      final responseJson = jsonDecode(response.body);
      final responseData = responseJson['data'];
      final data = responseData is List ? responseData.first : responseData;

      // Periksa apakah user aktif atau tidak
      if (data['is_active'] == 0) {
        throw Exception('Akun anda tidak aktif. Silakan hubungin tim IT');
      }

      // Periksa apakah user dibanned atau tidak.
      if (data['is_banned'] == 1) {
        throw Exception('Akun anda di-banned. SIlahkan hubungi tim IT');
      }

      // Hapus log aktifitas yang sebelumnya dan buat baru.
      await _log.deleteAll();
      await _log.create(username: data['username'], message: 'Login berhasil.');

      return data;
    } catch (e) {
      throw Exception('Periksa kembali ID karyawan atau kata sandi anda');
    }
  }

  // Update area untuk SA
  @override
  Future<Map<String, dynamic>> updateArea(UpdateAreaDTO dto) async {
    try {
      final response = await _api.post(
        ApiEndpointConstant.updateArea,
        authToken: dto.authToken,
        parameters: dto.toJson(),
      );

      final json = jsonDecode(response.body);

      if (json['success']) {
        return json;
      }

      throw Exception('Terjadi kesalahan, Gagal memperbaui area.');
    } catch (e) {
      throw Exception('Terjadi kesalahan, Gagal memperbaui area: ${e.toString()}');
    }
  }
}
