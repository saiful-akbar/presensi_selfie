import 'package:presensi_selfie/features/auth/application/dtos/update_area_dto.dart';
import 'package:presensi_selfie/features/auth/infrastructure/apis/auth_api.dart';

class UpdateAreaUseCase {
  static final _api = AuthApi();

  static Future<void> handle(UpdateAreaDTO dto) async {
    await _api.updateArea(dto);
  }
}
