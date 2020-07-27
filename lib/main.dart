import 'package:Truenews/screens/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Truenews',
      theme: ThemeData(

        primarySwatch: Colors.blue,

      ),
      home: Home(),
    );
  }
}

