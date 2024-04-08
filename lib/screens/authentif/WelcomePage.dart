// ignore_for_file: unused_import

import 'package:comparking/widgets/DelayedAnimation.dart';
import 'package:flutter/material.dart';
import 'package:comparking/main.dart';
import 'package:comparking/constants/colors.dart';
import 'package:comparking/screens/authentif/connexion.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 60,
          horizontal: 30,
        ),
        child: Column(
          children: [
            Container(
                height: 170, child: Image.asset('assets/image/parkswift.png')),
            Container(
              margin: const EdgeInsets.only(top: 30, bottom: 20),
              child: const Text('Rapide.Facile.ParkSwift',
                  style: TextStyle(color: Colors.black, fontSize: 18)),
            ),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: dRed,
                    shape: StadiumBorder(),
                    padding:
                        EdgeInsets.symmetric(vertical: 13, horizontal: 125),
                  ),
                  child: const Text(
                    'Demarrer',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Connexion(),
                      ),
                    );
                  }),
            ),

/*DelayedAnimation(
    delay: 0,
    child: Container(
      height: 400,
      alignment: AlignmentDirectional.center,
      child:Text('Nom de l''application',
        textAlign: TextAlign.center,
        style: GoogleFonts.poppins(color: Colors.black, fontSize: 25),
      ), //normalement je mettrai le nom de l'application//
    )
)*/
          ],
        ),
      ),
    );
  }
}
