import 'package:flutter/material.dart';

class ParkingModel {
  final int? id_parking;
  final String? nom;
  final String? adresse;
  final String? imageURL;
  final int? placesDisponibles;
  final String? description;
  final double? tarif;
  final String? devise;

  ParkingModel({
    this.id_parking,
    this.nom,
    this.adresse,
    this.imageURL,
    this.placesDisponibles,
    this.description,
    this.tarif,
    this.devise,
  });

  factory ParkingModel.fromJson(Map<String, dynamic> json) {
    return ParkingModel(
      id_parking: json['id'] as int?,
      nom: json['nom'] as String?,
      adresse: json['adresse'] as String?,
      imageURL: json['imageURL'] as String?,
      placesDisponibles: json['places_disponibles'] as int?,
      description: json['description'] as String?,
      tarif: json['tarif'] as double?,
      devise: json['devise'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id_parking,
      'nom': nom,
      'adresse': adresse,
      'imageURL': imageURL,
      'places_disponibles': placesDisponibles,
      'description': description,
      'tarif': tarif,
      'devise': devise,
    };
  }
}