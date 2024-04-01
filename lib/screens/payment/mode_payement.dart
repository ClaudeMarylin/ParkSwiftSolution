// ignore_for_file: unused_import

import 'package:comparking/screens/my_booking/recapitulatif_reservation.dart';
import 'package:comparking/screens/payment/new_credit_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:comparking/main.dart';

import '../../constants/colors.dart';

class ModePayement extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            MoreModePayement(),
            //_RadioListTileExampleState(), // Appel de la classe _RadioListTileExampleState
          ],
        ),
      ),
    );
  }
}

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => new Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      backgroundColor: pBlue,
      title: Text(
        'Paiement',
        style: GoogleFonts.nunito(
          color: Colors.white,
          fontSize: 22,
          fontWeight: FontWeight.w800,
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(
            Icons.qr_code_scanner_rounded,
            color: Colors.white,
          ),
          onPressed: null,
        ),
      ],
      centerTitle: true,
    );
  }
}

class MoreModePayement extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(8, 20, 8, 20),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(left: 25),
            margin: EdgeInsets.only(bottom: 30, top: 15),
            //height: 50,
            //color: sBlue,
            child: Text(
              'Choisir le mode de paiement',
              textAlign: TextAlign.left,
              style: GoogleFonts.nunito(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                //color: pBlue,
              ),
            ),
          ),

          /*----------appel de la classe _RadioListTileExampleState ici -------------------*/
          Container(
            margin: EdgeInsets.only(bottom: 30),
            child: _RadioListTileExampleState(),
          ),
          /*-------------------------------*/
          const SizedBox(height: 15),
          Container(
            width: double.infinity,
            height: 50,
            color: sBlue,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => NewCard()));
                  },
                  child: Row(
                    children: [
                      const Icon(
                        Icons.add_box_outlined,
                        color: pBlue,
                      ),
                      Text(
                        'Ajouter une nouvelle carte',
                        textAlign: TextAlign.left,
                        style: GoogleFonts.nunito(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                          color: pBlue,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 200),
          Container(
            width: double.infinity,
            margin: EdgeInsets.all(8), // Marge autour du conteneur
            child: Align(
              alignment: Alignment.bottomCenter, // Alignement en bas de la page
              child: ElevatedButton(
                onPressed: () {
                  // Logique à exécuter lorsque le bouton est pressé
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RecapitulatifReservation(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: pBlue,
                  minimumSize: const Size(350, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Continuer',
                  style: TextStyle(color: sBlue),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

enum SingingCharacter { Paypal, GooglePay, ApplePay }

class _RadioListTileExampleState extends StatefulWidget {
  @override
  __RadioListTileExampleState createState() => __RadioListTileExampleState();
}

class __RadioListTileExampleState extends State<_RadioListTileExampleState> {
  SingingCharacter? _character = SingingCharacter.Paypal;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          width: 250,
          height: 80,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(color: pBlue),
            borderRadius: BorderRadius.circular(10),
            color: Colors.transparent,
          ),
          child: RadioListTile<SingingCharacter>(
            title: Row(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.access_time_rounded, color: pBlue),
                SizedBox(width: 4),
                const Text('Paypal'),
              ],
            ),
            controlAffinity: ListTileControlAffinity
                .trailing, //affiche sur le côté opposé de la vignette au bouton radio.
            value: SingingCharacter.Paypal,
            groupValue: _character,
            onChanged: (SingingCharacter? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
        SizedBox(height: 10),
        Container(
          width: 250,
          height: 80,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(color: pBlue),
            borderRadius: BorderRadius.circular(10),
            color: Colors.transparent,
          ),
          child: RadioListTile<SingingCharacter>(
            title: Row(
              children: [
                Icon(Icons.access_time_rounded, color: pBlue),
                SizedBox(width: 4),
                const Text('Google Pay'),
              ],
            ),
            controlAffinity: ListTileControlAffinity
                .trailing, //affiche sur le côté opposé de la vignette au bouton radio.
            value: SingingCharacter.GooglePay,
            groupValue: _character,
            onChanged: (SingingCharacter? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
        SizedBox(height: 10),
        Container(
          width: 250,
          height: 80,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(color: pBlue),
            borderRadius: BorderRadius.circular(10),
            color: Colors.transparent,
          ),
          child: RadioListTile<SingingCharacter>(
            title: Row(
              children: [
                Icon(Icons.access_time_rounded, color: pBlue),
                SizedBox(width: 4),
                const Text('Apple Pay'),
              ],
            ),
            controlAffinity: ListTileControlAffinity
                .trailing, //affiche sur le côté opposé de la vignette au bouton radio.
            value: SingingCharacter.ApplePay,
            groupValue: _character,
            onChanged: (SingingCharacter? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
      ],
    );
  }
}

/*class ModePayement extends StatefulWidget {
  @override
  _MoreModePayementState createState() => _MoreModePayementState();
}

class _MoreModePayementState extends State<ModePayement> {
  String? selectedPaymentMethod = 'Paypal'; // Mode de paiement sélectionné par défaut

  void setSelectedPaymentMethod(String value) {
    // Met à jour le mode de paiement sélectionné lorsque l'utilisateur choisit un nouveau mode
    setState(() {
      selectedPaymentMethod = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(8, 20, 8, 20),
      child: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 10),
                  child: Image.asset('images/images_parking.jpeg'),
                ),
                Container(
                  margin: EdgeInsets.only(right: 10),
                  child: Image.asset('images/images_parking.jpeg'),
                ),
                Container(
                  margin: EdgeInsets.only(right: 10),
                  child: Image.asset('images/images_parking.jpeg'),
                ),
                // Ajoutez autant d'images que vous le souhaitez ici
              ],
            ),
          ),
          const SizedBox(height: 15),
          Container(
            width: double.infinity,
            color: sBlue,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Nom Parking',
                              textAlign: TextAlign.left,
                              style: GoogleFonts.nunito(
                                fontSize: 22,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              'Adresse Parking',
                              textAlign: TextAlign.left,
                              style: GoogleFonts.nunito(
                                fontSize: 18,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      child: ElevatedButton(
                        onPressed: () {
                          // Logique à exécuter lorsque le bouton "bookmark" est pressé
                        },
                        child: Icon(
                          Icons.bookmark,
                          color: pBlue,
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          const SizedBox(height: 15),
          Column(
            children: [
              RadioListTile<String>(
                value: 'Paypal',
                groupValue: selectedPaymentMethod,
                onChanged: (value) {
                  setSelectedPaymentMethod(value!);
                },
                title: Text('Paypal'),
                subtitle: Text('Payer avec Paypal'),
                secondary: Icon(Icons.payment),
                activeColor: pBlue,
              ),
              RadioListTile<String>(
                value: 'Google Pay',
                groupValue: selectedPaymentMethod,
                onChanged: (value) {
                  setSelectedPaymentMethod(value!);
                },
                title: Text('Google Pay'),
                subtitle: Text('Payer avec Google Pay'),
                secondary: Icon(Icons.payment),
                activeColor: pBlue,
              ),
              RadioListTile<String>(
                value: 'Apple Pay',
                groupValue: selectedPaymentMethod,
                onChanged: (value) {
                  setSelectedPaymentMethod(value!);
                },
                title: Text('Apple Pay'),
                subtitle: Text('Payer avec Apple Pay'),
                secondary: Icon(Icons.payment),
                activeColor: pBlue,
              ),
            ],
          ),
          const SizedBox(height: 15),
          Container(
            width: double.infinity,
            height: 50,
            color: sBlue,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.add_box_outlined, color: pBlue),
                const SizedBox(width: 30),
                Text(
                  'Ajouter une carte',
                  textAlign: TextAlign.left,
                  style: GoogleFonts.nunito(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                    color: pBlue,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          Container(
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Logique à exécuter lorsque le bouton "Continuer" est pressé
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: pBlue,
                    minimumSize: const Size(350, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'Continuer',
                    style: TextStyle(color: sBlue),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
*/

/*class ModePayement extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: MyAppBar(),
        body: SingleChildScrollView(
          child :Column(
          children: [                     
            MoreModePayement()  
          ],)
        )
        ) ;
    }
}


class MyAppBar extends StatelessWidget implements PreferredSizeWidget{
  Size  get preferredSize => new Size.fromHeight(50) ;
  @override
  Widget build(BuildContext context){
    return  AppBar(
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
        onPressed: null,
        ),
      backgroundColor: pBlue,
      title: Text(
        'Paiement',
        style: GoogleFonts.nunito(
          color: Colors.white,
          fontSize:22,
          fontWeight: FontWeight.w800,          
        ),
        ),
        actions: [IconButton(
        icon: Icon(
          Icons.qr_code_scanner_rounded,
          color: Colors.white,
        ),
        onPressed: null,
        ),],
        centerTitle: true,
    );
  }
}

enum SingingCharacter { Paypal, GooglePay, ApplePay }

class _RadioListTileExampleState extends State<RadioListTileExample> {
  SingingCharacter? _character = SingingCharacter.Paypal;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        RadioListTile<SingingCharacter>(
          title: const Text('Paypal'),
          value: SingingCharacter.Paypal,
          groupValue: _character,
          onChanged: (SingingCharacter? value) {
            setState(() {
              _character = value;
            });
          },
        ),
        RadioListTile<SingingCharacter>(
          title: const Text('Google Pay'),
          value: SingingCharacter.GooglePay,
          groupValue: _character,
          onChanged: (SingingCharacter? value) {
            setState(() {
              _character = value;
            });
          },
        ),
        RadioListTile<SingingCharacter>(
          title: const Text('Apple Pay'),
          value: SingingCharacter.ApplePay,
          groupValue: _character,
          onChanged: (SingingCharacter? value) {
            setState(() {
              _character = value;
            });
          },
        ),
      ],
    );
  }
}


class MoreModePayement extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Container(
              color: Colors.white,
              padding: EdgeInsets.fromLTRB(8, 20, 8, 20),
              child: Column(
                children: [
                  
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 10),
                          child: Image.asset('images/images_parking.jpeg'),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 10),
                          child: Image.asset('images/images_parking.jpeg'),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 10),
                          child: Image.asset('images/images_parking.jpeg'),
                        ),
                        // Ajoutez autant d'images que vous le souhaitez ici
                      ],
                    ),
                  ),
                  
                  
                  const SizedBox(height: 15),

                  Container(
                    width: double.infinity,
                    color: sBlue,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                          Row(
                            children: [
                              Expanded(
                                child: Container(                                  
                                  //color: pBlue,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                        Text(
                                          'Nom Parking',
                                          textAlign: TextAlign.left,
                                          style: GoogleFonts.nunito(
                                          fontSize:22,
                                          fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                        const SizedBox(height: 5),
                                        Text(
                                          'Adresse Parking',
                                          textAlign: TextAlign.left,
                                          style: GoogleFonts.nunito(
                                          fontSize:18,
                                          fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      ]
                                    ),
                                  )),
                              Container(
                                //height: 50,
                                //width: 50,
                                //color: sBlue,
                                child: ElevatedButton(
                                  onPressed: () {
                                  // Logique à exécuter lorsque le bouton "bookmark" est pressé
                                  }, 
                                  
                                  child: Icon(
                                    Icons.bookmark,
                                    color: pBlue,
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.transparent,
                                      elevation: 0,)
                                  ),
                                )
                            ],
                          )
                        ]
                      )
                  ),                  
                  const SizedBox(height: 15),
                  /*----------appel de la classe _RadioListTileExampleState ici -------------------*/





                  /*-------------------------------*/
                  const SizedBox(height: 15),
                  Container(
                    width: double.infinity,
                    height: 50,
                    color: sBlue,                    
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add_box_outlined, color: pBlue),
                        const SizedBox(width: 30),
                        Text(
                          'Ajouter une carte',
                          textAlign: TextAlign.left,
                          style: GoogleFonts.nunito(
                            fontSize:18,
                            fontWeight: FontWeight.normal,
                            color : pBlue,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    width: double.infinity,
                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton
                        (onPressed: () {
                          // Logique à exécuter lorsque le bouton "Annuler" est pressé
                      }, 
                        style: ElevatedButton.styleFrom(
                          backgroundColor: pBlue,
                          minimumSize: const Size(350, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          'Continuer',
                          style: TextStyle(color: sBlue),),                        
                        ),
                      ],
                    ),
                  )

                  
                  
                ],
              ),
            );
  }
}
*/

/*String selectedPaymentMethod = 'Paypal'; // Mode de paiement sélectionné par défaut

void setSelectedPaymentMethod(String value) {
  // Met à jour le mode de paiement sélectionné lorsque l'utilisateur choisit un nouveau mode
  selectedPaymentMethod = value;
}

Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    RadioListTile<String>(
      value: 'Paypal',
      groupValue: selectedPaymentMethod,
      onChanged: (value) {
        setSelectedPaymentMethod(value);
      },
      title: Text('Paypal'),
      subtitle: Text('Payer avec Paypal'),
      secondary: Icon(Icons.payment),
      activeColor: pBlue,
    ),
    RadioListTile<String>(
      value: 'Google Pay',
      groupValue: selectedPaymentMethod,
      onChanged: (value) {
        setSelectedPaymentMethod(value);
      },
      title: Text('Google Pay'),
      subtitle: Text('Payer avec Google Pay'),
      secondary: Icon(Icons.payment),
      activeColor: pBlue,
    ),
    RadioListTile<String>(
      value: 'Apple Pay',
      groupValue: selectedPaymentMethod,
      onChanged: (value) {
        setSelectedPaymentMethod(value);
      },
      title: Text('Apple Pay'),
      subtitle: Text('Payer avec Apple Pay'),
      secondary: Icon(Icons.payment),
      activeColor: pBlue,
    ),
  ],
),*/
