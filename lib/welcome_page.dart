// ignore_for_file: unused_import


import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:parkswift/delaye_animation.dart';
import 'package:parkswift/main.dart';
import 'package:parkswift/connexion.dart';


class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 60,
          horizontal: 30,
        ),
        child: Column(
          children: [
            DealyedAniamtion(
              delay: 10,
              child: Container(
                height: 170,
                child: Image.asset('images/parkswift.png'),
              ),
            ),
            DealyedAniamtion(
              delay: 10,
              child: Container(
                height: 400,
                child: Image.asset('images/confus.jpg'),
              ),
            ),
            DealyedAniamtion(
              delay: 10,
              child: Container(
                margin: const EdgeInsets.only(top: 30, bottom: 20),
                child: Text(
                  'Rapide.Facile.ParkSwift',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(color: Colors.black, fontSize: 16),
                ),
              ),
            ),
            DealyedAniamtion(
              delay: 10,
              child: Container(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: d_red,
                    shape: StadiumBorder(),
                    /*shape permet de mettre les bordures du bouton*/
                    padding: EdgeInsets.all(13),
                  ),
                  child: Text('Commencer ->',
                  style: TextStyle(color: Colors.black),),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Connexion(),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
