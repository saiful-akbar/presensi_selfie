import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:presensi_selfie/core/constants/app_constant.dart';
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
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return AlertDialog(
              title: Text('Tidak ada koneksi internet!'),
              titleTextStyle: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Theme.of(context).colorScheme.onSurface,
              ),
              content: Text(
                'Pastikan perangkat terhubung ke internet untuk melanjutkan menggunakan aplikasi.',
              ),
              contentTextStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).colorScheme.onSurface,
              ),
              actions: [
                FilledButton(
                  onPressed: () => SystemNavigator.pop(),
                  child: Text('Tutup'),
                ),
              ],
            );
          },
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
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return AlertDialog(
              title: Text('Izin kamera ditolak!'),
              titleTextStyle: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Theme.of(context).colorScheme.onSurface,
              ),
              content: Text(
                'Aplikasi membutuhkan akses kamera untuk keperluan presensi karyawan.',
              ),
              contentTextStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).colorScheme.onSurface,
              ),
              actions: [
                FilledButton(
                  onPressed: () => openAppSettings(),
                  child: Text('Buka pengaturan'),
                ),
              ],
            );
          },
        );
      }

      return false;
    }

    if (mounted) {
      context.read<LocationBloc>().add(
        SetLocation(await GetCurrentLocationUseCase().handle()),
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
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return AlertDialog(
              title: Text('Izin lokasi ditolak!'),
              titleTextStyle: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Theme.of(context).colorScheme.onSurface,
              ),
              content: Text(
                'Aplikasi membutuhkan akses lokasi (GPS) untuk keperluan presensi.',
              ),
              contentTextStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).colorScheme.onSurface,
              ),
              actions: [
                FilledButton(
                  onPressed: () => openAppSettings(),
                  child: Text('Buka pengaturan'),
                ),
              ],
            );
          },
        );
      }

      return false;
    }

    // Periksa apakah menggunakan lokasi palsu atau tidak
    if (await hasFakeLocation.handle()) {
      if (mounted) {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return AlertDialog(
              title: Text('Warning'),
              titleTextStyle: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Theme.of(context).colorScheme.onSurface,
              ),
              content: Text('Anda terdeteksi menggunakan fake GPS.'),
              contentTextStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            );
          },
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

      if (app.isMaintenance) {
        if (mounted) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) {
              return AlertDialog(
                title: Text('Informasi'),
                titleTextStyle: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
                content: Text(
                  'Maaf, sedang ada perbaikan. Silakan coba lagi nanti.',
                ),
                contentTextStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
                actions: [
                  FilledButton(
                    onPressed: () {
                      SystemNavigator.pop();
                    },
                    child: Text('Ok'),
                  ),
                ],
              );
            },
          );
        }

        return false;
      }

      if (app.appVersion != AppConstant.version) {
        if (mounted) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) {
              return AlertDialog(
                title: Text('Informasi'),
                titleTextStyle: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
                content: Text(
                  'Terdapat versi terbaru, Silakan perbarui aplikasi.',
                ),
                contentTextStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
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
            },
          );
        }

        return false;
      }

      return true;
    } catch (e) {
      if (mounted) {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return AlertDialog(
              title: Text('Informasi'),
              titleTextStyle: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Theme.of(context).colorScheme.onSurface,
              ),
              content: Text('Terjadi kesalahan saat mengambil data.'),
              contentTextStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).colorScheme.onSurface,
              ),
              actions: [
                FilledButton(
                  onPressed: () {
                    SystemNavigator.pop();
                  },
                  child: Text('Ok'),
                ),
              ],
            );
          },
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

    // Perisan autentikasi.
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
          child: Image.asset('assets/images/icon.png', width: 160, height: 160),
        ),
      ),
    );
  }
}
