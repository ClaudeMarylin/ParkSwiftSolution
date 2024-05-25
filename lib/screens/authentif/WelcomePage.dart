import 'package:flutter/material.dart';
import 'package:comparking/constants/colors.dart';
import 'package:comparking/screens/authentif/connexion.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 170,
                child: Image.asset('assets/image/parkswift.png'),
              ),
              SizedBox(height: 30),
              Text(
                'Rapide. Facile. ParkSwift',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: dRed,
                  shape: StadiumBorder(),
                  padding: EdgeInsets.symmetric(vertical: 13, horizontal: 40),
                ),
                child: Text(
                  'Démarrer',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Connexion(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
