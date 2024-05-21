import 'package:comparking/helper/helper_functions.dart';
import 'package:comparking/main.dart';
import 'package:comparking/screens/authentif/HomePage.dart';
import 'package:comparking/screens/authentif/connexion.dart';
import 'package:comparking/screens/authentif/inscription.dart';
import 'package:comparking/screens/user/profile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:comparking/screens/settings/notifications.dart';
import 'package:comparking/constants/colors.dart';

import 'package:supabase_flutter/supabase_flutter.dart';

class MoreSetting extends StatefulWidget {
  const MoreSetting({Key? key}) : super(key: key);

  @override
  _MoreSettingState createState() => _MoreSettingState();
}

class _MoreSettingState extends State<MoreSetting> {
  late Future<List<Json>?> _parkings ;

  @override
  void initState() {
    super.initState();
    _parkings = fetchParkings();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const HomePage()));
          },
        ),
        backgroundColor: pBlue,
        title: Text(
          "Plus",
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
              // Rediriger l'utilisateur vers la page de distance entre le parking et sa destination
            },
            icon: const Icon(
              Icons.more_horiz,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Row(
        children: [
          Container(
            width: 200, // Largeur du menu latéral
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                ListTile(
                  leading: const Icon(Icons.person),
                  title: Text('Mon compte'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ProfilePage()), // Naviguer vers la page de profil
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.notifications_none),
                  title: Text('Notifications'),
                  onTap: () {
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => Notifications()));
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.payment_outlined),
                  title: Text('Paiements'),
                  onTap: () {
                    // Action pour les paiements
                  },
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.security),
                  title: Text('Securité'),
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(Icons.help_center_outlined),
                  title: Text('Aide'),
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(Icons.language),
                  title: Text('Langues'),
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(Icons.settings),
                  title: Text('Paramètres'),
                  onTap: () {},
                ),
                // Container(
                //   alignment: Alignment.center,
                //   padding: const EdgeInsets.only(bottom: 10.0),
                //   child: ListTile(
                //     title: Text(
                //       "Se déconnecter",
                //       textAlign: TextAlign.center,
                //       style: GoogleFonts.nunito(
                //         color: Colors.red,
                //       ),
                //     ),
                //     trailing: const Icon(Icons.logout_outlined, color: Colors.red),
                //     onTap: () {
                //       Navigator.push(context, MaterialPageRoute(builder: (context) => Connexion()));
                //     },
                //   ),
                // ),
              ],
            ),
          ),
          Expanded(
            child: FutureBuilder<List<Json>?>(
              future: _parkings,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Erreur: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text('Aucun parking trouvé'));
                } else {
                  final parkings = snapshot.data!;
                  return ListView.builder(
                    itemCount: parkings.length,
                    itemBuilder: (context, index) {
                      final parking = parkings[index];
                      return ListTile(
                        title: Text(parking['nom'] ?? ''),
                        subtitle: Text(parking['imageURL'] ?? ''),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

// Fonction pour récupérer les parkings depuis la base de données
Future<List<Map<String, dynamic>>?> fetchParkings() async {
  try {
    return await supabase.from('parking').select('nom, imageURL');
  } on PostgrestException catch (error, stackTrace) {
    logger.e(error.message, stackTrace: stackTrace);
    logger.e(error.details);
    return null;
  } catch (e, stackTrace) {
    logger.e("$e", stackTrace: stackTrace);
    return null;
  }
}
