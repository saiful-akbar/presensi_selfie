import 'dart:convert';

import 'package:presensi_selfie/features/location/domain/entities/location_entity.dart';
import 'package:http/http.dart' as http;

class LocationApi {
  Future<String> getLocationAddress(LocationEntity entity) async {
    final url = Uri(
      scheme: 'https',
      host: 'nominatim.openstreetmap.org',
      path: '/reverse',
      queryParameters: {
        'lat': entity.latitude.toString(),
        'lon': entity.longitude.toString(),
        'format': 'json',
      },
    );

    try {
      final response = await http.get(
        url,
        headers: {'User-Agent': 'flutter-presensi-app'},
      );

      final data = jsonDecode(response.body);

      return data['display_name'];
    } catch (e) {
      throw Exception('Terjadi kesalahan saat mengambil data alamat');
    }
  }
}
