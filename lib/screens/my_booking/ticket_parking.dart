import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:comparking/constants/colors.dart'; // Importation du fichier main.dart

class TicketParking extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          MyAppBar(), // Utilisation de l'appBar définie dans la classe MyAppBar
      body: SingleChildScrollView(
        child: Column(
          children: [QrCode(), InfReservation()],
        ),
      ),
    );
  }
}

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  Size get preferredSize =>
      new Size.fromHeight(50); // Taille préférée de l'appBar
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
        'Ticket de parking', // Titre de l'appBar
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

class QrCode extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: sBlue,
    );
  }
}

class InfReservation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20),
      //color: pBlue,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 30),
                  //color: Colors.amber,
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Nom'),
                      Text(
                        'Nom',
                        style: TextStyle(fontWeight: FontWeight.w800),
                      ),
                      SizedBox(height: 15),
                      Text('Nom parking'),
                      Text(
                        'Adresse parking',
                        style: TextStyle(fontWeight: FontWeight.w800),
                      ),
                      SizedBox(height: 15),
                      Text('Durée'),
                      Text(
                        'Durée',
                        style: TextStyle(fontWeight: FontWeight.w800),
                      ),
                      SizedBox(height: 15),
                      Text('Heure'),
                      Text(
                        'Heure',
                        style: TextStyle(fontWeight: FontWeight.w800),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                //height: 20,
                width: 150,
                //color: Colors.red,
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Véhicule'),
                    Text(
                      'Véhicule',
                      style: TextStyle(fontWeight: FontWeight.w800),
                    ),
                    SizedBox(height: 15),
                    Text('Place parking'),
                    Text(
                      'Place parking',
                      style: TextStyle(fontWeight: FontWeight.w800),
                    ),
                    SizedBox(height: 15),
                    Text('Date'),
                    Text(
                      'Date',
                      style: TextStyle(fontWeight: FontWeight.w800),
                    ),
                    SizedBox(height: 15),
                    Text('Téléphone'),
                    Text(
                      'Téléphone',
                      style: TextStyle(fontWeight: FontWeight.w800),
                    )
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: 120),
          Container(
            width: double.infinity,
            margin: EdgeInsets.all(8), // Marge autour du conteneur
            child: Align(
              alignment: Alignment.bottomCenter, // Alignement en bas de la page
              child: ElevatedButton(
                onPressed: () {
                  // Logique à exécuter lorsque le bouton est pressé
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: pBlue,
                  minimumSize: const Size(350, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Accéder au parking',
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
