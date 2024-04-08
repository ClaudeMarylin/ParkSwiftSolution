import 'package:comparking/screens/payment/mode_payement.dart';
import 'package:comparking/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';
// ignore: unused_import
import 'package:comparking/main.dart';
import 'package:intl/date_symbol_data_local.dart'; // Importez cette ligne pour initialiser les données de localisation

DateTime toDay = DateTime.now();
final kFirstDay = DateTime(
    toDay.year, toDay.month - 0, toDay.day); // First day of the current month
final kLastDay = DateTime(
    toDay.year, toDay.month + 3, toDay.day); // Two months in the future

class DateReservation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(),
        body: SingleChildScrollView(
            child: Column(
          children: [
            ChoiseDate(),
            SizedBox(
              height: 20,
            ),
            TimePicker(),
            Prix()
          ],
        )));
  }
}

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
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
        'Détail de la réservation',
        style: GoogleFonts.nunito(
          color: Colors.white,
          fontSize: 22,
          fontWeight: FontWeight.w800,
        ),
      ),
      centerTitle: true,
    );
  }
}

class ChoiseDate extends StatefulWidget {
  @override
  State<ChoiseDate> createState() => _ChoiseDate();
}

class _ChoiseDate extends State<ChoiseDate> {
  //DateTime kNow = DateTime.now();
  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      toDay = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Initialise les données de localisation pour la locale "fr_FR"
    initializeDateFormatting("fr_FR");
    return Column(
      children: [
        Text("Date selectionner : ${toDay.toString().split(" ")[0]}"),
        Container(
          child: TableCalendar(
            locale: "fr_FR",
            rowHeight: 40,
            headerStyle:
                HeaderStyle(formatButtonVisible: false, titleCentered: true),
            availableGestures: AvailableGestures.all,
            selectedDayPredicate: (day) => isSameDay(day, toDay),
            focusedDay: toDay,
            firstDay: kFirstDay,
            lastDay: kLastDay,
            onDaySelected: _onDaySelected,
          ),
        )
      ],
    );
  }
}

/*-------------------------------*/

class TimePicker extends StatefulWidget {
  //const TimePicker({
  //  Key? key}) : super(key: key);

  @override
  State<TimePicker> createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {
  final _timeController = TextEditingController();
  TimeOfDay startTime = TimeOfDay.now();
  TimeOfDay endTime = TimeOfDay.now();
  String dynamicStartTime = '7:00';
  String dynamicEndTime = '21:00';

  Future selectedTime(BuildContext context, bool ifPickedTime,
      TimeOfDay initialTime, Function(TimeOfDay) onTimePicked) async {
    var pickedTime =
        await showTimePicker(context: context, initialTime: initialTime);
    if (pickedTime != null) {
      onTimePicked(pickedTime);
    }
  }

  Future displayStartTimePicker(BuildContext context) async {
    var time = await showTimePicker(context: context, initialTime: startTime);

    if (time != null) {
      setState(() {
        _timeController.text = "${time.hour}:${time.minute}";
        dynamicStartTime = _timeController.text;
      });
    }
  }

  Future displayEndTimePicker(BuildContext context) async {
    var time = await showTimePicker(context: context, initialTime: endTime);

    if (time != null) {
      setState(() {
        _timeController.text = "${time.hour}:${time.minute}";
        dynamicEndTime = _timeController.text;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(28.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                width: 44,
                child: Text(
                  "Début",
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: GestureDetector(
                  child: Row(
                    children: [
                      Text(
                        //currentTime.format(context),
                        dynamicStartTime,
                      ),
                      SizedBox(width: 10),
                      Icon(Icons.access_time, color: pBlue),
                    ],
                  ),
                  onTap: () {
                    displayStartTimePicker(context);
                  },
                ),
              ),
              SizedBox(
                  width: 30,
                  child:
                      const Icon(Icons.arrow_right_alt_rounded, color: pBlue)),
              const SizedBox(
                width: 30,
                child: Text(
                  "Fin",
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: GestureDetector(
                  child: Row(
                    children: [
                      Text(
                        //currentTime.format(context),
                        dynamicEndTime,
                      ),
                      SizedBox(width: 9),
                      Icon(Icons.access_time, color: pBlue),
                    ],
                  ),
                  onTap: () {
                    displayEndTimePicker(context);
                  },
                ),
              ),
            ],
          ),
          /*const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              /*SizedBox(
                width: 80,
                child: Text(
                  dynamicEndTime,
                ),
              ),*/
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: GestureDetector(
                  child: Text(
                      //currentTime.format(context),
                      dynamicEndTime),
                  onTap: () {
                    displayEndTimePicker(context);
                  },
                ),
              ),
            ],
          ),*/
        ],
      ),
    );
  }
}

/*----------------------------------------*/

class Prix extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 300,
      //color: sBlue,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Total',
            textAlign: TextAlign.left,
            style: GoogleFonts.nunito(
              fontSize: 22,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            'prix',
            textAlign: TextAlign.left,
            style: GoogleFonts.nunito(
              fontSize: 18,
              fontWeight: FontWeight.normal,
            ),
          ),
          const SizedBox(height: 25),
          ElevatedButton(
            onPressed: () {
              // Logique à exécuter lorsque le bouton est pressé
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ModePayement(),
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
            child: const Text(
              'Continuer',
              style: TextStyle(
                color: sBlue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
