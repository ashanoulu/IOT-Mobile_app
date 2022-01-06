import 'dart:convert';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FirstClass extends StatefulWidget {
  const FirstClass({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return FirstClassState();
  }
}

class FirstClassState extends State<FirstClass> {
  final ref = FirebaseDatabase.instance.reference();
  final myController = TextEditingController();
  final name = "Name";
  int retrievedName = 0;
  String humidity = "0.0";
  int co = 0;
  int methane = 0;
  int hydrogen = 0;
  String temperature = "0.0";


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _DBListiner();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text("Sensor Readings", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                const SizedBox(height: 10,),
                Table(
                  children: [
                    TableRow(
                        children: [
                          const Text("CO"),
                          const Text(":"),
                          Text('$co ')
                        ]
                    ),
                    TableRow(
                        children: [
                          const Text("Humidity"),
                          const Text(":"),
                          Text('$humidity %')
                        ]
                    ),
                    TableRow(
                        children: [
                          const Text("Methane"),
                          const Text(":"),
                          Text('$methane ')
                        ]
                    ),
                    TableRow(
                        children: [
                          const Text("Hydrogen"),
                          const Text(":"),
                          Text('$hydrogen ')
                        ]
                    ),
                    TableRow(
                        children: [
                          const Text("Temperature"),
                          const Text(":"),
                          Text('$temperature c')
                        ]
                    ),
                  ],
                ),
                const SizedBox(height: 10,),
                ElevatedButton(
                  onPressed: _DBListiner,
                  child: const Text("Update"),
                ),
              ],
            )));
  }

  void _DBListiner() {
    ref.child('AirQuality').onValue.listen((event) {
      dynamic value = event.snapshot.value;
      print(value);
      setState(() {
        co = value['CarbonMonoxide'];
        humidity = value['Humidity'].toString();
        methane = value['Methane'];
        hydrogen = value['Hydrogen'];
        temperature = value['Temperature'].toString();
      });
    });
  }

  // void _test(){
  //   ref.limitToLast(2).onValue.listen((event) {
  //     dynamic value = event.snapshot.value;
  //     print(value.toString());
  //   setState(() {
  //     co = value['CO'];
  //     humidity = value['CO2'];
  //     methane = value['methane'];
  //     hydrogen = value['Propane'];
  //     temperature = value['Temperature'];
  //
  //   }); });
  // }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }
}