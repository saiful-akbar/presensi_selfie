import 'package:presensi_selfie/features/location/infrastructure/data/location_data.dart';

class HasFakeLocationUseCase {
  final data = LocationData();

  Future<bool> handle() async {
    return await data.isFakeLocation();
  }
}
