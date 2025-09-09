import 'package:presensi_selfie/features/presence/application/dtos/get_presence_location_dto.dart';
import 'package:presensi_selfie/features/presence/domain/entities/presence_location_entity.dart';

abstract class PresenceApiRepository {
  // Mengambil data lokasi
  Future<PresenceLocationEntity> getLocation(GetPresenceLocationDTO dto);
}
