import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';




class LocationService {
  static Future<Position?> getCurrentLocation() async {
    try {
      return await Geolocator.getCurrentPosition();
    } catch (e) {
      print('Erreur lors de la récupération de la position actuelle: $e');
      return null;
    }
  }
}