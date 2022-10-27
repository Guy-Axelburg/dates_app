import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static DateTime _date = DateTime.now();
  static TimeOfDay _time1 = TimeOfDay.now();

  String mydate1 = "";
  String mydate2 = "";
  String mytime1 = "";

// ----------- First Get Date Widget ----------

  Widget getDate() {
    return ElevatedButton(
        child: const Text("Select Date"),
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0))),
        onPressed: () {
          theDate();
        });
  } //end of getDate

  theDate() async {
    _date = (await showDatePicker(context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000, 1, 1),
        lastDate: DateTime(2055, 1, 1)))!;

    setState(() {
      if (_date.toString() != "") {
        mydate1 = _date.month.toString() + " / " +
            _date.day.toString() + " / " +
            _date.year.toString();
      }
      else {
        mydate1 = "";
      }
    });
  }


// --------------------------------------------

  // ----------- Second Get Date Widget ----------

  Widget getDate2() {
    return ElevatedButton(
        child: const Text("Select Date"),
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0))),
        onPressed: () {
          theDate2();
        });
  } //end of getDate

  theDate2() async {
    _date = (await showDatePicker(context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000, 1, 1),
        lastDate: DateTime(2055, 1, 1),
        initialEntryMode: DatePickerEntryMode.input))!;

    setState(() {
      if (_date.toString() != "") {
        mydate2 = _date.month.toString() + " / " +
            _date.day.toString() + " / " +
            _date.year.toString();
      }
      else {
        mydate2 = "";
      }
    });
  }


// --------------------------------------------
//time picker

  Widget getTime() {
    return ElevatedButton(
        child: const Text("Select Time"),
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0))),
        onPressed: () {
          theTime();
        });
  }

//end of getTime

  theTime() async {
    _time1 =
    (await showTimePicker(context: context, initialTime: TimeOfDay.now()))!;


    setState(() {
      if (_time1.toString() != "") {
        mytime1 = _time1.hourOfPeriod.toString() + ":" +
            ((_time1.minute<10)? "0"+_time1.minute.toString() : _time1.minute.toString()) +
            ((_time1.period.toString() =="DayPeriod.pm")? " pm":" am" );

      }
    });

    //end of getDate
  }
    //-------------------------------------------
    @override
    Widget build(BuildContext context) {
      return Scaffold(
          appBar: AppBar(title: const Text("Date Picker")),
          body: ListView(padding: const EdgeInsets.all(20.0), children: [
            Column(
              children: [
                const Text('Time / Date Picker',
                    style:
                    TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold)),
                getDate(),
                Text(mydate1),
                getDate2(),
                Text(mydate2),
                getTime(),
                Text(mytime1)
              ],
            )
          ]));
    }

}
