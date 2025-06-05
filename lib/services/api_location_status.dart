import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/location_status.dart';

class ApiLocationStatus {
  static const String baseUrl =
      'http://192.168.252.189:8000/api/location-status';

  static Future<LocationStatus> fetchLocationStatus() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final jsonMap = json.decode(response.body);
      return LocationStatus.fromJson(jsonMap);
    } else {
      throw Exception('Failed to load location status');
    }
  }
}
