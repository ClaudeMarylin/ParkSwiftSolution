import 'package:comparking/helper/helper_functions.dart';
import 'package:comparking/main.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:comparking/constants/colors.dart';
import 'package:comparking/widgets/CustomTextFormField.dart';
import 'package:comparking/screens/menuBar/search.dart';
import 'package:comparking/screens/menuBar/moreSetting.dart';
import 'package:comparking/screens/menuBar/reservation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:comparking/services/location/location_service.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

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
    SearchPage(),
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
      icon: Icon(IconlyBold.search),
      label: "Recherche",
    ),
    BottomNavigationBarItem(
      icon: Icon(IconlyBold.document),
      label: "Réservations",
    ),
    BottomNavigationBarItem(
      icon: Icon(IconlyBold.profile),
      label: "Plus",
    ),
  ];
}

class HomeTap extends StatefulWidget {
  const HomeTap({Key? key});

  // get context => null;

  @override
  _HomeTapState createState() => _HomeTapState();
}

class _HomeTapState extends State<HomeTap> {
  late GoogleMapController?
      _mapController; // Changer le type en GoogleMapController?
  late CameraPosition _initialCameraPosition =
      const CameraPosition(target: LatLng(0, 0), zoom: 12);
  Set<Marker> _ParkingMarkers = {};

  //String _query = '';

  //late Future<List<Json>?> _parkings;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
   // _parkings = fetchParkings();
  }

  /*Future<List<Json>?> searchParkings(String query) {
    return _parkings.then((value) => value!.where((parking) {
      return parking['nom'].toLowerCase().contains(query.toLowerCase());
    }).toList());
  }*/

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
                          prefixIcon: IconlyBroken.discovery,                          
                          filled: true,
                          enabled: true,
                          onChanged: (value) {                            
                          },                        
                        ),
                      ),
                      GestureDetector(
                        onTap:  () async {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SearchPage(),
                              ),
                            );
                        },
                        
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.search,
                            color: Colors.black,
                            size: 30,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Afficher les résultats de recherche
                /*FutureBuilder<List<Json>?>(
                  future: searchParkings(_query),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Erreur: ${snapshot.error}'));
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return Center(child: Text('Aucun parking trouvé'));
                    } else {
                      final parkings = snapshot.data!;
                      return ListView.builder(
                        itemCount: parkings.length,
                        itemBuilder: (context, index) {
                          final parking = parkings[index];
                          return ListTile(
                            title: Text(parking['nom'] ?? ''),
                            subtitle: parking['imageURL'] != null && parking['imageURL'].isNotEmpty
                                ? ExtendedImage.network(
                              parking['imageURL'],
                              width: 50, // Vous pouvez ajuster la taille de l'image ici
                              height: 100,
                              fit: BoxFit.cover,
                              cache: true,
                              loadStateChanged: (ExtendedImageState state) {
                                switch (state.extendedImageLoadState) {
                                  case LoadState.loading:
                                    return Center(child: CircularProgressIndicator());
                                  case LoadState.completed:
                                    return state.completedWidget;
                                  case LoadState.failed:
                                    return Center(child: Icon(Icons.error));
                                }
                              },
                            )
                                : Text('Aucune image de parking disponible'),
                          );
                        },
                      );
                    }
                  },
                ),*/
                // Autre contenu de la page ici
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Fonction pour récupérer les parkings depuis la base de données
/*Future<List<Json>?> fetchParkings() async {
  try {
    return await supabase
    .from('parking')
    .select('nom');
  } on PostgrestException catch (error, stackTrace) {
    logger.e(error.message, stackTrace: stackTrace);
    logger.e(error.details);
    return null;
  } catch (e, stackTrace) {
    logger.e("$e", stackTrace: stackTrace);
    return null;
  }
}*/
