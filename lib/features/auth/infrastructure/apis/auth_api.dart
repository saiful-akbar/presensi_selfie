import 'dart:convert';
import 'package:presensi_selfie/core/constants/api_endpoint_constant.dart';
import 'package:presensi_selfie/core/utilities/log_utility.dart';
import 'package:presensi_selfie/core/utilities/api_utility.dart';
import 'package:presensi_selfie/features/auth/domain/entities/auth_user_entity.dart';
import 'package:presensi_selfie/features/auth/domain/repositories/auth_api_repository.dart';
import 'package:presensi_selfie/features/auth/application/dtos/login_dto.dart';

class AuthApi extends AuthApiRepository {
  final _api = ApiUtility();
  final _log = LogUtility();

  @override
  Future<AuthUserEntity> login(LoginDTO dto) async {
    try {
      final response = await _api.post(
        ApiEndpointConstant.login,
        body: dto.toJson(),
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

      await _log.deleteAll();
      await _log.create(username: user['username'], message: 'Login berhasil.');

      return AuthUserEntity.fromJson(user);
    } catch (e) {
      throw Exception('Periksa kembali ID karyawan atau kata sandi anda');
    }
  }
}
