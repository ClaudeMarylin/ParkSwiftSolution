import 'package:comparking/screens/bookmarksPage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:comparking/screens/authentif/connexion.dart';

import '../../helper/helper_functions.dart';
import '../../main.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late Future<Map<String, dynamic>?> _userProfile;
  String _editedName = '';
  bool _isEditingName = false;

  @override
  void initState() {
    super.initState();
    _userProfile = fetchUserProfile();
  }
// Future<List<Map<String, dynamic>>?> fetchUtilisateurs() async {
//   try {
//     return await supabase.from('profiles').select('name, email, phone');
//   } on PostgrestException catch (error, stackTrace) {
//     logger.e(error.message, stackTrace: stackTrace);
//     logger.e(error.details);
//     return null;
//   } catch (e, stackTrace) {
//     logger.e("$e", stackTrace: stackTrace);
//     return null;
//   }
// }
  Future<PostgrestMap?> fetchUserProfile() async {
    final user = supabase.auth.currentUser;
    if (user == null) {
      return null;
    }
    try {
    final profile =  await supabase
    .from('profiles')
    .select('name, email, phone, profile_image')
    .eq('id', user.id).single();
    return profile;
  } on PostgrestException catch (error, stackTrace) {
    logger.e(error.message, stackTrace: stackTrace);
    logger.e(error.details);

  }
    catch (e, stackTrace) {
    logger.e("$e", stackTrace: stackTrace);
    return null;
  }
    }






  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profil',
          style: GoogleFonts.nunito(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.w800,
          ),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: FutureBuilder<Map<String, dynamic>?>(
        future: _userProfile,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erreur : ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return Center(child: Text('Utilisateur non trouvé'));
          } else {
            final userData = snapshot.data!;
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        // Action lorsque l'utilisateur appuie sur l'image du profil
                        // Ajoutez ici la navigation ou l'action désirée
                        //print('Utilisateur non authentifié');
                         _editName();
                        
                      },
                      child: Center(
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage: NetworkImage(userData['profile_image'] ?? ''),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: Text(
                        userData['name'] ?? '',
                        style: GoogleFonts.nunito(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Center(
                      child: Text(
                        userData['email'] ?? '',
                        style: GoogleFonts.nunito(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.phone),
                      title: Text(
                        'Téléphone',
                        style: GoogleFonts.nunito(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        userData['phone'] ?? '',
                        style: GoogleFonts.nunito(fontSize: 16),
                      ),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.bookmark),
                      title: Text(
                        'Mes favoris',
                        style: GoogleFonts.nunito(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onTap: () {
                        // Action pour naviguer vers les paramètres du compte
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Bookmarkspage(),
                          ),
                        );
                      },
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.logout, color: Colors.red),
                      title: Text(
                        'Se déconnecter',
                        style: GoogleFonts.nunito(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                      onTap: () {
                        supabase.auth.signOut();
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => Connexion()));
                      },
                    ),
                    Divider(),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
   void _editName() {
    setState(() {
      //_editedName = _userProfile['name'] ?? '';
      _isEditingName = true;
    });
  }
  void _saveName() {
    // Ajoutez ici le code pour enregistrer le nouveau nom dans la base de données
    setState(() {
      _isEditingName = false;
    });
  }
  void _cancelEditName() {
    setState(() {
      //_editedName = _userProfile['name'] ?? '';
      _isEditingName = false;
    });
  }
  Widget _buildNameField() {
    return TextFormField(
      initialValue: _editedName,
      onChanged: (value) {
        setState(() {
          _editedName = value;
        });
      },
      decoration: InputDecoration(
        hintText: 'Entrez votre nom',
        labelText: 'Nom',
      ),
    );
  }
   Widget _buildNameSection(Map<String, dynamic> userData) {
    if (_isEditingName) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildNameField(),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: _saveName,
                child: Text('Enregistrer'),
              ),
              SizedBox(width: 10),
              TextButton(
                onPressed: _cancelEditName,
                child: Text('Annuler'),
              ),
            ],
          ),
        ],
      );
    } else {
      return Center(
        child: Text(
          _editedName,
          style: GoogleFonts.nunito(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    }
  }
}







// import 'package:comparking/helper/helper_functions.dart';
// import 'package:comparking/main.dart';
// import 'package:comparking/screens/authentif/connexion.dart';
// import 'package:comparking/services/gestData/fetch_functions.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';
//
// class ProfilePage extends StatefulWidget {
//   const ProfilePage({Key? key}) : super(key: key);
//
//   @override
//   _ProfilePageState createState() => _ProfilePageState();
// }
//
// class _ProfilePageState extends State<ProfilePage> {
//   late Future<List<Map<String, dynamic>>?> _Utilisateurs;
//
//   @override
//   void initState() {
//     super.initState();
//     _Utilisateurs = fetchUtilisateurs();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Profil',
//           style: GoogleFonts.nunito(
//             color: Colors.white,
//             fontSize: 22,
//             fontWeight: FontWeight.w800,
//           ),
//         ),
//         backgroundColor: Colors.blue,
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Center(
//                 child: CircleAvatar(
//                   radius: 50,
//                   backgroundImage: NetworkImage(userData['profileImage']),
//                 ),
//               ),
//               SizedBox(height: 20),
//               Center(
//                 child: Text(
//                   userData['name'],
//                   style: GoogleFonts.nunito(
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//               SizedBox(height: 10),
//               Center(
//                 child: Text(
//                   userData['email'],
//                   style: GoogleFonts.nunito(
//                     fontSize: 16,
//                     color: Colors.grey,
//                   ),
//                 ),
//               ),
//               SizedBox(height: 20),
//               Divider(),
//               ListTile(
//                 leading: Icon(Icons.phone),
//                 title: Text(
//                   'Téléphone',
//                   style: GoogleFonts.nunito(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 subtitle: Text(
//                   userData['phone'],
//                   style: GoogleFonts.nunito(fontSize: 16),
//                 ),
//               ),
//               Divider(),
//               ListTile(
//                 leading: Icon(Icons.location_on),
//                 title: Text(
//                   'Adresse',
//                   style: GoogleFonts.nunito(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 subtitle: Text(
//                   userData['address'],
//                   style: GoogleFonts.nunito(fontSize: 16),
//                 ),
//               ),
//               Divider(),
//               ListTile(
//                 leading: Icon(Icons.settings),
//                 title: Text(
//                   'Paramètres du compte',
//                   style: GoogleFonts.nunito(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 onTap: () {
//                   // Action pour naviguer vers les paramètres du compte
//                 },
//               ),
//               Divider(),
//               ListTile(
//                 leading: Icon(Icons.logout, color: Colors.red),
//                 title: Text(
//                   'Se déconnecter',
//                   style: GoogleFonts.nunito(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.red,
//                   ),
//                 ),
//                 onTap: () {
//                   // Action pour déconnecter l'utilisateur
//                   Navigator.push(context,
//                       MaterialPageRoute(builder: (context) => Connexion()));
//                 },
//               ),
//               Divider(),
//               FutureBuilder<List<Map<String, dynamic>>?>(
//                 future: _Utilisateurs,
//                 builder: (context, snapshot) {
//                   if (snapshot.connectionState == ConnectionState.waiting) {
//                     return Center(child: CircularProgressIndicator());
//                   } else if (snapshot.hasError) {
//                     return Center(child: Text('Erreur : ${snapshot.error}'));
//                   } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//                     return Center(child: Text('Aucun utilisateur trouvé'));
//                   } else {
//                     final utilisateurs = snapshot.data!;
//                     return ListView.builder(
//                       physics: NeverScrollableScrollPhysics(),
//                       shrinkWrap: true,
//                       itemCount: utilisateurs.length,
//                       itemBuilder: (context, index) {
//                         final utilisateur = utilisateurs[index];
//                         return ListTile(
//                           title: Text(utilisateur['email'] ?? ''),
//                           // subtitle: Text(utilisateur['email'] ?? ''),
//                         );
//                       },
//                     );
//                   }
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// Future<List<Map<String, dynamic>>?> fetchUtilisateurs() async {
//   try {
//     return await supabase.from('profiles').select('name, email, phone');
//   } on PostgrestException catch (error, stackTrace) {
//     logger.e(error.message, stackTrace: stackTrace);
//     logger.e(error.details);
//     return null;
//   } catch (e, stackTrace) {
//     logger.e("$e", stackTrace: stackTrace);
//     return null;
//   }
// }
//
// final Map<String, dynamic> userData = {
//   'name': 'Sharon Volley',
//   'email': 'sharon@gmail.com',
//   'profileImage':
//       'https://tse2.mm.bing.net/th?id=OIP.gi9KS8sqHTQMH_iGrjLX0wHaE8&pid=Api&P=0&h=180', // Remplacez par une URL valide
//   'phone': '+33744882679',
//   'address': '156 Avenue Le noir, 93000 Cergy'
// };
