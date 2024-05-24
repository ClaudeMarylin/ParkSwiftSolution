import 'package:flutter/material.dart';
import 'package:comparking/widgets/CustomNotifications.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Aujourd'hui",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              CustomNotifications(),
            ],
          ),
        ),
      ),
    );
  }
}