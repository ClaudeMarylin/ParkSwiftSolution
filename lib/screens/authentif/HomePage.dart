import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:comparking/constants/colors.dart';
import 'package:comparking/widgets/CustomTextFormField.dart';
import 'package:comparking/screens/menuBar/favorite.dart';
import 'package:comparking/screens/menuBar/moreSetting.dart';
import 'package:comparking/screens/menuBar/reservation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:comparking/services/location/location_service.dart';
import 'package:permission_handler/permission_handler.dart';

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

// class DialogUtils {
//   static void showLocationPermissionDeniedDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text("Accès à la localisation refusé"),
//           content: Text("Pour utiliser cette application, veuillez activer l'accès à la localisation dans les paramètres de votre téléphone."),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: Text("Fermer"),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }

class HomeTap extends StatefulWidget {
  const HomeTap({Key? key});

  // get context => null;

  @override
//   void initState() {

//     requestLocationPermission();
//   }

//   Future<void> requestLocationPermission() async {
//   final PermissionStatus status = await Permission.location.request();
//   if (status == PermissionStatus.denied) {
//   DialogUtils.showLocationPermissionDeniedDialog(context as BuildContext);

//   }
// }

  _HomeTapState createState() => _HomeTapState();
}

class _HomeTapState extends State<HomeTap> {
  late GoogleMapController?
      _mapController; // Changer le type en GoogleMapController?
  late CameraPosition _initialCameraPosition =
      const CameraPosition(target: LatLng(0, 0), zoom: 12);
 

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
   
  }

  Future<void> _getCurrentLocation() async {
    Position? currentPosition = await LocationService.getCurrentLocation();

    if (currentPosition != null) {
      // print(LatLng(currentPosition.latitude, currentPosition.longitude));
      setState(() {
        _initialCameraPosition = CameraPosition(
          target: LatLng(currentPosition.latitude, currentPosition.longitude),
          zoom: 12,
        );
      });
      _moveCameraToCurrentPosition(
          currentPosition.latitude, currentPosition.longitude);
    }
  }

  void _moveCameraToCurrentPosition(double latitude, double longitude) {
    _mapController?.moveCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(latitude, longitude),
          zoom: 12,
        ),
      ),
    );
  }

  

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            GoogleMap(
              initialCameraPosition: _initialCameraPosition,
              mapType: MapType.normal,
              onMapCreated: (GoogleMapController controller) {
                // if (mounted) {
                //   setState(() {

                //   });
                // }
                _mapController = controller;
              },
              markers: _initialCameraPosition.target != LatLng(0, 0)
                  ? {
                      Marker(
                        markerId: MarkerId("currentLocation"),
                        position: _initialCameraPosition.target,
                        icon: BitmapDescriptor.defaultMarkerWithHue(
                            BitmapDescriptor.hueRed),
                      )
                    }
                  : {},
            ),
            Column(
              children: [
                // Barre de recherche
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
          ],
        ),
      ),
    );
  }
}

// class _HomeTapState extends State<HomeTap> {
//   late GoogleMapController _mapController;
//   CameraPosition _initialCameraPosition = const CameraPosition(
//     target:
//         LatLng(0, 0), // Coordonnées initiales de la carte (latitude, longitude)
//     zoom: 12, // Zoom initial de la carte
//   );

//   @override
//   void initState() {
//     super.initState();
//     _getCurrentLocation();
//   }

//   Future<void> _getCurrentLocation() async {
//     Position? currentPosition = await LocationService.getCurrentLocation();
//     if (currentPosition != null) {
//       setState(() {
//         _initialCameraPosition = CameraPosition(
//           target: LatLng(currentPosition.latitude, currentPosition.longitude),
//           zoom: 12,
//         );
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//           body: Stack(
//         children: [
//           GoogleMap(
//             initialCameraPosition: _initialCameraPosition,
//             mapType: MapType.normal,
//             onMapCreated: (GoogleMapController controller) {
//               setState(() {
//                 _mapController = controller;
//               });
//             },
//           ),
// // GoogleMap(
// //   initialCameraPosition: const CameraPosition(
// //     target: LatLng(0, 0), // Coordonnées initiales de la carte (latitude, longitude)
// //     zoom: 12, // Zoom initial de la carte
// //   ),
// //   mapType: MapType.normal, // Type de carte (normal, satellite, terrain, etc.)
// //   onMapCreated: (GoogleMapController controller) {
// //     // Fonction appelée lorsque la carte est créée
// //     // Vous pouvez utiliser le contrôleur de carte pour effectuer des opérations sur la carte
// //   },
// // ),

//           Column(
//             children: [
//               // Barre de recherche
//               Padding(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//                 child: Row(
//                   children: [
//                     Expanded(
//                       child: CustomTextFormField(
//                         hint: "Rechercher",
//                         prefixIcon: IconlyBroken.search,
//                         filled: true,
//                         enabled: true,
//                       ),
//                     ),
//                     GestureDetector(
//                       onTap: () {
//                         // Action à effectuer lors de l'appui sur l'icône de notification
//                       },
//                       child: const Padding(
//                         padding: EdgeInsets.all(8.0),
//                         child: Icon(
//                           Icons.notifications,
//                           color: Colors.black,
//                           size: 30,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               // Autre contenu de la page ici
//             ],
//           ),
//         ],
//       )),
//     );
//   }
// }
