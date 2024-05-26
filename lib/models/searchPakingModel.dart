// classe des données des parkings

class SearchParkingModel {
  final String nom;
  //final String adresse;
  //final int placesDisponibles;
  final String imageURL;

  SearchParkingModel({
    required this.nom,
    // required this.adresse,
    // required this.placesDisponibles,
    required this.imageURL,
  });

  // Méthode pour convertir un objet JSON en instance de SearchParkingModel
  factory SearchParkingModel.fromJson(Map<String, dynamic> json) {
    return SearchParkingModel(
      nom: json['nom'],
      //adresse: json['adresse'],
      //placesDisponibles: json['places_disponibles'],
      imageURL: json['imageURL'],
    );
  }
}

