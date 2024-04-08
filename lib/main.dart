import 'package:comparking/screens/authentif/WelcomePage.dart';
import 'package:flutter/material.dart';
import 'package:supabase/supabase.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() {
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
//initialisation de supabase
  final String supabaseUrl;
  final String supabaseKey;
  final SupabaseClient supabaseClient;

  MyApp({Key? key})
      : supabaseUrl = 'https://ussrntnvxurlkukwhiej.supabase.co',
        supabaseKey =
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InVzc3JudG52eHVybGt1a3doaWVqIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDg1MDU2MjQsImV4cCI6MjAyNDA4MTYyNH0.6k5Mhz5_aiFppamlP0X4A3v7DYDrKlrrMzGtu3RjYGM',
        supabaseClient = SupabaseClient(
            'supabaseUrl',
            'supabaseKey'),
        super(key: key);

// comment utiliser le client dans la manipulation des bases de données/

// final response = await client
//     .from('ma_table')
//     .select()
//     .execute();
// if (response.error != null) {
//   // Gérer l'erreur
// } else {
//   final data = response.data;
//   // Utiliser les données récupérées
// }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'ParkSwift',
        debugShowCheckedModeBanner: false,
        home: WelcomePage());
  }
}
