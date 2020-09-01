import 'dart:convert';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

const API_KEY = "AIzaSyDJPFHRk-parytMGhzsvyAfjCGEnRKuxmk";

class LocationHelper {
  static String generateImage({double latitude, double longitude}) {
    return "https://maps.googleapis.com/maps/api/staticmap?center=$latitude,$longitude&zoom=16&size=600x300&maptype=roadmap&markers=color:red%7Clabel:A%7C$latitude,$longitude&key=$API_KEY";
  }

  static Future<String> getAddress(LatLng pos) async {
    final url =
        "https://maps.googleapis.com/maps/api/geocode/json?latlng=${pos.latitude},${pos.longitude}&key=$API_KEY";
    final resp = await http.get(url);
    return json.decode(resp.body)['results'][0]['formatted_address'];
  }
}
