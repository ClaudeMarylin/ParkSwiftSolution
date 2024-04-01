import 'package:flutter/material.dart';

class FavoriteTap extends StatelessWidget {
  const FavoriteTap({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Text('Mes favoris'),
      ),
    ));
  }
}