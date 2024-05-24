import 'dart:async';
import 'package:comparking/screens/authentif/WelcomePage.dart';
import 'package:flutter/material.dart';
 // Importez votre WelcomePage ici

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    _simulateLoading();
  }

  _simulateLoading() async {
    await Future.delayed(Duration(seconds: 2)); // Simule un chargement de 2 secondes
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => WelcomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(), // Affiche l'animation de progression
      ),
    );
  }
}
