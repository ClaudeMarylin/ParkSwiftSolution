import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:comparking/constants/colors.dart';
import 'package:comparking/widgets/CustomTextFormField.dart';
import 'package:comparking/screens/menuBar/favorite.dart';
import 'package:comparking/screens/menuBar/moreSetting.dart';
import 'package:comparking/screens/menuBar/reservation.dart';

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
      body: taps[_currenIndex],
      bottomNavigationBar: bottomNavigationBar(),
    ));
  }

  List<Widget> taps = [
    HomeTap(),
    FavoriteTap(),
    ReservationTap(),
    MoreSetting(),
  ];

  bottomNavigationBar() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Divider(
          height: 1, // Hauteur de la barre de séparation
          thickness: 1, // Épaisseur de la barre de séparation
          color: Colors.grey, // Couleur de la barre de séparation
        ),
        BottomNavigationBar(
          currentIndex: _currenIndex,
          fixedColor: dRed,
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
        )
      ],
    );
  }

  // liste des boutons de la barre de navigation
  List<BottomNavigationBarItem> items = const [
    BottomNavigationBarItem(
      icon: Icon(IconlyBold.home),
      label: "Accueil",
    ),
    BottomNavigationBarItem(
      icon: Icon(IconlyBold.bookmark),
      label: "Favoris",
    ),
    BottomNavigationBarItem(
      icon: Icon(IconlyBold.document),
      label: "Réservations",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.menu),
      label: "Plus",
    ),
  ];
}

class HomeTap extends StatelessWidget {
  const HomeTap({Key? key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            // Barre de recherche
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  Expanded(
                    child: CustomTextFormField(
                      hint: "Rechercher",
                      prefixIcon: IconlyBroken.search,
                      filled: true,
                      enabled: true,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Action à effectuer lors de l'appui sur l'icône de notification
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.notifications,
                        color: Colors.black,
                        size: 30,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Autre contenu de la page ici
          ],
        ),
      ),
    );
  }
}

