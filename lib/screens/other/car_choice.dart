import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:comparking/constants/colors.dart';
import 'package:supabase/supabase.dart';
import 'package:comparking/screens/other/date_reservation.dart';
import 'package:comparking/screens/other/new_cars.dart';
import 'package:comparking/main.dart'; // Importation du fichier main.dart

class CarChoice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(), // Utilisation de l'appBar définie dans la classe MyAppBar
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListCarChoice() // Affichage de la liste des choix de voitures
          ],
        ),
      ),
    );
  }
}

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  Size get preferredSize => Size.fromHeight(50); // Taille préférée de l'appBar
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back, // Icône de retour en arrière
          color: Colors.white, // Couleur de l'icône
        ),
        onPressed: () {
          Navigator.pop(context);
        }, // Action lorsqu'on appuie sur le bouton de retour
      ),
      backgroundColor: pBlue, // Couleur de l'appBar
      title: Text(
        'Sélectionner votre véhicule', // Titre de l'appBar
        style: GoogleFonts.nunito(
          color: Colors.white, // Couleur du texte du titre
          fontSize: 22, // Taille de la police du titre
          fontWeight: FontWeight.w800, // Poids de la police du titre
        ),
      ),
      centerTitle: true, // Centrage du titre de l'appBar
    );
  }
}

class ListCarChoice extends StatefulWidget {
  @override
  _ListCarChoiceState createState() => _ListCarChoiceState();
}

class _ListCarChoiceState extends State<ListCarChoice> {
  Map? _selectedCar; // Voiture sélectionnée

  final List<Map<String, String>> carsList = [
    // Liste des voitures avec leur marque et leur immatriculation
    {'marque': 'Renault', 'matricule': 'AB1234CD'},
    {'marque': 'Peugeot', 'matricule': 'EF5678GH'},
    {'marque': 'Toyota', 'matricule': 'IJ91011KL'},
  ];

  Future<void> _addCarToDatabase(Map<String, String> car) async {
    final response = await supabase.from('vehicules').insert({
      'marque': car['marque'],
      'modele': 'Modèle Placeholder', // Remplacez par le modèle réel si disponible
      'annee': 2022, // Remplacez par l'année réelle si disponible
      'couleur': 'Couleur Placeholder', // Remplacez par la couleur réelle si disponible
      'immatriculation': car['matricule'],
      'id': supabase.auth.currentUser?.id,
    }).single();

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20), // Marge intérieure du conteneur
      child: Column(
        children: [
          ...carsList.map((car) {
            // Affichage de chaque voiture sous forme de carte
            return CarsCard(
              // Affichage de la carte de voiture
              carData: car, // Données de la voiture
              isSelected: car == _selectedCar, // Vérification si la voiture est sélectionnée ou non
              onChanged: (selected) {
                // Action lorsqu'une voiture est sélectionnée
                setState(() {
                  _selectedCar = selected ? car : null; // Mise à jour de la voiture sélectionnée
                });
                if (selected) {
                  _addCarToDatabase(car); // Ajout du véhicule à la base de données
                }
              },
            );
          }).toList(),
          const SizedBox(
            height: 20,
          ), // Espacement entre la liste de voitures et le container
          Container(
            width: double.infinity,
            height: 50,
            color: sBlue,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => NewCars()));
                  },
                  child: Row(
                    children: [
                      const Icon(
                        Icons.add_box_outlined,
                        color: pBlue,
                      ),
                      Text(
                        'Ajouter un nouveau véhicule',
                        textAlign: TextAlign.left,
                        style: GoogleFonts.nunito(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                          color: pBlue,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 150), // Espacement entre l'icône et le texte
          Container(
            width: double.infinity,
            margin: const EdgeInsets.all(8), // Marge autour du conteneur
            child: Align(
              alignment: Alignment.bottomCenter, // Alignement en bas de la page
              child: ElevatedButton(
                onPressed: () {
                  // Logique à exécuter lorsque le bouton est pressé
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DateReservation(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: pBlue,
                  minimumSize: const Size(350, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Continuer',
                  style: TextStyle(color: sBlue),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CarsCard extends StatelessWidget {
  final Map<String, String> carData; // Données de la voiture
  final bool isSelected; // Indique si la voiture est sélectionnée ou non
  final ValueChanged<bool> onChanged; // Méthode appelée lorsque la sélection de la voiture change

  CarsCard({
    required this.carData, // Données de la voiture requises
    required this.isSelected, // Indication de la sélection requise
    required this.onChanged, // Méthode de changement requise
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 80,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: pBlue),
        borderRadius: BorderRadius.circular(10),
        color: Colors.transparent,
      ),
      child: RadioListTile<Map<String, String>>(
        // Case à cocher pour chaque voiture
        title: Row(
          children: [
            Icon(Icons.directions_car, color: pBlue), // Icône de voiture
            SizedBox(width: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(carData['marque']!), // Affichage de la marque de la voiture
                SizedBox(width: 4),
                Text(carData['matricule']!), // Affichage de l'immatriculation de la voiture
              ],
            ),
          ],
        ),
        controlAffinity: ListTileControlAffinity.trailing, // Affiche sur le côté opposé de la vignette au bouton radio
        value: carData, // Données de la voiture
        groupValue: isSelected ? carData : null, // Groupe de la valeur de la voiture sélectionnée
        onChanged: (selected) => onChanged(selected != null), // Action lorsqu'une voiture est sélectionnée
      ),
    );
  }
}
