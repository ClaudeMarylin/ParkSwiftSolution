import 'package:comparking/screens/authentif/HomePage.dart';
import 'package:comparking/screens/authentif/inscription.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:comparking/screens/user/profile.dart';
import 'package:comparking/screens/settings/notifications.dart';
import 'package:comparking/constants/colors.dart';



class MoreSetting extends StatelessWidget {
  MoreSetting({Key? key});
  bool _isDarkMode = false; // Ajoutez cette ligne pour définir _isDarkMode


  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const HomePage()));
          },
        ),
        backgroundColor: pBlue,
        title: Text(
          "Plus",
          style: GoogleFonts.nunito(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.w800,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              // Redirigera l'utilisateur vers la page lui permettant de voir la distance entre le parking choisi et sa destination sur la carte
            },
            icon: const Icon(
              Icons.more_horiz,
              color: Colors.white,
            ),
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
                const SizedBox(height: 20),
                ListTile(
                  leading: const Icon(Icons.person),
                  title: const Text('Claude Marylin'),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ProfileTap()));
                    // action qui nous dirige vers la page de gestion du projet
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.notifications_none),
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
                  leading: const Icon(Icons.payment_outlined),
                  title: Text('Paiements'),
                  onTap: () {
                    // action...
                  },
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.security),
                  title: Text('Securité'),
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(Icons.help_center_outlined),
                  title: Text('Aide'),
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(Icons.language),
                  title: Text('Langues'),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: const Text('Paramètres'),
                  onTap: () {},
                )
                // , mettre un théme noir ou clair
                // Text('Thème:',
                // style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                // ),
                // ListTile(
                //   title: Text('Clair'),
                //   onTap: () {
                //     setState(() {
                //   _isDarkMode = false;
                //   // Changer le thème en clair
                //   Theme.of(context).brightness = Brightness.light;
                //   });
                //   },
                //   trailing: _isDarkMode
                //   ? null
                //   : Icon(Icons.check, color: Theme.of(context).accentColor),
                // )
              ],
            ),
          )
        ],
      ),
    );
  }
}
  

// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:comparking/screens/user/profile.dart';
// import 'package:comparking/screens/settings/notifications.dart';
// import 'package:comparking/constants/colors.dart';

// class MoreSetting extends StatelessWidget {
//   const MoreSetting({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       // appBar: AppBar(
//       //   automaticallyImplyLeading: false,
//       //   title: const Text("Plus"),
//       //   actions: [
//       //     IconButton(
//       //       icon: const Icon(Icons.more_horiz),
//       //       onPressed: () {
//       //         // Action à exécuter lors de l'appui sur l'icône de points de suspension
//       //       },
//       //     ),
//       //   ],
//       // ),
//       leading: IconButton(
//         icon: Icon(
//           Icons.arrow_back,
//           color: Colors.white,
//         ),
//         onPressed: () {
          
//         },
//       ),
//       backgroundColor: pBlue,
//       title: Text(
//         "Reservations",
//         style: GoogleFonts.nunito(
//             color: Colors.white, fontSize: 22, fontWeight: FontWeight.w800),
//       ),
//       centerTitle: true,
//       actions: [
//         IconButton(
//             onPressed: () {
//               // Redirigera le user vers la page lui permettant de voir la distance entre le parking choisi et sa destination sur la carte
//             },
//             icon: Icon(
//               Icons.place,
//               color: Colors.white,
//             ))
//       ],

//       body: Row(
//         children: [
//           Container(
//             width: 200, //largeur du menu latéral

//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 SizedBox(height: 20),
//                 ListTile(
//                   leading: Icon(Icons.person),
//                   title: Text('Claude Marylin'),
//                   onTap: () {
//                     Navigator.push(context,
//                         MaterialPageRoute(builder: (context) => ProfileTap()));
//                     // action qui nous dirige vers la page de gestion du projet
//                   },
//                 ),
//                 ListTile(
//                   leading: Icon(Icons.notifications_none),
//                   title: Text('Notifications'),
//                   onTap: () {
//                     // action qui nous dirige sur la page des notifications
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => Notifications()));
//                   },
//                 ),
//                 ListTile(
//                   leading: Icon(Icons.payment_outlined),
//                   title: Text('Paiements'),
//                   onTap: () {
//                     // action...
//                   },
//                 ),
//                 Divider(),
//                 ListTile(
//                   leading: Icon(Icons.security),
//                   title: Text('Securité'),
//                   onTap: () {},
//                 ),
//                 ListTile(
//                   leading: Icon(Icons.help_center_outlined),
//                   title: Text('Aide'),
//                   onTap: () {},
//                 ),
//                 ListTile(
//                   leading: Icon(Icons.language),
//                   title: Text('Langues'),
//                   onTap: () {},
//                 ),
//                 ListTile(
//                   leading: Icon(Icons.settings),
//                   title: Text('Paramètres'),
//                   onTap: () {},
//                 )
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
