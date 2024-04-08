// ignore_for_file: dead_code


import 'package:flutter/material.dart';

// class ProfileTap extends StatelessWidget {
//   const ProfileTap({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(),
//     );
//   }
// }

class ProfileTap extends StatelessWidget {
  const ProfileTap({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        title: Text('Profil utilisateur'),
      ),
    );
    Column(
      children: [
        SizedBox(
          height: 115,
          width: 115,
          child: Stack(fit: StackFit.expand, children: [
            CircleAvatar(
              backgroundImage: AssetImage("images/profile.JPG"),
            ),
            Positioned(
              right: -12,
              bottom: 0,
              child: SizedBox(
                height: 46,
                width: 46,
                child: IconButton(
                  icon: Icon(
                    Icons.camera_alt_outlined,
                    color: Colors.black,
                    size: 30,
                  ),
                  onPressed: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => Notifications()));
                  },
                ),
              ),
            ),
          ]),
        ),
        SizedBox(height: 20),
        FloatingActionButton(
          onPressed: () {},
          child: Row(),
        ),
      ],
    );
  }
}
