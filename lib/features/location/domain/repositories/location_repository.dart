import 'package:presensi_selfie/features/location/domain/entities/location_entity.dart';

abstract class LocationRepository {
  Future<bool> isPermissionAllowed();
  Future<bool> isFakeLocation();
  Future<bool> isServiceEnabled();
  Future<LocationEntity> getCurrentLocation();
}
