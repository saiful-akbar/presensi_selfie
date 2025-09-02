import 'package:presensi_selfie/features/app/domain/entities/app_entity.dart';
import 'package:presensi_selfie/features/app/infrastructure/apis/app_api.dart';

class GetVersionUseCase {
  final _api = AppApi();

  Future<AppEntity> handle() async {
    return await _api.checkVersion();
  }
}
