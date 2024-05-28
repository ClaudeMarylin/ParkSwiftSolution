import 'package:comparking/main.dart';
import 'package:comparking/screens/menuBar/moreSetting.dart';
import 'package:flutter/material.dart';
import 'package:comparking/models/parkingModel.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';
import '../../helper/helper_functions.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


class Bookmarkspage extends StatefulWidget {

  @override
  _BookmarkspageState createState() => _BookmarkspageState();
}

class _BookmarkspageState  extends State<Bookmarkspage> {
  late Future<void> _userFavori;
  late Future<void> _userHistory;
  bool _showFavorites = true;
 // List<ParkingModel> favoritesList = [];

@override
  void initState() {
  super.initState();
  _userFavori = fetchFavorites();
}

  Future<void> fetchFavorites() async {
    final userId = supabase.auth.currentUser?.id ??'';
    if (userId.isEmpty) return;

    try {
      final response = await supabase
          .from('favoris')
          .select('''
            parking (
              nom, 
              adresse, 
              imageURL, 
              places_disponibles, 
              description, 
              tarif, 
              devise
            ),
            profiles(
              id
            )'''
          )
          .eq('id', userId);

          logger.d(response);

      // Utiliser un Set pour garantir l'unicité
      Set<ParkingModel> favoritesSet = {};
      List<ParkingModel> favorites = response.map<ParkingModel>((data) {
        final parkingData = data['parking'] as Map<String, dynamic>;
        return ParkingModel.fromJson(parkingData);
      }).toList();
      favoritesSet.addAll(favorites);
      setState(() {
        Bookmarks.favoritesList = favoritesSet.toList();
      });
    } on PostgrestException catch (error, stackTrace) {
      logger.e(error.message, stackTrace: stackTrace);
      logger.e(error.details);
    } catch (e, stackTrace) {
      logger.e("$e", stackTrace: stackTrace);
      return null;
    }
  }
  
  Future<void> fetchHistory() async {
    final userId = supabase.auth.currentUser?.id ?? '';
    if (userId.isEmpty) return;

    try {
      final response = await supabase
          .from('reservations')
          .select('''
            id_reservation,
            parking (
              nom,
              adresse,
              imageURL
            ),
            date_debut,
            date_fin
          ''')
          .eq('id', userId,);

      logger.d(response);

      List<ReservationModel> historyList = response.map<ReservationModel>((data) {
        final parkingData = data['parking'] as Map<String, dynamic>;
        return ReservationModel(
          idReservation: data['id_reservation'],
          parking: ParkingModel.fromJson(parkingData),
          dateDebut: DateTime.parse(data['date_debut']),
          dateFin: DateTime.parse(data['date_fin']),
        );
      }).toList();

      setState(() {
        Reservations.historyList = historyList;
      });
    } on PostgrestException catch (error, stackTrace) {
      logger.e(error.message, stackTrace: stackTrace);
      logger.e(error.details);
    } catch (e, stackTrace) {
      logger.e("$e", stackTrace: stackTrace);
      return null;
    }
  }
  
