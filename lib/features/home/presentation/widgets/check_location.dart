import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presensi_selfie/core/utils/notification_util.dart';
import 'package:presensi_selfie/features/location/application/bloc/location_bloc.dart';
import 'package:presensi_selfie/features/location/application/bloc/location_event.dart';
import 'package:presensi_selfie/features/location/application/usecases/get_current_location_use_case.dart';
import 'package:presensi_selfie/features/location/domain/entities/location_entity.dart';

class CheckLocation extends StatefulWidget {
  const CheckLocation({super.key});

  @override
  State<CheckLocation> createState() => _CheckLocationState();
}

class _CheckLocationState extends State<CheckLocation> {
  bool locationDetected = false;

  // Mengambil data lokasi
  Future<void> _getLocation() async {
    final location = GetCurrentLocationUseCase();

    try {
      LocationEntity currentLocation = await location.handle();

      setState(() {
        locationDetected = true;
      });

      if (mounted) {
        context.read<LocationBloc>().add(SetLocation(currentLocation));
      }
    } catch (e) {
      if (mounted) {
        NotificationUtil(
          context,
          message: 'Error - Terjadi kesalahan saat mengambil lokasi.',
        );
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return locationDetected
        ? Text(
            'Lokasi terdeteksi',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w900,
              color: Theme.of(context).colorScheme.secondary,
            ),
          )
        : Text(
            'Mencari lokasi...',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w900,
              color: Theme.of(context).colorScheme.error,
            ),
          );
  }
}
