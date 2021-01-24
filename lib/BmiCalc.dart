import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/Constants.dart';
import 'BottomButton.dart';
import 'Calculations.dart';

class Calculation extends StatefulWidget {
  String BMIResult;
  String Data;
  String Info;
  Calculation(
      {@required this.BMIResult, @required this.Data, @required this.Info});
  @override
  _CalculationState createState() => _CalculationState();
}

class _CalculationState extends State<Calculation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              "YOUR RESULT",
              style: NumberTextStyle,
              textAlign: TextAlign.center,
            ),
            Expanded(
              flex: 20,
              child: Container(
                color: Colors.blueGrey[700],
                height: 450.0,
                width: 330.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      widget.BMIResult,
                      style: TextStyle(
                          fontSize: 80.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w900),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      widget.Data,
                      style: TextStyle(
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      widget.Info,
                      style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            BottomButton(
              buttontitle: "RE-Calculate",
              ontap: () {
                setState(() {
                  Navigator.pop(context);
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
