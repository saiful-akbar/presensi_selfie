import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presensi_selfie/features/auth/application/bloc/auth_bloc.dart';
import 'package:presensi_selfie/features/location/application/usecases/get_current_location_use_case.dart';
import 'package:presensi_selfie/features/presence/application/dtos/get_presence_location_dto.dart';
import 'package:presensi_selfie/features/presence/domain/entities/presence_location_entity.dart';
import 'package:presensi_selfie/features/presence/infrastructure/apis/presence_api.dart';

class GetPresenceLocationUseCase {
  static final _api = PresenceApi();

  static Future<PresenceLocationEntity> handle(BuildContext context) async {
    final state = context.read<AuthBloc>().state;
    final username = state.user!.username;
    final authToken = state.token!;
    final location = await GetCurrentLocationUseCase.handle();

    return await _api.getLocation(
      GetPresenceLocationDTO(
        authToken: authToken,
        username: username,
        latitude: location.latitude!,
        longitude: location.longitude!,
      ),
    );
  }
}
