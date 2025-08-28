import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presensi_selfie/features/auth/application/bloc/auth_event.dart';
import 'package:presensi_selfie/features/auth/application/bloc/auth_state.dart';
import 'package:presensi_selfie/features/auth/application/usecases/get_auth_token_use_case.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<SaveAuthToken>(_saveToken);
    on<CheckAuth>(_checkAuth);
  }

  // Simpan token
  void _saveToken(SaveAuthToken event, Emitter<AuthState> emit) {
    emit(AuthValue(token: event.token));
  }

  // Periksa authentikasi
  Future<void> _checkAuth(CheckAuth event, Emitter<AuthState> emit) async {
    final String? token = await GetAuthTokenUseCase.handle();

    if (token == null) {
      emit(AuthInitial());
    } else {
      emit(AuthValue(token: token));
    }
  }
}
