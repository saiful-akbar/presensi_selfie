import 'dart:convert';

import 'package:presensi_selfie/core/constants/api_endpoint_constant.dart';
import 'package:presensi_selfie/core/utils/api_util.dart';
import 'package:presensi_selfie/features/presence/application/dtos/get_presence_location_dto.dart';
import 'package:presensi_selfie/features/presence/domain/entities/presence_location_entity.dart';
import 'package:presensi_selfie/features/presence/domain/repositories/presence_api_repository.dart';

class PresenceApi implements PresenceApiRepository {
  @override
  Future<PresenceLocationEntity> getLocation(GetPresenceLocationDTO dto) async {
    try {
      final response = await Api.post(
        ApiEndpointConstant.getLocation,
        body: dto.getBodyJson(),
        authToken: dto.authToken,
      );

      final responseJson = jsonDecode(response.body);
      final responseData = responseJson['data'];
      final data = responseData is List ? responseData.first : responseData;

      return PresenceLocationEntity.fromJson(data);
    } catch (e) {
      throw Exception('Gagal mengambil data lokasi.');
    }
  }
}
