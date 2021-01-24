import 'package:flutter/material.dart';
import 'package:bmi_calculator/Input.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          primaryColor: Colors.blueGrey[900],
          scaffoldBackgroundColor: Colors.blueGrey[900]),
      home: InputPage(),
    );
  }
}

