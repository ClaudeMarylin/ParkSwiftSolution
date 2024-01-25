import 'package:flutter/material.dart';

class ReservationTap extends StatelessWidget {
  const ReservationTap({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Text('Mes réservations'),
      ),
    ));
  }
}
