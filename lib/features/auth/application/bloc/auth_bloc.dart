import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presensi_selfie/features/auth/application/bloc/auth_event.dart';
import 'package:presensi_selfie/features/auth/application/bloc/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<SaveAuthToken>(_saveToken);
    on<SaveAuthUser>(_saveUser);
    on<SaveAuthLanguage>(_saveLanguage);
    on<SaveAuthLevel>(_saveLevel);
    on<SaveAuthDepartment>(_saveDepartment);
    on<SaveAuthPosition>(_savePosition);
    on<SaveAuthArea>(_saveArea);
    on<SaveAuthShift>(_saveShift);
    on<DeleteAUthData>(_deleteData);
  }

  // Simpan token
  void _saveToken(SaveAuthToken event, Emitter<AuthState> emit) {
    final currentState = state;

    if (currentState is AuthValue) {
      emit(currentState.copyWith(token: event.value));
    } else {
      emit(AuthValue(token: event.value));
    }
  }

  // Simpan data user
  void _saveUser(SaveAuthUser event, Emitter<AuthState> emit) {
    final currentState = state;

    if (currentState is AuthValue) {
      emit(currentState.copyWith(user: event.value));
    } else {
      emit(AuthValue(user: event.value));
    }
  }

  // Simpan data language
  void _saveLanguage(SaveAuthLanguage event, Emitter<AuthState> emit) {
    final currentState = state;

    if (currentState is AuthValue) {
      emit(currentState.copyWith(language: event.value));
    } else {
      emit(AuthValue(language: event.value));
    }
  }

  // Simpan data level
  void _saveLevel(SaveAuthLevel event, Emitter<AuthState> emit) {
    final currentState = state;

    if (currentState is AuthValue) {
      emit(currentState.copyWith(level: event.value));
    } else {
      emit(AuthValue(level: event.value));
    }
  }

  // Simpan data department
  void _saveDepartment(SaveAuthDepartment event, Emitter<AuthState> emit) {
    final currentState = state;

    if (currentState is AuthValue) {
      emit(currentState.copyWith(department: event.value));
    } else {
      emit(AuthValue(department: event.value));
    }
  }

  // Simpan data position
  void _savePosition(SaveAuthPosition event, Emitter<AuthState> emit) {
    final currentState = state;

    if (currentState is AuthValue) {
      emit(currentState.copyWith(position: event.value));
    } else {
      emit(AuthValue(position: event.value));
    }
  }

  // Simpan data area
  void _saveArea(SaveAuthArea event, Emitter<AuthState> emit) {
    final currentState = state;

    if (currentState is AuthValue) {
      emit(currentState.copyWith(area: event.value));
    } else {
      emit(AuthValue(area: event.value));
    }
  }

  // Simpan data shift
  void _saveShift(SaveAuthShift event, Emitter<AuthState> emit) {
    final currentState = state;

    if (currentState is AuthValue) {
      emit(currentState.copyWith(shift: event.value));
    } else {
      emit(AuthValue(shift: event.value));
    }
  }

  // Delete data
  void _deleteData(DeleteAUthData event, Emitter<AuthState> emit) {
    emit(AuthInitial());
  }
}
