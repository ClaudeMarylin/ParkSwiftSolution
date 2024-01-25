// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:parkswift/delaye_animation.dart';
import 'package:parkswift/main.dart';
import 'package:parkswift/inscription.dart';
import 'package:parkswift/home_screen.dart';

class Connexion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        // Image en arrière-plan
        children: [
          Image.asset(
            'images/back_connexion.png',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          /*icone de retour à la page*/
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
                            'HELLO',
                            style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 50,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Connecte toi à ton compte😉 !',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                /*BOUTONS*/

                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Inscription(),
                      ),
                    );
                    // Logique pour réinitialiser le mot de passe, par exemple
                  },
                  child: Text('Pas de compte? Inscris-toi',
                  style: TextStyle(color: const Color.fromARGB(255, 184, 51, 42)),),
                ),
                DealyedAniamtion(
                  delay: 1000,
                  child: Container(
                    margin: EdgeInsets.symmetric(
                      vertical: 80,
                      horizontal: 60,
                    ),
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: d_red,
                        shape: StadiumBorder(),
                        /*shape permet de mettre les bordures du bouton*/
                        padding: EdgeInsets.all(13),
                      ),
                      child: Text(
                        'Se connecter',
                        style: TextStyle(color: Colors.black),
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
                  ),
                ),

                TextButton(
                  onPressed: () {
                    // Logique pour réinitialiser le mot de passe, par exemple
                  },
                  child: Text('Mot de passe oublié ?',
                  style: TextStyle(color: Colors.black),),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}





/*AUTRES FACONS DE METTRE LICONE DE RETOUR ET LIMAGE EN BACKGROUND*/
//  body: Container(
//         child: Positioned(
//           top: 16.0,
//           left: 16.0,
//           child: IconButton(
//             icon: Icon(
//               Icons.arrow_back,
//               color: Colors.black,
//               size: 16,
//             ),
//             onPressed: () {
//               Navigator.pop(context);
//             },
//           ),
//         ),
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage('images/back_connexion.png'),
//             fit: BoxFit.cover,
//           ),
//         ),
//       ),