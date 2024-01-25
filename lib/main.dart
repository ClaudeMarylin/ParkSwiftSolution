// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:parkswift/welcome_page.dart';

// ignore: constant_identifier_names, unnecessary_const
const d_red = const Color(0XFF5188C5);
void main() {
  runApp(MyApp());
}

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
