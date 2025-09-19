import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

class LocationUtility {
  // Cek izin lokasi
  Future<LocationPermission> checkPermission() async {
    return await Geolocator.checkPermission();
  }

  // Request izin lokasi
  Future<LocationPermission> requestPermission() async {
    return await Geolocator.requestPermission();
  }

  // Periksa apakah lokasi aktif
  Future<bool> serviceEnabled() async {
    return await Geolocator.isLocationServiceEnabled();
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
      final response = await http.get(url, headers: {'User-Agent': 'flutter-presensi-app'});

      final data = jsonDecode(response.body);

      return data['display_name'] ?? 'unknown';
    } catch (e) {
      throw Exception('Terjadi kesalahan saat mengambil data alamat');
    }
  }
}
