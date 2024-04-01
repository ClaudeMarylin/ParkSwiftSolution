// ignore_for_file: unused_import

import 'package:comparking/widgets/DelayedAnimation.dart';
import 'package:flutter/material.dart';
import 'package:comparking/constants/colors.dart';
import 'dart:async';
import 'package:comparking/screens/authentif/connexion.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class Inscription extends StatelessWidget {
  var _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        // Image en arrière-plan
        children: [
          Image.asset(
            'assets/image/back_insc.png',
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Zone pour ajouter des boutons, champs de texte, etc.
                DelayedAnimation(
                  delay: 0,
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
                            'INSCRIPTION',
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
                DelayedAnimation(
                  delay: 0,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Nom d\'utilisateur',
                        labelStyle: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
                DelayedAnimation(
                  delay: 0,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
                DelayedAnimation(
                  delay: 0,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Téléphone',
                        labelStyle: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
                DelayedAnimation(
                  delay: 0,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.8,
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
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ),

                // InscriptionContent(),
                SizedBox(height: 100),

                DelayedAnimation(
                  delay: 0,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: dRed,
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
                    onPressed: () {},
                  ),
                ),
                /*BOUTONS*/

                TextButton(
                  onPressed: () {
                    // Logique pour réinitialiser le mot de passe, par exemple
                  },
                  child: Text(
                    'Se connecter via un réseau social',
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

void setState(Null Function() param0) {}
