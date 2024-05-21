import 'package:comparking/screens/authentif/connexion.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatelessWidget {
  final Map<String, dynamic> userData = {
    'name': 'John Doe',
    'email': 'john.doe@example.com',
    'profileImage':
        'https://www.example.com/profile.jpg', // Remplacez par une URL valide
    'phone': '+1234567890',
    'address': '123, Main Street, City, Country'
  };

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(userData['profileImage']),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Text(
                  userData['name'],
                  style: GoogleFonts.nunito(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Center(
                child: Text(
                  userData['email'],
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
                  userData['phone'],
                  style: GoogleFonts.nunito(fontSize: 16),
                ),
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.location_on),
                title: Text(
                  'Adresse',
                  style: GoogleFonts.nunito(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  userData['address'],
                  style: GoogleFonts.nunito(fontSize: 16),
                ),
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text(
                  'Paramètres du compte',
                  style: GoogleFonts.nunito(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  // Action pour naviguer vers les paramètres du compte
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
                  // Action pour déconnecter l'utilisateur
                  {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Connexion()));
                  };
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
