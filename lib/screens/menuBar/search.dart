import 'package:comparking/models/parkingModel.dart';
import 'package:comparking/screens/ParkingDetailsPage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../constants/colors.dart'; // Fichier de couleurs personnalisées
import '../../helper/helper_functions.dart'; // Fonctions d'aide personnalisées
import '../../main.dart'; // Point d'entrée principal de l'application
import '../../models/searchPakingModel.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<ParkingModel> mainParkingsList = [];
  String _query = '';

  void updateList(String value) async {
    try {
      var res = await supabase.from('parking').select('nom, adresse, imageURL, places_disponibles, description, tarif, devise').textSearch('nom', value);

      logger.d(res);

      List<ParkingModel> parkings = res.map<ParkingModel>((data) {
        return ParkingModel(
          nom: data['nom'] as String?,
          adresse: data['adresse'] as String?,
          imageURL: data['imageURL'] as String?,
          placesDisponibles: data['places_disponibles'] as int?,
          description: data['description'] as String?,
          tarif: data['tarif'] as double?,
          devise: data['devise'] as String?,
        );
      }).toList();

      setState(() {
        mainParkingsList = parkings;
      });
    } on PostgrestException catch (error, stackTrace) {
      logger.e(error.message, stackTrace: stackTrace);
      logger.e(error.details);
    } catch (e, stackTrace) {
      logger.e("$e", stackTrace: stackTrace);
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Rechercher un parking",
              style: GoogleFonts.lato(
                color: Colors.black87,
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            TextField(
              style: const TextStyle(color: Colors.black),
              decoration: InputDecoration(
                filled: true,
                fillColor: searchBlue,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
                hintText: "Rechercher un parking",
                hintStyle: TextStyle(color: Colors.white70),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
              ),
              onChanged: (value) {
                setState(() {
                  _query = value;
                });
              },
              onSubmitted: (value) {
                updateList(value);
              },
            ),
            const SizedBox(
              height: 20.0,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: mainParkingsList.length,
                itemBuilder: (context, index) {
                  final parking = mainParkingsList[index];
                  return GestureDetector(
                    onTap: () {
                      // Naviguer vers la page de détails du parking
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ParkingDetailsPage(parking: parking),
                        ),
                      );
                    },
                    child: Card(
                      elevation: 4.0,
                      margin: const EdgeInsets.symmetric(vertical: 10.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(16.0),
                        leading: parking.imageURL != null && parking.imageURL!.isNotEmpty
                            ? ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: Image.network(
                            parking.imageURL!,
                            width: 50.0,
                            height: 50.0,
                            fit: BoxFit.cover,
                          ),
                        )
                            : Container(
                          width: 50.0,
                          height: 50.0,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: const Icon(
                            Icons.local_parking,
                            color: Colors.white,
                          ),
                        ),
                        title: Text(
                          parking.nom ?? 'Nom non disponible',
                          style: GoogleFonts.lato(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          parking.adresse ?? 'Adresse non disponible',
                          style: GoogleFonts.lato(
                            fontSize: 16.0,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}





// import 'package:comparking/screens/ParkingDetailsPage.dart';
// import 'package:comparking/screens/menuBar/details_booking.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';

// import '../../constants/colors.dart'; // Fichier de couleurs personnalisées
// import '../../helper/helper_functions.dart'; // Fonctions d'aide personnalisées
// import '../../main.dart'; // Point d'entrée principal de l'application
// import '../../models/parking_data.dart'; // Modèle de données de stationnement

// class SearchPage extends StatefulWidget {
//   const SearchPage({Key? key}) : super(key: key);

//   @override
//   State<SearchPage> createState() => _SearchPageState();
// }

// class _SearchPageState extends State<SearchPage> {
//   List<SearchParkingModel> mainParkingsList = [];
//   String _query = '';

//   void updateList(String value) async {
//     try {
//       var res = await supabase.from('parking').select('nom, imageURL').textSearch('nom', value);

//       logger.d(res);

//       List<SearchParkingModel> parkings = res.map<SearchParkingModel>((data) {
//         return SearchParkingModel(nom: data['nom'], imageURL: data['imageURL']);
//       }).toList();

//       setState(() {
//         mainParkingsList = parkings;
//       });
//     } on PostgrestException catch (error, stackTrace) {
//       logger.e(error.message, stackTrace: stackTrace);
//       logger.e(error.details);
//     } catch (e, stackTrace) {
//       logger.e("$e", stackTrace: stackTrace);
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         leading: IconButton(
//           icon: const Icon(
//             Icons.arrow_back,
//             color: Colors.black,
//           ),
//           onPressed: () {
//             Navigator.of(context).pop();
//           },
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               "Rechercher un parking",
//               style: GoogleFonts.lato(
//                 color: Colors.black87,
//                 fontSize: 24.0,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const SizedBox(
//               height: 20.0,
//             ),
//             TextField(
//               style: const TextStyle(color: Colors.black),
//               decoration: InputDecoration(
//                 filled: true,
//                 fillColor: searchBlue,
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(8.0),
//                   borderSide: BorderSide.none,
//                 ),
//                 hintText: "Rechercher un parking",
//                 hintStyle: TextStyle(color: Colors.white70),
//                 prefixIcon: Icon(
//                   Icons.search,
//                   color: Colors.white,
//                 ),
//               ),
//               onChanged: (value) {
//                 setState(() {
//                   _query = value;
//                 });
//               },
//               onSubmitted: (value) {
//                 updateList(value);
//               },
//             ),
//             const SizedBox(
//               height: 20.0,
//             ),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: mainParkingsList.length,
//                 itemBuilder: (context, index) {
//                   final parking = mainParkingsList[index];
//                   return GestureDetector(
//                     onTap: () {
//                       // Naviguer vers la page de détails du parking
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => ParkingDetailsPage(parking: ParkingModel(),),
//                         ),
//                       );
//                     },
//                     child: Card(
//                       elevation: 4.0,
//                       margin: const EdgeInsets.symmetric(vertical: 10.0),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(15.0),
//                       ),
//                       child: ListTile(
//                         contentPadding: const EdgeInsets.all(16.0),
//                         leading: parking.imageURL != null && parking.imageURL!.isNotEmpty
//                             ? ClipRRect(
//                           borderRadius: BorderRadius.circular(10.0),
//                           child: Image.network(
//                             parking.imageURL!,
//                             width: 60.0,
//                             height: 60.0,
//                             fit: BoxFit.cover,
//                           ),
//                         )
//                             : const Icon(
//                           Icons.local_parking,
//                           size: 60.0,
//                           color: Colors.blue,
//                         ),
//                         title: Text(
//                           parking.nom,
//                           style: GoogleFonts.lato(
//                             fontSize: 18.0,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.black87,
//                           ),
//                         ),
//                         subtitle: const Text(
//                           "Détails supplémentaires du parking",
//                           style: TextStyle(color: Colors.black54),
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }



// class ParkingDetailsPage extends StatelessWidget {
//   final SearchParkingModel parking;

//   const ParkingDetailsPage({Key? key, required this.parking}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     // Utilisez les détails du parking pour afficher les informations sur cette page
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(parking.nom),
//         backgroundColor: Colors.white,
//         leading: IconButton(
//           icon: const Icon(
//             Icons.arrow_back,
//             color: Colors.black,
//           ),
//           onPressed: () {
//             Navigator.of(context).pop();
//           },
//         ),
//       ),
//       body: Center(
//         child: Text("Page de détails du parking ${parking.nom}"),
//       ),
//     );
//   }
// }
