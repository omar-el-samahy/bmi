import 'package:flutter/material.dart';
import 'home.dart';
import 'secondscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {"s2": (context) => Secondscreen()},
      home: BMICalculatorScreen(),
    );
  }
}

