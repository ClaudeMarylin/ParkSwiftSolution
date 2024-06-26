import 'package:comparking/screens/authentif/forgotwp.dart';
import 'package:comparking/widgets/DelayedAnimation.dart';
import 'package:comparking/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:comparking/screens/authentif/HomePage.dart';
import 'package:comparking/screens/authentif/inscription.dart';
import 'package:comparking/main.dart';
import 'package:supabase/supabase.dart';
import 'package:get/get.dart';
import 'package:comparking/Controllers/passwordController.dart';

class Connexion extends StatefulWidget {
  @override
  _ConnexionState createState() => _ConnexionState();
}

class _ConnexionState extends State<Connexion> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final PasswordVisibilityController passwordVisibilityController = Get.put(PasswordVisibilityController());

  // Méthode pour la connexion de l'utilisateur
  Future<void> signIn() async {
    try {
      await supabase.auth.signInWithPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      if (!mounted) return;

      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    } on AuthException catch (e) {
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
            /* icône de retour à la page */
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
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Zone pour ajouter des boutons, champs de texte, etc.
                    DelayedAnimation(
                      delay: 0,
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
                              suffixIcon: Icon(Icons.mail,
                                color: pBlue,)
                          ),
                        ),
                      ),
                    ),

                    DelayedAnimation(
                      delay: 0,
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Obx(() {
                          return TextField(
                            controller: passwordController,
                            obscureText: passwordVisibilityController.isObscure.value,
                            decoration: InputDecoration(
                              labelText: 'Mot de passe',
                              labelStyle: TextStyle(
                                color: Colors.grey,
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  passwordVisibilityController.isObscure.value
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: pBlue,
                                ),
                                onPressed: passwordVisibilityController.toggleVisibility,
                              ),
                            ),
                          );
                        }),
                      ),
                    ),

                    /* BOUTONS */

                    DelayedAnimation(
                      delay: 0,
                      child: Container(
                        margin: EdgeInsets.symmetric(
                          vertical: 20,
                          horizontal: 60,
                        ),
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: dRed,
                            shape: StadiumBorder(),
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

                    Padding(
                      padding: EdgeInsets.only(right: 30, bottom: 20),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ForgotPasswordPage()),
                            );
                          },
                          child: const Text(
                            'Mot de passe oublié ?',
                            style: TextStyle(
                              color: Colors.red,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
