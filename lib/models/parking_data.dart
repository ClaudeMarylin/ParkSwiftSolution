// classe des données des parkings

class ParkingModel {
  final String nom;
  final String adresse;
  final int placesDisponibles;
  final String imageURL;

  ParkingModel({
    required this.nom,
    required this.adresse,
    required this.placesDisponibles,
    required this.imageURL,
  });

  // Méthode pour convertir un objet JSON en instance de ParkingModel
  factory ParkingModel.fromJson(Map<String, dynamic> json) {
    return ParkingModel(
      nom: json['nom'],
      adresse: json['adresse'],
      placesDisponibles: json['places_disponibles'],
      imageURL: json['imageURL'],
    );
  }
}
