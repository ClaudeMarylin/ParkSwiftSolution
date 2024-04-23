import 'package:comparking/widgets/DelayedAnimation.dart';
import 'package:comparking/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:comparking/screens/authentif/HomePage.dart';
import 'package:comparking/screens/authentif/inscription.dart';
import 'package:comparking/main.dart';
import 'package:supabase/supabase.dart';

class Connexion extends StatefulWidget {
  @override
  _ConnexionState createState() => _ConnexionState() ;
}

class _ConnexionState extends State<Connexion> {
  bool _isObscure = true;
  TextEditingController emailController = TextEditingController() ;
  TextEditingController passwordController = TextEditingController() ;

  // Méthode pour la connexion de l'utilisateur
  Future<void> signIn() async{
    try{
      await supabase.auth.signInWithPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim()
      );
      if(!mounted) return;

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>  HomePage())) ;
    } on AuthException catch (e){
      print(e);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
            // Image en arrière-plan
            children: [
          Image.asset(
            'assets/image/back_connexion.png',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          /*icone de retour à la page*/
          Positioned(
            top: 16.0,
            left: 16.0,
            child: IconButton(
              icon: const Icon(
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

                DelayedAnimation(
                  delay: 0,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: TextField(
                      controller: emailController,
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
                      controller: passwordController,
                      obscureText: _isObscure,
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
                              _isObscure = !_isObscure;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ),

                /*BOUTONS*/

                DelayedAnimation(
                  delay: 0,
                  child: Container(
                    margin: EdgeInsets.symmetric(
                      vertical: 0,
                      horizontal: 60,
                    ),
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: dRed,
                        shape: StadiumBorder(),
                        /*shape permet de mettre les bordures du bouton*/
                        padding: EdgeInsets.all(13),
                      ),
                      child: Text(
                        'Se connecter',
                        style: TextStyle(color: Colors.black),
                      ),
                      onPressed: () => signIn(),
                    ),
                  ),
                ),

                SizedBox(height: 20),
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
                  child: RichText(
                    text: const TextSpan(
                      text: 'Pas de compte?',
                      style: TextStyle(color: Colors.black),
                      children: <TextSpan>[
                        TextSpan(
                          text: ' Inscris-toi',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline),
                        )
                      ],
                    ),
                  ),
                ),

                Spacer(),

                Padding(
                  padding: EdgeInsets.only(right: 30, bottom: 20),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: InkWell(
                      onTap: () {
                        // Action lorsque le lien est cliqué
                      },
                      child: const Text(
                        'Mot de passe oublié ?',
                        style:  TextStyle(
                          color: Colors.red,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                ),
                // TextButton(
                //   onPressed: () {
                //     // Logique pour réinitialiser le mot de passe, par exemple
                //   },
                //   child: Text(
                //     'Mot de passe oublié ?',
                //     style: TextStyle(color: Colors.black),
                //   ),
                // ),
              ],
            ),
          ),
        ]));
  }

  //void setState(Null Function() param0) {}
}


// class Connexion extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           //Image d'arriere plan
//           /*Image.asset('assets/image/back_connexion.png',
//             width: double.infinity,
//           height: double.infinity,
//           fit: BoxFit.cover,
//         ),*/

//           Positioned(
//             top: 16.0,
//             left: 16.0,
//             child: IconButton(
//               icon: Icon(
//                 Icons.arrow_back,
//                 color: Colors.black,
//                 size: 30,
//               ),
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//             ),
//           ),
// //Contenu de la page
//           Center(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // Zone pour ajouter des boutons, champs de texte, etc.
//                 DelayedAnimation(
//                   delay: 0,
//                   child: Container(
//                     height: 200,
//                     child: Container(
//                       margin: const EdgeInsets.symmetric(
//                         vertical: 40,
//                         horizontal: 30,
//                       ),
//                       child: Column(
//                         children: [
//                           Text(
//                             'CONNEXION',
//                             style: GoogleFonts.poppins(
//                               color: Colors.black,
//                               fontSize: 40,
//                               fontWeight: FontWeight.w600,
//                             ),
//                           ),
//                           SizedBox(height: 10),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),

//                 // InscriptionContent(),
//                 SizedBox(height: 100),
//                 DelayedAnimation(
//                   delay: 0,
//                   child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: dRed,
//                       //shape: StadiumBorder()
//                       padding: EdgeInsets.symmetric(
//                         vertical: 13,
//                         horizontal: 125,
//                       ),
//                     ),
//                     child: Text(
//                       'Se connecter',
//                       style: GoogleFonts.poppins(
//                         color: Colors.white,
//                       ),
//                     ),
//                     onPressed: () {},
//                   ),
//                 ),
//                 /*BOUTONS*/

//                 TextButton(
//                   onPressed: () {
//                     // Logique pour réinitialiser le mot de passe, par exemple
//                   },
//                   child: Text(
//                     'Se connecter via un réseau social',
//                     style: GoogleFonts.poppins(
//                       color: Colors.black,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//      /* floatingActionButton: FloatingActionButton.small(onPressed: () {
//         Navigator.pop(context);
//       }),*/
//     );
//   }}

// class ConnexionForm extends StatelessWidget {
//   // declation de variable pour rendre le mdp invisible
//   var _obscureText = true;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.symmetric(
//         horizontal: 30,
//       ),
//       child: Column(
//         children: [
//           /*nom*/
//           DelayedAnimation(
//             delay: 0,
//             child: TextField(
//               decoration: InputDecoration(
//                 labelText: 'Nom d\'utilisateur',
//                 labelStyle: TextStyle(
//                   color: Colors.grey,
//                 ),
//               ),
//             ),
//           ),
//           /*Email*/
//           DelayedAnimation(
//             delay: 0,
//             child: TextField(
//               decoration: InputDecoration(
//                 labelText: 'Email',
//                 labelStyle: TextStyle(
//                   color: Colors.grey,
//                 ),
//               ),
//             ),
//           ),
//           /*Téléphone*/
//           DelayedAnimation(
//             delay: 0,
//             child: TextField(
//               decoration: InputDecoration(
//                 labelText: 'Téléphone',
//                 labelStyle: TextStyle(
//                   color: Colors.grey,
//                 ),
//               ),
//             ),
//           ),

//           /*Mot de passe*/
//           DelayedAnimation(
//             delay: 0, child: Container(
//               width: MediaQuery.of(context).size.width * 0.8,
//             child: TextField(
//               obscureText: _obscureText,
//               decoration: InputDecoration(
//                 labelText: 'Mot de passe',
//                 labelStyle: TextStyle(
//                   color: Colors.grey,
//                 ),
//                 suffixIcon: IconButton(
//                   icon: Icon(
//                     Icons.visibility,
//                     color: Colors.black,
//                   ),
//                   onPressed: () {
//                     //methode pour rafraichir le widget lorsqu'on appui sur l'oiel
//                     setState(() {
//                       _obscureText = !_obscureText;
//                     });
//                   },
//                 ),
//               ),
//             ),),
            
//           ),
//         ],
//       ),
//     );
//   }

//   void setState(Null Function() param0) {}
// }