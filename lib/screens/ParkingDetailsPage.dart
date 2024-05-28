import 'package:comparking/models/parkingModel.dart';
import 'package:comparking/screens/bookmarksPage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../constants/colors.dart';
import '../models/searchPakingModel.dart';
import 'package:comparking/screens/other/car_choice.dart';



class ParkingDetailsPage extends StatelessWidget {
  final ParkingModel parking;

  const ParkingDetailsPage({Key? key, required this.parking}) : super(key: key);

 Future<void> addToFavorites(ParkingModel parking) async {
    // Récupérer l'UUID de l'utilisateur connecté (exemple)
    final userId = Supabase.instance.client.auth.currentUser?.id ?? '';

    if (userId.isEmpty) {
      // Gérer le cas où l'utilisateur n'est pas authentifié
      print('Utilisateur non authentifié');
      return;
    }

    // Ajouter aux favoris
    await Bookmarks.addFavorite(parking, userId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${parking.nom}",
          style: GoogleFonts.nunito(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.w800,
          ),
        ),
        backgroundColor: pBlue,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
            onPressed: () {
               addToFavorites(parking); // Ajoute le parking aux favoris
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Bookmarkspage(),
                ),
              );
            },
            icon: Icon(Icons.bookmark, color: Colors.white),
          )
        ],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (parking.imageURL != null && parking.imageURL!.isNotEmpty)
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Image.network(
                      parking.imageURL!,
                      width: MediaQuery.of(context).size.width,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              const SizedBox(height: 16),
               
              Text(
                "${parking.nom}",
                style: GoogleFonts.nunito(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  color: Colors.black87,
                ),
              ),  
              const SizedBox(height: 8),
              Text(
                "Adresse: ${parking.adresse}",
                style: GoogleFonts.nunito(
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Icon(Icons.local_parking, color: pBlue),
                  const SizedBox(width: 8),
                  Text(
                    '${parking.placesDisponibles ?? 0} places disponibles',
                    style: GoogleFonts.nunito(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                'Description',
                style: GoogleFonts.nunito(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  color: pBlue,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "${parking.description}",
                style: GoogleFonts.nunito(
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Tarif',
                style: GoogleFonts.nunito(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  color: pBlue,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                '${parking.tarif ?? 'N/A'} ${parking.devise ?? ''}/Heure',
                style: GoogleFonts.nunito(
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: sBlue,
                      minimumSize: Size(150, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      'Annuler',
                      style: TextStyle(color: pBlue, fontWeight: FontWeight.bold),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Logique à exécuter lorsque le bouton "Réserver" est pressé
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CarChoice(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: pBlue,
                      minimumSize: Size(150, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      'Réserver',
                      style: TextStyle(color: sBlue, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
