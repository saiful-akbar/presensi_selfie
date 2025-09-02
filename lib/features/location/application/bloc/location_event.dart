import 'package:presensi_selfie/features/location/domain/entities/location_entity.dart';

sealed class LocationEvent {}

class SetLocation extends LocationEvent {
  final LocationEntity location;

  SetLocation(this.location);
}
