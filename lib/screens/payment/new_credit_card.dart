import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:comparking/constants/colors.dart';

class NewCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          MyAppBar(), // Utilisation de l'appBar définie dans la classe MyAppBar
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              child: Image.asset('assets/image/carte-bancaire.webp'),
            ),
            Container(
              height: 50,
              width: double.infinity, // Largeur de la première boîte
              margin: EdgeInsets.only(
                  left: 30, top: 30, right: 30), // Espacement entre les boîtes
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                    10), // Bordure arrondie de la première boîte
                color: sBlue, // Fond transparent de la première boîte
              ),
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'Nom Prenom',
                    contentPadding: EdgeInsets.all(10),
                    border: InputBorder.none),
              ),
            ),
            SizedBox(height: 20),
            Container(
                height: 50,
                width: double.infinity, // Largeur de la première boîte
                margin: EdgeInsets.only(
                    left: 30,
                    top: 10,
                    right: 30), // Espacement entre les boîtes
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                      10), // Bordure arrondie de la première boîte
                  color: sBlue, // Fond transparent de la première boîte
                ),
                child: TextField(
                  decoration: InputDecoration(
                      hintText: 'N°  Carte Bancaire',
                      contentPadding: EdgeInsets.all(10),
                      border: InputBorder.none),
                )),
            SizedBox(height: 20),
            Container(
              //color: Colors.amber,
              //height: 10,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 50,
                      margin: EdgeInsets.only(left: 30, top: 10, right: 30),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: sBlue,
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Date expiration',
                          contentPadding: EdgeInsets.all(10),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 50,
                      margin: EdgeInsets.only(left: 30, top: 10, right: 30),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: sBlue,
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'N° CVV',
                          contentPadding: EdgeInsets.all(10),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),
            Container(
              width: double.infinity,
              margin: EdgeInsets.all(8), // Marge autour du conteneur
              child: Align(
                alignment:
                    Alignment.bottomCenter, // Alignement en bas de la page
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
                    'Ajouter',
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
        'Nouvelle carte', // Titre de l'appBar
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
