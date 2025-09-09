import 'package:presensi_selfie/features/location/infrastructure/data/location_data.dart';
import 'package:presensi_selfie/features/location/domain/entities/location_entity.dart';

class GetCurrentLocationUseCase {
  static final _data = LocationData();

  static Future<LocationEntity> handle() async {
    return await _data.getCurrentLocation();
  }
}
