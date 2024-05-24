import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../constants/colors.dart';
import '../../helper/helper_functions.dart';
import '../../main.dart';
import '../../models/parking_data.dart';

class SearchTap extends StatefulWidget {
  const SearchTap({Key? key}) : super(key: key);

  @override
  State<SearchTap> createState() => _SearchTapState();
}

class _SearchTapState extends State<SearchTap> {
  List<ParkingModel> mainParkingsList = [];

  void updateList(String value) {

  }
  @override
  void initState() {
    super.initState();
    fetchParkingsData();
  }

  Future<void> fetchParkingsData() async {
    final parkingsData = await fetchParkings();
    if (parkingsData != null) {
      setState(() {
        mainParkingsList = parkingsData.map((json) => ParkingModel.fromJson(json)).toList();
      });
    } else {
      // Gérer l'erreur ou afficher un message à l'utilisateur
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Rechercher un parking",
              style: TextStyle(
                color: Colors.black87,
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            TextField(
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                filled: true,
                fillColor: searchBlue,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
                hintText: "The park one",
                prefixIcon: const Icon(Icons.search),
                prefixIconColor: Colors.grey.shade900,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: mainParkingsList.length,
                itemBuilder: (context, index) => ListTile(
                  title: Text(mainParkingsList[index].nom),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}


Future<List<Json>?> fetchParkings() async {
  try {
    return await supabase.from('parking').select('nom,adresse, places_disponibles, imageURL');
  } on PostgrestException catch (error, stackTrace) {
    logger.e(error.message, stackTrace: stackTrace);
    logger.e(error.details);
    return null;
  } catch (e, stackTrace) {
    logger.e("$e", stackTrace: stackTrace);
    return null;
  }
}