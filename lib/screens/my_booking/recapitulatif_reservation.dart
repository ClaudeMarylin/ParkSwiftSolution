import 'package:comparking/screens/my_booking/ticket_parking.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// Importation du fichier main.dart
import 'package:comparking/constants/colors.dart';

class RecapitulatifReservation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          MyAppBar(), // Utilisation de l'appBar définie dans la classe MyAppBar
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              width: double.infinity, // Largeur de la première boîte
              margin: EdgeInsets.only(
                  left: 30, top: 30, right: 30), // Espacement entre les boîtes
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                    10), // Bordure arrondie de la première boîte
                color: sBlue, // Fond transparent de la première boîte
              ),
              child: Column(
                children: [
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text('Place de parking'), Text('Nom parking')],
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text('Adresse'), Text('Adresse')],
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text('Véhicule'), Text('Véhicule')],
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text('Position'), Text('Position')],
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text('Date'), Text('Date')],
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text('Durée'), Text('Durée')],
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text('Heure'), Text('Heure')],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity, // Largeur de la première boîte
              margin: EdgeInsets.only(
                  left: 30, top: 30, right: 30), // Espacement entre les boîtes
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                    10), // Bordure arrondie de la première boîte
                color: sBlue, // Fond transparent de la première boîte
              ),
              child: Column(
                children: [
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text('Montant'), Text('Montant')],
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text('Taxes & Frais(10%)'), Text('Taxe')],
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text('Total'), Text('total')],
                    ),
                  ),
                ],
              ),
            ),

            ///type de paiment utiliser////
            Container(
              width: double.infinity, // Largeur de la première boîte
              margin: EdgeInsets.only(
                  left: 30, top: 30, right: 30), // Espacement entre les boîtes
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                    10), // Bordure arrondie de la première boîte
                color: sBlue, // Fond transparent de la première boîte
              ),
            ),

            ///----------///
            Container(
              width: double.infinity,
              margin: EdgeInsets.all(8), // Marge autour du conteneur
              child: Align(
                alignment:
                    Alignment.bottomCenter, // Alignement en bas de la page
                child: ElevatedButton(
                  onPressed: () {
                    // Logique à exécuter lorsque le bouton est pressé
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TicketParking(),
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
                  child: Text(
                    'Confirmer le paiment',
                    style: TextStyle(color: sBlue),
                  ),
                ),
              ),
            ),
          ],
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
        'Récapitulatif', // Titre de l'appBar
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
