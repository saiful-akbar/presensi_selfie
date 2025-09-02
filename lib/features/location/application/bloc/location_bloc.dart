import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presensi_selfie/features/location/application/bloc/location_event.dart';
import 'package:presensi_selfie/features/location/application/bloc/location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  LocationBloc() : super(LocationInitial()) {
    on<SetLocation>(_setLocation);
  }

  // Set location
  void _setLocation(SetLocation event, Emitter<LocationState> emit) {
    emit(
      LocationValue(
        latitude: event.location.latitude,
        longitude: event.location.longitude,
        timestamp: event.location.timestamp,
      ),
    );
  }
}
