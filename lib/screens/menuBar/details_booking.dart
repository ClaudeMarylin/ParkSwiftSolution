import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supabase/supabase.dart';
import 'package:comparking/constants/colors.dart';
import 'package:comparking/screens/other/car_choice.dart';

class DetailParking extends StatefulWidget {
  @override
  _DetailParkingState createState() => _DetailParkingState();
}

class _DetailParkingState extends State<DetailParking> {
  final supabase = SupabaseClient('https://ussrntnvxurlkukwhiej.supabase.co', 'SUPABASE_CLIENT_API_KEY');

  Map<String, dynamic>? parkingDetails;

  @override
  void initState() {
    super.initState();
    fetchParkingDetails();
  }

  Future<void> fetchParkingDetails() async {
    try {
       final response = await supabase.from('parking').select();
      setState(() {
        parkingDetails = parkingDetails   ;
      });
      
    } catch (e) {
      
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: SingleChildScrollView(
        child: parkingDetails != null
            ? MoreDetailParking(parkingDetails: parkingDetails!)
            : Center(child: CircularProgressIndicator()),
      ),
    );
  }
}

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  Size get preferredSize => new Size.fromHeight(50);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      backgroundColor: pBlue,
      title: Text(
        "Détails du parking",
        style: GoogleFonts.nunito(
          color: Colors.white,
          fontSize: 22,
          fontWeight: FontWeight.w800,
        ),
      ),
      centerTitle: true,
    );
  }
}

class MoreDetailParking extends StatelessWidget {
  final Map<String, dynamic> parkingDetails;

  const MoreDetailParking({required this.parkingDetails});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(8, 20, 8, 20),
      child: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 10),
                  child: Image.asset('assets/image/images_parking.jpeg'),
                ),
                Container(
                  margin: EdgeInsets.only(right: 10),
                  child: Image.asset('assets/image/images_parking.jpeg'),
                ),
                Container(
                  margin: EdgeInsets.only(right: 10),
                  child: Image.asset('assets/image/images_parking.jpeg'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          Container(
            width: double.infinity,
            color: sBlue,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              parkingDetails['nom_parking'],
                              textAlign: TextAlign.left,
                              style: GoogleFonts.nunito(
                                fontSize: 22,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              parkingDetails['adresse'],
                              textAlign: TextAlign.left,
                              style: GoogleFonts.nunito(
                                fontSize: 18,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      child: ElevatedButton(
                        onPressed: () {
                          // Logique à exécuter lorsque le bouton "bookmark" est pressé
                        },
                        child: Icon(
                          Icons.bookmark,
                          color: pBlue,
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 30,
                width: 100,
                margin: EdgeInsets.only(right: 8),
                decoration: BoxDecoration(
                  border: Border.all(color: pBlue, width: 1),
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.transparent,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.place, color: pBlue),
                    SizedBox(width: 4),
                    Text('distance', style: TextStyle(color: pBlue)),
                  ],
                ),
              ),
              Container(
                height: 30,
                width: 100,
                margin: EdgeInsets.only(right: 8),
                decoration: BoxDecoration(
                  border: Border.all(color: pBlue, width: 1),
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.transparent,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.access_time_rounded, color: pBlue),
                    SizedBox(width: 4),
                    Text('time', style: TextStyle(color: pBlue)),
                  ],
                ),
              ),
              Container(
                height: 30,
                width: 100,
                decoration: BoxDecoration(
                  border: Border.all(color: pBlue, width: 1),
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.transparent,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: 4),
                    Text('Valet', style: TextStyle(color: pBlue)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Container(
            width: double.infinity,
            color: sBlue,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Description',
                  textAlign: TextAlign.left,
                  style: GoogleFonts.nunito(
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  parkingDetails['description'],
                  textAlign: TextAlign.left,
                  style: GoogleFonts.nunito(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          Container(
            width: 300,
            color: sBlue,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'tarif',
                  style: GoogleFonts.nunito(
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                    color: pBlue,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  '/Heure',
                  style: GoogleFonts.nunito(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          Container(
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Logique à exécuter lorsque le bouton "Annuler" est pressé
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: sBlue,
                    minimumSize: Size(150, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'Annuler',
                    style: TextStyle(color: pBlue),
                  ),
                ),
                const SizedBox(width: 15),
                ElevatedButton(
                  onPressed: () {
                    // Logique à exécuter lorsque le bouton "Réserver" est pressé
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CarChoice(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: pBlue,
                    minimumSize: Size(150, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'Réserver',
                    style: TextStyle(color: sBlue),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
