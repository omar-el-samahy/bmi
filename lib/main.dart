import 'package:flutter/material.dart';
import 'home.dart';
import 'secondscreen.dart';
import 'screens/calc.dart';
import 'screens/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "s2": (context) => Secondscreen(),
        "calc": (context) => Calculator(),
        "log": (context) => Login()
      },
      home: BMICalculatorScreen(),
    );
  }
}
