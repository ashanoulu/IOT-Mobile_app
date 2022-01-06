import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:iot/FirstClass.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to IOT',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Welcome to IOT'),
        ),
        body: FirstClass(),
      ),
    );
  }
}
