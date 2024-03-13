// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:parkswift/delaye_animation.dart';
import 'package:parkswift/main.dart';

class DetailParking extends StatelessWidget {
  const DetailParking({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text('Détails du parking'),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 50,
          ),
          child: Column(
            children: [
              DealyedAniamtion(
                delay: 1500,
                child: Container(
                  child: Image.asset('images/confus.jpg'),
                ),
              ),
              DealyedAniamtion(
                delay: 2500,
                child: Container(
                  margin: EdgeInsets.symmetric(
                    vertical: 14,
                    horizontal: 40,
                  ),
                  child: Column(children: [
                    Text('Parking indigo'),
                    Text('adresse'),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.bookmark,
                      ),
                    )
                  ]),
                ),
              ),
              DealyedAniamtion(
                delay: 3500,
                child: Container(
                  margin: EdgeInsets.symmetric(
                    vertical: 14,
                    horizontal: 40,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          ElevatedButton(onPressed: (){}, child: Text('Annuler')),
                          SizedBox(width: 10),
                          ElevatedButton(onPressed: (){}, child: Text('Reserver')),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              DealyedAniamtion(
                delay: 3500,
                child: Container(
                  margin: EdgeInsets.symmetric(
                    vertical: 14,
                    horizontal: 40,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          ElevatedButton(onPressed: (){}, child: Text('Annuler')),
                          SizedBox(width: 10),
                          ElevatedButton(onPressed: (){}, child: Text('Reserver')),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
