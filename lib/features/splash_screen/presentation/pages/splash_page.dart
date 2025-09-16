import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:presensi_selfie/core/constants/app_constant.dart';
import 'package:presensi_selfie/core/utilities/alert_utility.dart';
import 'package:presensi_selfie/core/utilities/camera_utility.dart';
import 'package:presensi_selfie/core/utilities/internet_utility.dart';
import 'package:presensi_selfie/core/utilities/location_utility.dart';
import 'package:presensi_selfie/core/widgets/app_scaffold.dart';
import 'package:presensi_selfie/features/app/application/usecases/get_version_use_case.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late InternetUtility _internet;
  late AlertUtility _alert;
  late CameraUtility _camera;
  late LocationUtility _location;

  // Periksa koneksi internet
  Future<bool> _checkInternetConnection() async {
    if (!await _internet.isConnected()) {
      if (mounted) {
        _alert.show(
          title: Text('Informasi'),
          content: Text('Tidak ada koneksi internet.'),
          actions: [
            Expanded(
              child: FilledButton(
                onPressed: () => SystemNavigator.pop(),
                child: Text('Tutup'),
              ),
            ),
          ],
        );
      }

      return false;
    }

    return true;
  }

  // Periksa akses kamera
  Future<bool> _checkCameraPermission() async {
    var permission = await _camera.status();

    // Minta izin kalau ditolak
    if (permission.isDenied) {
      permission = await _camera.requestPermission();
    }

    // Jika akses ditolah buka pengaturan.
    if (permission.isDenied || permission.isPermanentlyDenied) {
      if (mounted) {
        _alert.show(
          title: Text('Informasi'),
          content: Text('Izin kamera ditolak!'),
          actions: [
            Expanded(
              child: FilledButton(
                onPressed: () => openAppSettings(),
                child: Text('Buka pengaturan'),
              ),
            ),
          ],
        );
      }

      return false;
    }

    return true;
  }

  // Periksa izin lokasi
  Future<bool> _checkLocationPermission() async {
    PermissionStatus permission = await _location.hasPermission();

    if (permission.isDenied) {
      permission = await _location.requestPermission();
    }

    if (permission.isDenied) {
      if (mounted) {
        _alert.show(
          title: Text('Informasi'),
          content: Text('Izin lokasi ditolak!'),
          actions: [
            Expanded(
              child: FilledButton(
                onPressed: () => openAppSettings(),
                child: Text('Buka pengaturan'),
              ),
            ),
          ],
        );
      }

      return false;
    }

    if (await _location.isFake()) {
      if (mounted) {
        _alert.show(
          title: Text('Warning'),
          content: Text('Anda terdeteksi menggunakan fake GPS!'),
          actions: [
            Expanded(
              child: FilledButton(
                onPressed: () => SystemNavigator.pop(),
                child: Text('Tutup'),
              ),
            ),
          ],
        );
      }

      return false;
    }

    return true;
  }

  // Periksa version
  Future<bool> _checkVersion() async {
    try {
      final app = await GetVersionUseCase.handle();

      // Periksa apakah sedang ada maintenance atau tidak.
      if (app.isMaintenance) {
        if (mounted) {
          _alert.show(
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
          _alert.show(
            title: Text('Informasi'),
            content: Text('Terdapat versi terbaru, Silakan perbarui aplikasi.'),
            actions: [
              FilledButton(
                onPressed: () {
                  SystemNavigator.pop();
                },
                child: Text('Perbarui'),
              ),

              if (app.isUrgentUpdate)
                FilledButton(
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
        _alert.show(
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

    _alert = AlertUtility(context);
    _internet = InternetUtility();
    _camera = CameraUtility();
    _location = LocationUtility();

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
