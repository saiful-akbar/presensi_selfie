import 'package:presensi_selfie/features/location/data/datasources/location_data.dart';

class HasLocationPermissionUseCase {
  final data = LocationData();

  Future<bool> handle() async {
    return await data.isPermissionAllowed();
  }
}
