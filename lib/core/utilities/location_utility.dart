import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:http/http.dart' as http;

class LocationUtility {
  Future<PermissionStatus> hasPermission() async {
    return await Permission.location.status;
  }

  // Request izin lokasi
  Future<PermissionStatus> requestPermission() async {
    return await Permission.location.request();
  }

  // Periksa apakah lokasi aktif
  Future<bool> isEnable() async {
    return await Geolocator.isLocationServiceEnabled();
  }

  // Periksa apakah memiliki izin lokasi
  Future<bool> isAllowed() async {
    var permission = await Permission.location.status;

    if (permission.isDenied) {
      permission = await Permission.location.request();

      if (permission.isDenied) {
        return false;
      }
    }

    if (permission.isPermanentlyDenied) {
      return false;
    }

    return true;
  }

  // Periksa apakah lokasi palsu.
  Future<bool> isFake() async {
    Position position = await Geolocator.getCurrentPosition();

    if (position.isMocked) {
      return true;
    }

    return false;
  }

  // Mengambil data lokasi
  Future<Map<String, dynamic>> getLocation() async {
    Position position = await Geolocator.getCurrentPosition();

    return {
      'latitude': position.latitude,
      'longitude': position.longitude,
      'timestamp': position.timestamp.toString(),
    };
  }

  // Mengambil alamat dari lokasi
  Future<String> getAddress() async {
    final location = await getLocation();

    final url = Uri(
      scheme: 'https',
      host: 'nominatim.openstreetmap.org',
      path: '/reverse',
      queryParameters: {
        'lat': location['latitude'].toString(),
        'lon': location['longitude'].toString(),
        'format': 'json',
      },
    );

    try {
      final response = await http.get(
        url,
        headers: {'User-Agent': 'flutter-presensi-app'},
      );

      final data = jsonDecode(response.body);

      return data['display_name'] ?? 'unknown';
    } catch (e) {
      throw Exception('Terjadi kesalahan saat mengambil data alamat');
    }
  }
}
