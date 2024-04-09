import 'package:comparking/constants/colors.dart';
import 'package:comparking/screens/other/car_choice.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailParking extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: SingleChildScrollView(
          child: Column(
        children: [MoreDetailParking()],
      )),
    );
  }
}

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  Size get preferredSize => new Size.fromHeight(50);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      backgroundColor: pBlue,
      title: Text(
        "Détails du parking",
        style: GoogleFonts.nunito(
            color: Colors.white, fontSize: 22, fontWeight: FontWeight.w800),
      ),
      centerTitle: true,
    );
  }
}

class MoreDetailParking extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(8, 20, 8, 20),
      child: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 10),
                  child: Image.asset('assets/image/images_parking.jpeg'),
                ),
                Container(
                  margin: EdgeInsets.only(right: 10),
                  child: Image.asset('assets/image/images_parking.jpeg'),
                ),
                Container(
                  margin: EdgeInsets.only(right: 10),
                  child: Image.asset('assets/image/images_parking.jpeg'),
                ),
                // Ajoutez autant d'images que vous le souhaitez ici
              ],
            ),
          ),
          const SizedBox(height: 15),
          Container(
              width: double.infinity,
              color: sBlue,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            //color: pBlue,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Nom Parking',
                                    textAlign: TextAlign.left,
                                    style: GoogleFonts.nunito(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    'Adresse Parking',
                                    textAlign: TextAlign.left,
                                    style: GoogleFonts.nunito(
                                      fontSize: 18,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ]),
                          ),
                        ),
                        Container(
                          //height: 50,
                          //width: 50,
                          //color: sBlue,
                          child: ElevatedButton(
                              onPressed: () {
                                // Logique à exécuter lorsque le bouton "bookmark" est pressé
                              },
                              child: Icon(
                                Icons.bookmark,
                                color: pBlue,
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                elevation: 0,
                              )),
                        )
                      ],
                    )
                  ])),
          const SizedBox(height: 15),
          /*-----------------------------*/

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 30,
                width: 100, // Largeur de la première boîte
                margin:
                    EdgeInsets.only(right: 8), // Espacement entre les boîtes
                decoration: BoxDecoration(
                  border: Border.all(
                      color: pBlue, width: 1), // Bordure de la première boîte
                  borderRadius: BorderRadius.circular(
                      10), // Bordure arrondie de la première boîte
                  color: Colors
                      .transparent, // Fond transparent de la première boîte
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.place, color: pBlue),
                    SizedBox(width: 4), // Espacement entre l'icône et le texte
                    Text('distance', style: TextStyle(color: pBlue)),
                  ],
                ),
              ),
              Container(
                height: 30,
                width: 100, // Largeur de la deuxième boîte
                margin:
                    EdgeInsets.only(right: 8), // Espacement entre les boîtes
                decoration: BoxDecoration(
                  border: Border.all(
                      color: pBlue, width: 1), // Bordure de la deuxième boîte
                  borderRadius: BorderRadius.circular(
                      10), // Bordure arrondie de la deuxième boîte
                  color: Colors
                      .transparent, // Fond transparent de la deuxième boîte
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.access_time_rounded, color: pBlue),
                    SizedBox(width: 4), // Espacement entre l'icône et le texte
                    Text('time', style: TextStyle(color: pBlue)),
                  ],
                ),
              ),
              Container(
                height: 30,
                width: 100, // Largeur de la troisième boîte
                decoration: BoxDecoration(
                  border: Border.all(
                      color: pBlue, width: 1), // Bordure de la troisième boîte
                  borderRadius: BorderRadius.circular(
                      10), // Bordure arrondie de la troisième boîte
                  color: Colors
                      .transparent, // Fond transparent de la troisième boîte
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    /*Icon(Icons.place, color: pBlue),*/
                    SizedBox(width: 4), // Espacement entre l'icône et le texte
                    Text('Valet', style: TextStyle(color: pBlue)),
                  ],
                ),
              ),
            ],
          ),

          /*-------------------------------*/
          const SizedBox(height: 15),
          Container(
            width: double.infinity,
            color: sBlue,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Description',
                  textAlign: TextAlign.left,
                  style: GoogleFonts.nunito(
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'texte',
                  textAlign: TextAlign.left,
                  style: GoogleFonts.nunito(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          Container(
            width: 300,
            color: sBlue,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'tarif',
                  //textAlign: TextAlign.left,
                  style: GoogleFonts.nunito(
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                    color: pBlue,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  '/Heure',
                  //textAlign: TextAlign.left,
                  style: GoogleFonts.nunito(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          Container(
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Logique à exécuter lorsque le bouton "Annuler" est pressé
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
                    style: TextStyle(color: pBlue),
                  ),
                ),
                const SizedBox(width: 15),
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
                    backgroundColor:
                        pBlue, // Couleur d'arrière-plan du bouton Détails
                    minimumSize: Size(150, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          10), // Bordure arrondie du bouton Détails
                    ),
                  ),
                  child: Text(
                    'Réserver',
                    style: TextStyle(color: sBlue),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
