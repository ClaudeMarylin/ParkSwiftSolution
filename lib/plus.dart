import 'package:flutter/material.dart';
import 'package:parkswift/Profile.dart';
import 'package:parkswift/notifs.dart';

class PlusTap extends StatelessWidget {
  const PlusTap({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Plus"),
        actions: [
          IconButton(
            icon: Icon(Icons.more_horiz),
            onPressed: () {
              // Action à exécuter lors de l'appui sur l'icône de points de suspension
            },
          ),
        ],
      ),
      body: Row(
        children: [
          Container(
            width: 200, //largeur du menu latéral

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                ListTile(
                  leading: Icon(Icons.person),
                  title: Text('Claude Marylin'),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ProfileTap()));
                    // action qui nous dirige vers la page de gestion du projet
                  },
                ),
                ListTile(
                  leading: Icon(Icons.notifications_none),
                  title: Text('Notifications'),
                  onTap: () {
                    // action qui nous dirige sur la page des notifications
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Notifications()));
                  },
                ),
                ListTile(
                  leading: Icon(Icons.payment_outlined),
                  title: Text('Paiements'),
                  onTap: () {
                    // action...
                  },
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.security),
                  title: Text('Securité'),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(Icons.help_center_outlined),
                  title: Text('Aide'),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(Icons.language),
                  title: Text('Langues'),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text('Paramètres'),
                  onTap: () {},
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
