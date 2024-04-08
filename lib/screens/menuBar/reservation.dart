import 'package:flutter/material.dart';
import 'package:comparking/screens/menuBar/details_booking.dart';
import 'package:comparking/constants/colors.dart';
import 'package:comparking/screens/authentif/HomePage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supabase/supabase.dart';

// Initialisation de SupabaseClient
final supabase = SupabaseClient('https://ussrntnvxurlkukwhiej.supabase.co', 'SUPABASE_CLIENT_API_KEY');

class ReservationTap extends StatefulWidget {
  @override
  _ReservationTapState createState() => _ReservationTapState();
}

class _ReservationTapState extends State<ReservationTap> {
  // Liste des parkings
  var _parkings = <Map<String, dynamic>>[];
  String? _selectedParkingId;

  @override
  void initState() {
    super.initState();
    // Chargement des parkings au démarrage de l'application
    _loadParkings();
  }

// Fonction pour charger les parkings depuis Supabase
Future<void> _loadParkings() async {
  try {
    final response = await supabase.from('parking').select();
    setState(() {
      _parkings = response as List<Map<String, dynamic>>;
    });
  } catch (e) {
    // Handle the error here
    print('Error loading parkings: $e');
  }
}
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            MapWidget(),
            DetailWidget(
              parkings: _parkings,
              onParkingSelected: (parkingId) {
                setState(() {
                  _selectedParkingId = parkingId;
                });
              },
            ),
            ElevatedButton(
              onPressed: () async {
                // Vérifier si un parking a été sélectionné
                if (_selectedParkingId == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Veuillez sélectionner un parking')),
                  );
                  return;
                }

                // Récupérer l'utilisateur actuel
                final user = supabase.auth.currentUser;
                final userId = user?.id;

                // Récupérer les informations du parking sélectionné
                final selectedParking = _parkings.firstWhere((parking) => parking['id_parking'] == _selectedParkingId);

                // Récupérer l'heure actuelle
                final now = DateTime.now();
                final startTime = DateTime(now.year, now.month, now.day, 8, 0, 0);
                final endTime = startTime.add(Duration(hours: 2));

                // Insérer les informations de réservation dans la table des réservations
                await supabase.from('reservations').insert([
                  {
                    'id_utilisateur': userId,
                    'id_parking': _selectedParkingId,
                    'date_debut': startTime,
                    'date_fin': endTime,
                    'duree': endTime.difference(startTime).inMinutes,
                    'statut': 'PENDING',
                  },
                ]);

                // Insérer les informations du parking dans la table des parkings
                await supabase.from('parking').insert([
                  {
                    'id_parking': _selectedParkingId,
                    'nom': selectedParking['nom'],
                    'adresse': selectedParking['adresse'],
                    'latitude': selectedParking['latitude'],
                    'longitude': selectedParking['longitude'],
                    'places_disponibles': selectedParking['places_disponibles'],
                    'capacite_totale': selectedParking['capacite_totale'],
                    'tarif': selectedParking['tarif'],
                    'devise': selectedParking['devise'],
                    'id_agence': selectedParking['id_agence'],
                    'imageURL': selectedParking['imageURL'],
                  },
                ]);

                // Afficher un message de succès
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Réservation créée avec succès')),
                );

                // Naviguer vers la page d'accueil
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ),
                );
              },
              child: Text('Réserver'),
            ),
          ],
        ),
      ),
    );
  }
}

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(),
            ),
          );
        },
      ),
      backgroundColor: pBlue,
      title: Text(
        "Reservations",
        style: GoogleFonts.nunito(
          color: Colors.white,
          fontSize: 22,
          fontWeight: FontWeight.w800,
        ),
      ),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () {
            // Rediriger l'utilisateur vers la page lui permettant de voir la distance entre le parking choisi et sa destination sur la carte
          },
          icon: Icon(
            Icons.place,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}

class MapWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: sBlue,
    );
  }
}

class DetailWidget extends StatelessWidget {
  final List<Map<String, dynamic>> parkings;
  final Function(String) onParkingSelected;

  DetailWidget({required this.parkings, required this.onParkingSelected});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (var parking in parkings)
          ListTile(
            title: Text(parking['nom'] ?? ''),
            subtitle: Text(parking['adresse'] ?? ''),
            trailing: ElevatedButton(
              onPressed: () {
                onParkingSelected(parking['id_parking'].toString());
              },
              child: Text('Sélectionner'),
            ),
          ),
      ],
    );
  }
}
