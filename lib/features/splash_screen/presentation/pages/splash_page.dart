import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:presensi_selfie/core/constants/app_constant.dart';
import 'package:presensi_selfie/core/utils/alert_util.dart';
import 'package:presensi_selfie/core/utils/internet_util.dart';
import 'package:presensi_selfie/core/widgets/app_scaffold.dart';
import 'package:presensi_selfie/features/app/application/usecases/get_version_use_case.dart';
import 'package:presensi_selfie/features/location/application/bloc/location_bloc.dart';
import 'package:presensi_selfie/features/location/application/bloc/location_event.dart';
import 'package:presensi_selfie/features/location/application/usecases/get_current_location_use_case.dart';
import 'package:presensi_selfie/features/location/application/usecases/has_fake_location_use_case.dart';
import 'package:presensi_selfie/features/location/application/usecases/has_location_permission_use_case.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  // Periksa koneksi internet
  Future<bool> _checkInternetConnection() async {
    final isConnected = await InternetUtil.isConnected();

    if (!isConnected) {
      if (mounted) {
        Alert(
          context,
          title: Text('Informasi'),
          content: Text('Tidak ada koneksi internet.'),
          actions: [
            FilledButton(
              onPressed: () => SystemNavigator.pop(),
              child: Text('Tutup'),
            ),
          ],
        );

        return false;
      }
    }

    return true;
  }

  // Periksa akses kamera
  Future<bool> _checkCameraPermission() async {
    var permission = await Permission.camera.status;

    // Minta izin kalau ditolak
    if (permission.isDenied) {
      permission = await Permission.camera.request();
    }

    // Jika akses ditolah buka pengaturan.
    if (permission.isDenied || permission.isPermanentlyDenied) {
      if (mounted) {
        Alert(
          context,
          title: Text('Informasi'),
          content: Text('Izin kamera ditolak!'),
          actions: [
            FilledButton(
              onPressed: () => openAppSettings(),
              child: Text('Buka pengaturan'),
            ),
          ],
        );
      }

      return false;
    }

    if (mounted) {
      context.read<LocationBloc>().add(
        SetLocation(await GetCurrentLocationUseCase.handle()),
      );
    }

    return true;
  }

  // Periksa izin lokasi
  Future<bool> _checkLocationPermission() async {
    final hasPermission = HasLocationPermissionUseCase();
    final hasFakeLocation = HasFakeLocationUseCase();

    // Periksa izin lokasi pada aplikasi
    if (!await hasPermission.handle()) {
      if (mounted) {
        Alert(
          context,
          title: Text('Informasi'),
          content: Text('Izin lokasi ditolak!'),
          actions: [
            FilledButton(
              onPressed: () => openAppSettings(),
              child: Text('Buka pengaturan'),
            ),
          ],
        );
      }

      return false;
    }

    // Periksa apakah menggunakan lokasi palsu atau tidak
    if (await hasFakeLocation.handle()) {
      if (mounted) {
        Alert(
          context,
          title: Text('Warning'),
          content: Text('Anda terdeteksi menggunakan fake GPS!'),
        );
      }

      return false;
    }

    return true;
  }

  // Periksa version
  Future<bool> _checkVersion() async {
    try {
      final useCase = GetVersionUseCase();
      final app = await useCase.handle();

      // Periksa apakah sedang ada maintenance atau tidak.
      if (app.isMaintenance) {
        if (mounted) {
          Alert(
            context,
            title: Text('Informasi'),
            content: Text('Sedang ada perbaikan, silakan coba lagi nanti.'),
            actions: [
              FilledButton(
                onPressed: () => SystemNavigator.pop(),
                child: Text('Ok'),
              ),
            ],
          );
        }

        return false;
      }

      // Periksa apakah versi aplikasi dengan versi server berbeda atau tidak.
      // dan periksa apakah ada urget updaite atau tidak.
      if (app.appVersion != AppConstant.version) {
        if (mounted) {
          Alert(
            context,
            title: Text('Informasi'),
            content: Text('Terdapat versi terbaru, Silakan perbarui aplikasi.'),
            actions: [
              app.isUrgentUpdate
                  ? FilledButton(
                      onPressed: () {
                        SystemNavigator.pop();
                      },
                      child: Text('Ok'),
                    )
                  : FilledButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/login');
                      },
                      child: Text('Lewati Pembaruan'),
                    ),
            ],
          );
        }

        return false;
      }

      return true;
    } catch (e) {
      if (mounted) {
        Alert(
          context,
          title: Text('Informasi'),
          content: Text('Terjadi kesalahan saat mengambil data.'),
          actions: [
            FilledButton(
              onPressed: () => SystemNavigator.pop(),
              child: Text('Ok'),
            ),
          ],
        );
      }

      return false;
    }
  }

  // Pemeriksaan prizinan.
  Future<void> _initApp() async {
    if (!await _checkLocationPermission()) return;
    if (!await _checkCameraPermission()) return;
    if (!await _checkInternetConnection()) return;
    if (!await _checkVersion()) return;

    if (mounted) {
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  @override
  void initState() {
    super.initState();
    _initApp();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      navigationBarColor: Theme.of(context).colorScheme.primary,
      navigationBarIconColor: Brightness.light,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Theme.of(context).colorScheme.primary,
        body: Center(
          // child: Image.asset('assets/images/icon.png', width: 160, height: 160),
          child: CircularProgressIndicator(color: Colors.white),
        ),
      ),
    );
  }
}