  void _toggleView(bool showFavorites) {
    setState(() {
      _showFavorites = showFavorites;
      _userHistory = fetchHistory();
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Favoris",
          style: GoogleFonts.nunito(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.w800,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: FutureBuilder<void>(
        //future: _userFavori,
        future: _showFavorites ? _userFavori : _userHistory,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erreur: ${snapshot.error}'));
          } else {
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          // Action lors de l'appui sur "Favoris"
                           _toggleView(true);
                          // Ajoutez ici la navigation ou l'action désirée
                        },
                        child: Text(
                          'Favoris',
                          style: GoogleFonts.lato(
                            color: Colors.black87,
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          // Action lors de l'appui sur "Historique des réservations"
                          _toggleView(false);
                          // Ajoutez ici la navigation ou l'action désirée
                        },
                        child: Text(
                          'Historique des réservations',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: _showFavorites ? _buildFavoritesList() : _buildHistoryList(),
                ),

                /*Expanded(
                  child: ListView.builder(
                    itemCount: Bookmarks.favoritesList.length,
                    itemBuilder: (context, index) {
                      var parking = Bookmarks.favoritesList[index];
                      return Card(
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
                          subtitle: Row(
                            children: [
                              Text(
                                parking.adresse ?? 'Adresse non disponible',
                                style: GoogleFonts.lato(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              const SizedBox(width: 20.0),
                              Text(
                                '${parking.placesDisponibles?.toString() ?? '0'} places',
                                style: GoogleFonts.lato(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                          trailing: IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Bookmarkspage(),
                                ),
                              );
                            },
                            icon: Icon(Icons.bookmark, color: Colors.red),
                          ),
                        ),
                      );
                    },
                  ),
                ),*/
              ],
            );
          }
        },
      ),
    );
  }
  Widget _buildFavoritesList() {
    return ListView.builder(
      itemCount: Bookmarks.favoritesList.length,
      itemBuilder: (context, index) {
        var parking = Bookmarks.favoritesList[index];
        return Card(
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
            subtitle: Row(
              children: [
                Text(
                  parking.adresse ?? 'Adresse non disponible',
                  style: GoogleFonts.lato(
                    fontSize: 16.0,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const SizedBox(width: 20.0),
                Text(
                  '${parking.placesDisponibles?.toString() ?? '0'} places',
                  style: GoogleFonts.lato(
                    fontSize: 16.0,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
            trailing: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Bookmarkspage(),
                  ),
                );
              },
              icon: Icon(Icons.bookmark, color: Colors.red),
            ),
          ),
        );
      },
    );
  }

}

  Widget _buildHistoryList() {
    return ListView.builder(
      itemCount: Reservations.historyList.length,
      itemBuilder: (context, index) {
        var reservation = Reservations.historyList[index];
        var parking = reservation.parking;
        return Card(
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
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  parking.adresse ?? 'Adresse non disponible',
                  style: GoogleFonts.lato(
                    fontSize: 16.0,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const SizedBox(height: 5.0),
                Text(
                  'Début: ${reservation.dateDebut.toLocal().toString().split(' ')[0]}',
                  style: GoogleFonts.lato(
                    fontSize: 14.0,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Text(
                  'Fin: ${reservation.dateFin.toLocal().toString().split(' ')[0]}',
                  style: GoogleFonts.lato(
                    fontSize: 14.0,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
            trailing: Icon(Icons.history, color: Colors.blue),
          ),
        );
      },
    );
  }
  
class Reservations {
  static List<ReservationModel> historyList = [];
}

class ReservationModel {
  final int idReservation;
  final ParkingModel parking;
  final DateTime dateDebut;
  final DateTime dateFin;

  ReservationModel({
    required this.idReservation,
    required this.parking,
    required this.dateDebut,
    required this.dateFin,
  });
}
class Bookmarks {
  static List<ParkingModel> favoritesList = [];

  static Future<void> addFavorite(ParkingModel parking, String userId) async {
    /*if (!favoritesList.contains(parking)) {
      favoritesList.add(parking);
      try {
        final response = await supabase
            .from('favoris')
            .insert({
              'id_parking': parking.id_parking, // Assurez-vous que `parking` a un attribut `id`
              'id': userId, // L'UUID de l'utilisateur
              'date_ajout': DateTime.now().toString(),
            })*/
    if (!favoritesList.any((fav) => fav.id_parking == parking.id_parking)) {
      favoritesList.add(parking);
        try {
          final response = await supabase.from('favoris').insert({
            'id_parking': parking.id_parking, // Assurez-vous que `parking` a un attribut `id_parking`
            'id': userId, // L'UUID de l'utilisateur
            'date_ajout': DateTime.now().toString(),
        })      
          ;
          logger.d(response);

      if (response.error != null) {
        throw response.error!;
      }
      } catch (error) {
        print("Erreur lors de l'ajout aux favoris : $error");
      }
    }
  }
}
