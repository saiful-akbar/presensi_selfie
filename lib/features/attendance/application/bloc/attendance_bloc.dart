import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presensi_selfie/features/attendance/application/bloc/attendance_event.dart';
import 'package:presensi_selfie/features/attendance/application/bloc/attendance_state.dart';

class AttendanceBloc extends Bloc<AttendanceEvent, AttendanceState> {
  AttendanceBloc() : super(AttendanceInitial()) {
    on<SaveTodayAttendance>(_saveTodayAttendance);
    on<ResetAttendance>(_resetAttendance);
  }

  // Simpan presensi terakhir hari ini.
  void _saveTodayAttendance(SaveTodayAttendance event, Emitter<AttendanceState> emit) {
    final currentState = state;

    if (currentState is AttendanceValue) {
      emit(currentState.copyWith(todayAttendance: event.value));
    } else {
      emit(AttendanceValue(todayAttendance: event.value));
    }
  }

  // Hapus presensi terakhir pada hari ini
  void _resetAttendance(ResetAttendance event, Emitter<AttendanceState> emit) {
    emit(AttendanceValue());
  }
}
