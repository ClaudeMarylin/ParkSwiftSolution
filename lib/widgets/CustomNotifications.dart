import 'package:flutter/material.dart';

class CustomNotifications extends StatefulWidget {
  const CustomNotifications({super.key});

  @override
  State<CustomNotifications> createState() => _CustomNotificationsState();
}

class _CustomNotificationsState extends State<CustomNotifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
      children: [
        CircleAvatar(
          radius: 25,
          backgroundImage: AssetImage(
            "images/connexion.png",
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Succès de la connexion",
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(color: Color.fromARGB(255, 85, 84, 84)),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              "New following ",
              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                    color: Color.fromARGB(255, 140, 200, 201),
                  ),
            )
          ],
        ),
      ],
    ),
    );
   
  }
}
