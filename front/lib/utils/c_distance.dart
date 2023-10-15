import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:math';

class CDistance {
  static Future<List<double>?> getCoordinates(String address) async {
    final apiKey = dotenv.env['GOOGLE_MAPS_API_KEY'];
    final Uri url = Uri.parse(
        'https://maps.googleapis.com/maps/api/geocode/json?address=$address&key=$apiKey');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data['status'] == 'OK') {
        // Assurez-vous que "results" est une liste
        if (data['results'] is List && data['results'].isNotEmpty) {
          // Accédez au premier élément de la liste (s'il existe)
          var firstResult = data['results'][0];
          if (firstResult is Map<String, dynamic>) {
            // Accédez à "geometry" à l'intérieur de cet élément
            var geometry = firstResult['geometry'];
            if (geometry is Map<String, dynamic>) {
              // Accédez à "location" à l'intérieur de "geometry"
              var location = geometry['location'];
              // Maintenant, vous pouvez accéder aux données de localisation
              var lat = location['lat']; // Latitude
              var lng = location['lng']; // Longitude
              debugPrint('Latitude: $lat, Longitude: $lng');
              return [lat, lng];
            }
          }
        }
      } else {
        throw Exception(
            'Erreur lors de la requête Geocoding. Statut : ${data['status']}');
      }
    } else {
      throw Exception('Erreur lors de la requête HTTP');
    }
  }

  static double calculateDistance(
      double lat1, double lon1, double lat2, double lon2) {
    const double radiusOfEarth = 6371; // Rayon de la Terre en kilomètres

    // Convertir les latitudes et longitudes en radians
    final double lat1Rad = degreesToRadians(lat1);
    final double lon1Rad = degreesToRadians(lon1);
    final double lat2Rad = degreesToRadians(lat2);
    final double lon2Rad = degreesToRadians(lon2);

    // Différences entre les latitudes et longitudes
    final double latDiff = lat2Rad - lat1Rad;
    final double lonDiff = lon2Rad - lon1Rad;

    // Formule de la haversine
    final double a = pow(sin(latDiff / 2), 2) +
        cos(lat1Rad) * cos(lat2Rad) * pow(sin(lonDiff / 2), 2);
    final double c = 2 * atan2(sqrt(a), sqrt(1 - a));

    // Distance en kilomètres
    final double distance = radiusOfEarth * c;

    return distance;
  }

  static double degreesToRadians(double degrees) {
    return degrees * (pi / 180);
  }
}
