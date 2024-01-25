import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:parkswift/Home.dart';
import 'package:parkswift/Profile.dart';
import 'package:parkswift/favorite.dart';
import 'package:parkswift/main.dart';
import 'package:parkswift/reservation.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currenIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      /*bouton de navigation*/
      bottomNavigationBar: bottomNavigationBar(),

      body: taps[_currenIndex],
    ));
  }

  List<Widget> taps = [
    HomeTap(),
    ProfileTap(),
    ReservationTap(),
    FavoriteTap(),
    
  ];

  bottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: _currenIndex,
      fixedColor: d_red,
      backgroundColor: Colors.white,
      elevation: 0,
      onTap: (int index) {
        if (index == 0) {
          setState(() {
            _currenIndex = index;
          });
        } else if (index == 1) {
          setState(() {
            _currenIndex = index;
          });
        } else if (index == 2) {
          setState(() {
            _currenIndex = index;
          });
        } else if (index == 3) {
          setState(() {
            _currenIndex = index;
          });
        }
      },
      unselectedItemColor: const Color.fromARGB(255, 128, 127, 127),
      items: items,
      type: BottomNavigationBarType.fixed,
    );
  }

  // liste des boutons de la barre de navigation
  List<BottomNavigationBarItem> items = const [
    BottomNavigationBarItem(
      icon: Icon(IconlyBold.home),
      label: "Accueil",
    ),
    BottomNavigationBarItem(
      icon: Icon(IconlyBold.heart),
      label: "Favoris",
    ),
    BottomNavigationBarItem(
      icon: Icon(IconlyBold.document),
      label: "Réservations",
    ),
    BottomNavigationBarItem(
      icon: Icon(IconlyBold.profile),
      label: "profile",
    ),
  ];
}
