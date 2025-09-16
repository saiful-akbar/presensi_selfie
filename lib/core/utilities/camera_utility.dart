import 'package:permission_handler/permission_handler.dart';

class CameraUtility {
  // Periksa apakah kamera  diizinkan atau ditolak
  Future<PermissionStatus> status() async {
    return await Permission.camera.status;
  }

  // Requst izin kamera
  Future<PermissionStatus> requestPermission() async {
    return await Permission.camera.request();
  }
}
