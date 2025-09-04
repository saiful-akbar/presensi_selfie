import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presensi_selfie/features/auth/application/bloc/auth_bloc.dart';
import 'package:presensi_selfie/features/auth/application/bloc/auth_event.dart';

class LogoutUseCase {
  static void handle(BuildContext context) {
    context.read<AuthBloc>().add(DeleteAUthData());
  }
}
