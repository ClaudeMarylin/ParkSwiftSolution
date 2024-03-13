// ignore_for_file: unused_import
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter/material.dart';
import 'package:parkswift/welcome_page.dart';

// ignore: constant_identifier_names, unnecessary_const
const d_red = const Color(0XFF5188C5);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'ParkSwift',
        debugShowCheckedModeBanner: false,
        home: WelcomePage());
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: "https://ussrntnvxurlkukwhiej.supabase.co",
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InVzc3JudG52eHVybGt1a3doaWVqIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDg1MDU2MjQsImV4cCI6MjAyNDA4MTYyNH0.6k5Mhz5_aiFppamlP0X4A3v7DYDrKlrrMzGtu3RjYGM',
  );

  runApp(MyApp());
}

