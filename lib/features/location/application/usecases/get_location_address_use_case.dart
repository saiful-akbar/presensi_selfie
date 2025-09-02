import 'package:presensi_selfie/features/auth/infrastructure/apis/location_api.dart';
import 'package:presensi_selfie/features/location/domain/entities/location_entity.dart';

class GetLocationAddressUseCase {
  final api = LocationApi();

  Future<String> handle(LocationEntity entity) async {
    return await api.getLocationAddress(entity);
  }
}
