import 'package:presensi_selfie/features/location/infrastructure/data/location_data.dart';

class HasLocationPermissionUseCase {
  final data = LocationData();

  Future<bool> handle() async {
    return await data.isPermissionAllowed();
  }
}
