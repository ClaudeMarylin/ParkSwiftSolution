import 'package:flutter/material.dart';
import 'package:comparking/constants/colors.dart';
import 'package:comparking/screens/authentif/connexion.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:supabase/supabase.dart';
import 'package:comparking/Controllers/passwordController.dart';

import '../../main.dart';
import '../../widgets/DelayedAnimation.dart';

class Inscription extends StatefulWidget {
  @override
  _InscriptionState createState() => _InscriptionState();
}

class _InscriptionState extends State<Inscription> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final PasswordVisibilityController passwordVisibilityController = Get.put(PasswordVisibilityController());

  // Inscription de l'utilisateur
  Future<void> signUp() async {
    try {
      await supabase.auth.signUp(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
          data: {
            'name': usernameController.text.trim(),
            'phone': phoneController.text.trim() // Ajout du numéro de téléphone
          }
      );
      if (!mounted) return;

      // Après l'inscription, vous pouvez rediriger l'utilisateur vers une autre page
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Connexion()));
    } on AuthException catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/image/back_insc.png',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
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
          Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
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
                  DelayedAnimation(
                    delay: 0,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: TextField(
                        controller: usernameController,
                        decoration: InputDecoration(
                          labelText: 'Nom d\'utilisateur',
                          labelStyle: TextStyle(
                            color: Colors.grey,
                          ),
                            suffixIcon: Icon(Icons.person,
                              color: pBlue,)
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
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
                  SizedBox(height: 20),
                  DelayedAnimation(
                    delay: 0,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: TextField(
                        controller: phoneController,
                        decoration: InputDecoration(
                          labelText: 'Téléphone',
                          labelStyle: TextStyle(
                            color: Colors.grey,
                          ),
                            suffixIcon: Icon(Icons.phone,
                              color: pBlue,)
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  DelayedAnimation(
                    delay: 0,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Obx(() {
                        return TextField(
                          obscureText: passwordVisibilityController.isObscure.value,
                          controller: passwordController,
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
                              onPressed: () {
                                passwordVisibilityController.toggleVisibility();
                              },
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                  SizedBox(height: 40),
                  DelayedAnimation(
                    delay: 0,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: dRed,
                        shape: StadiumBorder(),
                        padding: EdgeInsets.symmetric(
                          vertical: 13,
                          horizontal: 125,
                        ),
                      ),
                      child: Text(
                        'S\'inscrire',
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () => signUp(),
                    ),
                  ),
                  SizedBox(height: 20),
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
          ),
        ],
      ),
    );
  }
}


void setState(Null Function() param0) {}
