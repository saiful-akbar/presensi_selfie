import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:presensi_selfie/core/constants/api_endpoint_constant.dart';

class Api {
  // Get request
  static Future<http.Response> get(
    String path, {
    Map<String, dynamic>? parameters,
    String? authToken,
  }) async {
    final url = Uri.https(ApiEndpointConstant.baseUrl, path, parameters);

    final headers = {
      'Content-Type': 'application/json',
      if (authToken != null) 'Authorization': 'Bearer $authToken',
    };

    return await http.get(url, headers: headers);
  }

  // post request
  static Future<http.Response> post(
    String path, {
    Map<String, dynamic>? parameters,
    Map<String, dynamic>? body,
    String? authToken,
  }) async {
    final url = Uri.https(ApiEndpointConstant.baseUrl, path, parameters);

    final headers = {
      'Content-Type': 'application/json',
      if (authToken != null) 'Authorization': 'Bearer $authToken',
    };

    return await http.post(url, headers: headers, body: jsonEncode(body));
  }

  // put request
  static Future<http.Response> put(
    String path, {
    Map<String, dynamic>? parameters,
    Map<String, dynamic>? body,
    String? authToken,
  }) async {
    final url = Uri.https(ApiEndpointConstant.baseUrl, path, parameters);

    final headers = {
      'Content-Type': 'application/json',
      if (authToken != null) 'Authorization': 'Bearer $authToken',
    };

    return await http.put(url, headers: headers, body: jsonEncode(body));
  }

  // patch request
  static Future<http.Response> patch(
    String path, {
    Map<String, dynamic>? parameters,
    Map<String, dynamic>? body,
    String? authToken,
  }) async {
    final url = Uri.https(ApiEndpointConstant.baseUrl, path, parameters);

    final headers = {
      'Content-Type': 'application/json',
      if (authToken != null) 'Authorization': 'Bearer $authToken',
    };

    return await http.patch(url, headers: headers, body: jsonEncode(body));
  }

  // delete request
  static Future<http.Response> delete(
    String path, {
    Map<String, dynamic>? parameters,
    Map<String, dynamic>? body,
    String? authToken,
  }) async {
    final url = Uri.https(ApiEndpointConstant.baseUrl, path, parameters);

    final headers = {
      'Content-Type': 'application/json',
      if (authToken != null) 'Authorization': 'Bearer $authToken',
    };

    return await http.delete(url, headers: headers, body: jsonEncode(body));
  }
}
