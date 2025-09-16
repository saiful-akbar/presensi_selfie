import 'package:flutter/material.dart';
import 'package:presensi_selfie/core/utilities/location_utility.dart';
import 'package:presensi_selfie/core/utilities/notification_utility.dart';

class CheckLocation extends StatefulWidget {
  const CheckLocation({super.key});

  @override
  State<CheckLocation> createState() => _CheckLocationState();
}

class _CheckLocationState extends State<CheckLocation> {
  late LocationUtility _location;
  late NotificationUtility _notification;

  bool _locationDetected = false;

  // Mengambil data lokasi
  Future<void> _getLocation() async {
    try {
      await _location.getLocation();

      setState(() {
        _locationDetected = true;
      });
    } catch (e) {
      if (mounted) {
        _notification.error('Terjadi kesalahan saat mengambil lokasi.');
      }
    }
  }

  @override
  void initState() {
    super.initState();

    _location = LocationUtility();
    _notification = NotificationUtility(context);

    _getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return _locationDetected
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
