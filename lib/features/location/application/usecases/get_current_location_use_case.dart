import 'package:presensi_selfie/features/location/data/datasources/location_data.dart';
import 'package:presensi_selfie/features/location/domain/entities/location_entity.dart';

class GetCurrentLocationUseCase {
  final data = LocationData();

  Future<LocationEntity> handle() async {
    return await data.getCurrentLocation();
  }
}
