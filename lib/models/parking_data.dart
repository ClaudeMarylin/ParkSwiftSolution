// classe des données des parkings

class ParkingModel {
  final String name;
  final String adresse;
  final int placesDisponibles;
  final String imageURL;

  ParkingModel({
    required this.name,
    required this.adresse,
    required this.placesDisponibles,
    required this.imageURL,
  });

  // Méthode pour convertir un objet JSON en instance de ParkingModel
  factory ParkingModel.fromJson(Map<String, dynamic> json) {
    return ParkingModel(
      name: json['name'],
      adresse: json['adresse'],
      placesDisponibles: json['places_disponibles'],
      imageURL: json['imageURL'],
    );
  }
}
