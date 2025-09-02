import 'package:presensi_selfie/features/app/domain/entities/app_entity.dart';

abstract class AppApiRepository {
  Future<AppEntity> checkVersion();
}
