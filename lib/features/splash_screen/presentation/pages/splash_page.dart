import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:presensi_selfie/core/utils/internet.dart';
import 'package:presensi_selfie/core/widgets/app_scaffold.dart';
import 'package:presensi_selfie/features/auth/application/bloc/auth_bloc.dart';
import 'package:presensi_selfie/features/auth/application/bloc/auth_event.dart';
import 'package:presensi_selfie/features/auth/application/bloc/auth_state.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  // Periksa koneksi internet
  Future<bool> _checkInternetConnection() async {
    final isConnected = await Internet.isConnected();

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

    return true;
  }

  // Periksa akses lokasi
  Future<bool> _checkLocationPermission() async {
    var permission = await Permission.location.status;

    // Minta izin kalau ditolak
    if (permission.isDenied) {
      permission = await Permission.location.request();
    }

    // Jika akses ditolah buka pengaturan.
    if (permission.isDenied || permission.isPermanentlyDenied) {
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
                'Aplikasi membutuhkan akses lokasi (GPS) untuk keperluan presensi karyawan.',
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

    return true;
  }

  // Pemeriksaan prizinan.
  Future<void> _initApp() async {
    if (!await _checkCameraPermission()) return;
    if (!await _checkLocationPermission()) return;
    if (!await _checkInternetConnection()) return;

    // Perisan autentikasi.
    if (mounted) {
      context.read<AuthBloc>().add(CheckAuth());
    }
  }

  @override
  void initState() {
    super.initState();
    _initApp();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.token == null) {
          Navigator.pushReplacementNamed(context, '/login');
        } else {
          Navigator.pushReplacementNamed(context, '/home');
        }
      },
      child: AppScaffold(
        navigationBarColor: Theme.of(context).colorScheme.primary,
        navigationBarIconColor: Brightness.light,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Theme.of(context).colorScheme.primary,
          body: Center(
            child: Image.asset(
              'assets/images/icon.png',
              width: 160,
              height: 160,
            ),
          ),
        ),
      ),
    );
  }
}
