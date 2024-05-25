import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../constants/colors.dart'; // Fichier de couleurs personnalisées
import '../../helper/helper_functions.dart'; // Fonctions d'aide personnalisées
import '../../main.dart'; // Point d'entrée principal de l'application
import '../../models/parking_data.dart'; // Modèle de données de stationnement

// Widget SearchPage
class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

// État pour SearchPage
class _SearchPageState extends State<SearchPage> {
  List<ParkingModel> mainParkingsList =
      []; // Liste pour stocker les données de stationnement
  String _query = ''; // Chaîne de requête pour la recherche

  // Fonction pour mettre à jour la liste en fonction de la requête de recherche
  void updateList(String value) async {
    try {
      // Requête Supabase pour récupérer les parkings en fonction de la requête
      var res =
          await supabase.from('parking').select('nom').textSearch('nom', value);

      logger.d(res);

      // Convertir les résultats en instances de ParkingModel
      List<ParkingModel> parkings = res.map<ParkingModel>((data) {
        return ParkingModel(nom: data['nom']);
      }).toList();

      // Mettre à jour l'état avec les résultats de la recherche
      setState(() {
        mainParkingsList = parkings;
      });
    } on PostgrestException catch (error, stackTrace) {
      logger.e(error.message,
          stackTrace: stackTrace); // Enregistrement du message d'erreur
      logger.e(error.details); // Enregistrement des détails de l'erreur
    } catch (e, stackTrace) {
      logger.e("$e",
          stackTrace: stackTrace); // Enregistrement d'une erreur générique
    }
  }

  @override
  void initState() {
    super.initState();
    // Le code d'initialisation peut être ajouté ici si nécessaire
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white, // Couleur de fond de l'AppBar
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black, // Couleur de l'icône du bouton de retour
          ),
          onPressed: () {
            Navigator.of(context)
                .pop(); // Navigation vers l'arrière lors de l'appui
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16), // Marge autour du contenu
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Rechercher un parking", // Titre de la page de recherche
              style: TextStyle(
                color: Colors.black87,
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20.0, // Espace entre le titre et la barre de recherche
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    style:
                        const TextStyle(color: Colors.white), // Style du texte
                    decoration: InputDecoration(
                      filled: true,
                      fillColor:
                          searchBlue, // Couleur personnalisée pour l'arrière-plan de la barre de recherche
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide.none, // Pas de bordure
                      ),
                      hintText: "The park one", // Texte indicatif
                      prefixIcon: const Icon(Icons.search),
                      prefixIconColor:
                          Colors.grey.shade900, // Couleur de l'icône
                    ),
                    onChanged: (value) {
                      _query =
                          value; // Mise à jour de la chaîne de requête lors de la saisie
                    },
                  ),
                ),
                Material(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: InkWell(
                    onTap: () {
                      // Action lors de l'appui sur le bouton de recherche
                      updateList(_query);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Icon(
                        Icons.search,
                        color: Colors.black,
                        size: 30, // Taille de l'icône
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height:
                  20.0, // Espace entre la barre de recherche et les résultats
            ),
            Expanded(
              child: ListView.builder(
                itemCount:
                    mainParkingsList.length, // Nombre d'éléments dans la liste
                itemBuilder: (context, index) => ListTile(
                  title: Text(mainParkingsList[index]
                      .nom), // Affichage du nom du parking
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
