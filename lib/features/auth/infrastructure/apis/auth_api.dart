import 'dart:convert';
import 'package:http/http.dart';
import 'package:presensi_selfie/core/constants/api_endpoint_constant.dart';
import 'package:presensi_selfie/core/utils/activity_log_util.dart';
import 'package:presensi_selfie/features/auth/domain/entities/auth_user_entity.dart';
import 'package:presensi_selfie/features/auth/domain/repositories/auth_api_repository.dart';
import 'package:presensi_selfie/features/auth/infrastructure/dtos/login_dto.dart';

class AuthApi extends AuthApiRepository {
  @override
  Future<AuthUserEntity> login(LoginDTO dto) async {
    try {
      final response = await post(
        Uri.https(ApiEndpointConstant.baseUrl, ApiEndpointConstant.login),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(dto.toJson()),
      );

      if (response.statusCode != 200) {
        throw Exception('Server error: ${response.statusCode}');
      }

      final responseJson = jsonDecode(response.body);
      final data = responseJson['data'];
      final user = data is List ? data.first : data;

      if (user['is_active'] == 0) {
        throw Exception('Akun anda tidak aktif. Silakan hubungin tim IT');
      }

      if (user['is_banned'] == 1) {
        throw Exception('Akun anda di-banned. SIlahkan hubungi tim IT');
      }

      await ActivityLog.deleteAll();
      await ActivityLog.loginSuccess(user['username']);

      return AuthUserEntity.fromJson(user);
    } catch (e) {
      throw Exception(
        'Login gagal, Periksa kembali ID karyawan atau kata sandi anda',
      );
    }
  }
}
