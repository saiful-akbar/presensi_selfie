import 'dart:convert';

import 'package:http/http.dart';
import 'package:presensi_selfie/core/constants/api_endpoint_constant.dart';
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

      final responseData = jsonDecode(response.body);
      final data = responseData['data'][0];

      return AuthUserEntity(
        token: data['token'],
        username: data['username'],
        name: data['name'],
        email: data['email'],
        isActive: data['is_active'] == 1,
        isAdmin: data['is_admin'] == 1,
        nik: data['nik'],
        timeZone: data['time_zone'],
      );
    } catch (e) {
      throw Exception(
        'Login gagal. Periksa kembali ID karyawan atau kata sandi anda',
      );
    }
  }
}
