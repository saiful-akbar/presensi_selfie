import 'package:flutter/material.dart';
import 'package:presensi_selfie/core/utils/alert_loading_util.dart';
import 'package:presensi_selfie/core/utils/snackbar_notification_util.dart';
import 'package:presensi_selfie/core/widgets/app_scaffold.dart';
import 'package:presensi_selfie/features/presence/application/usecases/get_presence_location_use_case.dart';
import 'package:presensi_selfie/features/presence/domain/entities/presence_location_entity.dart';
import 'package:presensi_selfie/features/presence/presentation/widgets/address.dart';
import 'package:presensi_selfie/features/presence/presentation/widgets/button_photo.dart';
import 'package:presensi_selfie/features/presence/presentation/widgets/check.dart';
import 'package:presensi_selfie/features/presence/presentation/widgets/submit_button.dart';

class CheckInPage extends StatefulWidget {
  const CheckInPage({super.key});

  @override
  State<CheckInPage> createState() => _CheckInPageState();
}

class _CheckInPageState extends State<CheckInPage> {
  PresenceLocationEntity? _presence;

  // Mengambil data lokasi presensi.
  Future<void> _getPresenceLocation() async {
    if (mounted) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        AlertLoading(context: context, message: 'Mengambil data...');
      });
    }

    try {
      final data = await GetPresenceLocationUseCase.handle(context);

      setState(() {
        _presence = data;
      });

      if (mounted) {
        Navigator.pop(context);
      }
    } catch (e) {
      if (mounted) {
        Navigator.pop(context);
        SnackbarNotification(
          context,
          message: 'Gagal mengambil data.',
          backgroundColor: Theme.of(context).colorScheme.error,
        );
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _getPresenceLocation();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: Scaffold(
        appBar: AppBar(title: Text('Absen Masuk'), centerTitle: true),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 30,
                  children: [
                    ButtonPhoto(),
                    Check(
                      date: _presence?.timeCustomFormat,
                      time: _presence?.time,
                      address: _presence?.location,
                    ),
                    Address(address: _presence?.location),
                    SubmitButton(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
