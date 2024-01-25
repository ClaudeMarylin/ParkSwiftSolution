// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:parkswift/delaye_animation.dart';
import 'package:parkswift/main.dart';
import 'package:parkswift/connexion.dart';

class InscriptionContent extends StatelessWidget {
  // declation de variable pour rendre me mdp invisible
  var _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child: Column(
        children: [
          /*nom*/
          DealyedAniamtion(
            delay: 1000,
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Nom d\'utilisateur',
                labelStyle: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          /*Email*/
          DealyedAniamtion(
            delay: 1000,
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          /*Téléphone*/
          DealyedAniamtion(
            delay: 1000,
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Téléphone',
                labelStyle: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
          ),

          /*Mot de passe*/
          DealyedAniamtion(
            delay: 1000,
            child: TextField(
              obscureText: _obscureText,
              decoration: InputDecoration(
                labelText: 'Mot de passe',
                labelStyle: TextStyle(
                  color: Colors.grey,
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    Icons.visibility,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    //methode pour rafraichir le widget lorsqu'on appui sur l'oiel
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void setState(Null Function() param0) {}
}

class Inscription extends StatelessWidget {
  // _InscriptionState createState() => _InscriptionState();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        // Image en arrière-plan
        children: [
          Image.asset(
            'images/back_insc.png',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
// icone de retour à la page
          Positioned(
            top: 16.0,
            left: 16.0,
            child: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
                size: 30,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          // Contenu de la page
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Zone pour ajouter des boutons, champs de texte, etc.
                DealyedAniamtion(
                  delay: 1000,
                  child: Container(
                    height: 200,
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: 40,
                        horizontal: 30,
                      ),
                      child: Column(
                        children: [
                          Text(
                            'Inscription',
                            style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 40,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ),
                ),

                InscriptionContent(),
                SizedBox(height: 100),
                DealyedAniamtion(
                  delay: 1200,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: d_red,
                      //shape: StadiumBorder()
                      padding: EdgeInsets.symmetric(
                        vertical: 13,
                        horizontal: 125,
                      ),
                    ),
                    child: Text(
                      'S\inscrire',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      
                    },
                  ),
                ),
                /*BOUTONS*/

                TextButton(
                  onPressed: () {
                    // Logique pour réinitialiser le mot de passe, par exemple
                  },
                  child: Text('Se connecter via un réseau social',
                 style: GoogleFonts.poppins(
                        color: Colors.black,
                  ),
                ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
