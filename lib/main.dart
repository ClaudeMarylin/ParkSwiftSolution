import 'package:comparking/screens/authentif/HomePage.dart';
import 'package:comparking/screens/authentif/WelcomePage.dart';
import 'package:comparking/screens/authentif/loadingScreen.dart';
import 'package:flutter/material.dart';
import 'package:supabase/supabase.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://ussrntnvxurlkukwhiej.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InVzc3JudG52eHVybGt1a3doaWVqIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDg1MDU2MjQsImV4cCI6MjAyNDA4MTYyNH0.6k5Mhz5_aiFppamlP0X4A3v7DYDrKlrrMzGtu3RjYGM',
  );
  runApp( MyApp());
}
final supabase = Supabase.instance.client;

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'ParkSwift',
        debugShowCheckedModeBanner: false,
        home: LoadingScreen());
  }
}
