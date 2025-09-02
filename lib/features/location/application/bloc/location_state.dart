sealed class LocationState {
  final double? latitude;
  final double? longitude;
  final String? timestamp;

  LocationState({this.latitude, this.longitude, this.timestamp});
}

class LocationInitial extends LocationState {}

class LocationValue extends LocationState {
  LocationValue({super.latitude, super.longitude, super.timestamp});
}
