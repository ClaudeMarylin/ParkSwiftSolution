import 'package:flutter/material.dart';
import 'package:comparking/screens/menuBar/details_booking.dart';
import 'package:comparking/constants/colors.dart';
import 'package:comparking/screens/authentif/HomePage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supabase/supabase.dart';

class ReservationTap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: SingleChildScrollView(
          child: Column(
        children: [Map(), 
        Detail()],
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
        icon: const Icon(
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
            color: Colors.white, fontSize: 22, fontWeight: FontWeight.w800),
      ),
      centerTitle: true,
      actions: [
        IconButton(
            onPressed: () {
              // Redirigera le user vers la page lui permettant de voir la distance entre le parking choisi et sa destination sur la carte
            },
            icon: Icon(
              Icons.place,
              color: Colors.white,
            ))
      ],
    );
  }
}

class Map extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: sBlue,
    );
  }
}

class Detail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(8, 20, 8, 20),
      child: Column(
        children: [
          Container(
            child: Text(
              'Détails',
              style:
                  GoogleFonts.nunito(fontSize: 22, fontWeight: FontWeight.w800),
            ),
          ),
          const SizedBox(height: 15),
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
                  ])),
          const SizedBox(height: 15),
          Container(
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Logique à exécuter lorsque le bouton "Cancel" est pressé
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: sBlue,
                    minimumSize: Size(150, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'Cancel',
                    style: TextStyle(color: pBlue),
                  ),
                ),
                const SizedBox(width: 15),
                ElevatedButton(
                  onPressed: () {
                    // Logique à exécuter lorsque le bouton "Détails" est pressé
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailParking(),
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
                    'Détails',
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
