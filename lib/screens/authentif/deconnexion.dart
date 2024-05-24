import 'package:comparking/screens/authentif/connexion.dart';
import 'package:comparking/widgets/DelayedAnimation.dart';
import 'package:comparking/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:comparking/screens/authentif/HomePage.dart';
import 'package:comparking/screens/authentif/inscription.dart';
import 'package:comparking/main.dart';
import 'package:supabase/supabase.dart';

class deconnexion extends StatefulWidget {
  @override
  _deconnexionState createState() => _deconnexionState();
}

class _deconnexionState extends State<deconnexion> {

  Future<void> signOut() async {
    await supabase.auth.signOut();
    if (!mounted) return;
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Connexion()));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }



}
