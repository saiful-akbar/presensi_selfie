import 'dart:convert';

import 'package:http/http.dart';
import 'package:presensi_selfie/core/constants/api_endpoint_constant.dart';
import 'package:presensi_selfie/features/app/domain/entities/app_entity.dart';
import 'package:presensi_selfie/features/app/domain/repositories/app_api_repository.dart';

class AppApi extends AppApiRepository {
  @override
  Future<AppEntity> checkVersion() async {
    try {
      final url = Uri.https(
        ApiEndpointConstant.baseUrl,
        ApiEndpointConstant.checkVersion,
      );

      final response = await get(
        url,
        headers: {'Content-Type': 'application/json'},
      );

      final responseJson = jsonDecode(response.body);

      return AppEntity.fromJson(responseJson['data']);
    } catch (e) {
      throw Exception('Gagal mengambil data version.');
    }
  }
}
