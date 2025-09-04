import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presensi_selfie/features/auth/application/bloc/auth_event.dart';
import 'package:presensi_selfie/features/auth/application/bloc/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<SaveAuthToken>(_saveToken);
    on<SaveAuthUser>(_saveUser);
    on<DeleteAUthData>(_deleteData);
  }

  // Simpan token
  void _saveToken(SaveAuthToken event, Emitter<AuthState> emit) {
    emit(AuthValue(token: event.token, user: state.user));
  }

  // Simpan data user
  void _saveUser(SaveAuthUser event, Emitter<AuthState> emit) {
    emit(AuthValue(token: state.token, user: event.user));
  }

  // Delete data
  void _deleteData(DeleteAUthData event, Emitter<AuthState> emit) {
    emit(AuthInitial());
  }
}
