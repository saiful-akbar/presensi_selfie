import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presensi_selfie/features/attendance/application/bloc/attendance_bloc.dart';
import 'package:presensi_selfie/features/attendance/application/bloc/attendance_event.dart';
import 'package:presensi_selfie/features/auth/application/bloc/auth_bloc.dart';
import 'package:presensi_selfie/features/auth/application/bloc/auth_event.dart';

class LogoutUseCase {
  static void handle(BuildContext context) {
    context.read<AuthBloc>().add(DeleteAUthData());
    context.read<AttendanceBloc>().add(ResetAttendance());
  }
}
