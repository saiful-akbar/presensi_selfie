import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:presensi_selfie/features/location/domain/entities/location_entity.dart';
import 'package:presensi_selfie/features/location/domain/repositories/location_repository.dart';

class LocationData implements LocationRepository {
  // Periksa apakah layanan lokasi pada perangkat aktif atau tidak.
  @override
  Future<bool> isServiceEnabled() async {
    return await Geolocator.isLocationServiceEnabled();
  }

  // Periksa perizinan
  @override
  Future<bool> isPermissionAllowed() async {
    var permission = await Permission.location.status;

    if (permission.isDenied) {
      permission = await Permission.location.request();

      if (permission.isDenied) {
        return false;
      }
    }

    if (permission.isPermanentlyDenied) {
      return false;
    }

    return true;
  }

  // Periksa apakah lokasi palsu.
  @override
  Future<bool> isFakeLocation() async {
    Position position = await Geolocator.getCurrentPosition();

    if (position.isMocked) {
      return true;
    }

    return false;
  }

  // Mengambil data lokasi
  @override
  Future<LocationEntity> getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition();

    return LocationEntity(
      latitude: position.latitude,
      longitude: position.longitude,
      timestamp: position.timestamp.toString(),
    );
  }
}
