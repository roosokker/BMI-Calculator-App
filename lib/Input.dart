import 'dart:ffi';
import 'package:bmi_calculator/Calculations.dart';

import 'RoundIconClass.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'ReusableCard.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'Constants.dart';
import 'package:bmi_calculator/BmiCalc.dart';
import 'BottomButton.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color activecardcolor = Colors.blueGrey[700];
  Color inactivecardcolor = Colors.blueGrey[800];
  Gender selectedgender;
  int Heigth = 180;
  int weight = 60;
  int age = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedgender = Gender.male;
                        });
                      },
                      child: ReusableCard(
                        colr: selectedgender == Gender.male
                            ? inactivecardcolor
                            : activecardcolor,
                        CardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              FontAwesomeIcons.mars,
                              size: 80.0,
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              "MALE",
                              style: TitleTextStyle,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedgender = Gender.female;
                        });
                      },
                      child: ReusableCard(
                        colr: selectedgender == Gender.female
                            ? inactivecardcolor
                            : activecardcolor,
                        CardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              FontAwesomeIcons.venusMars,
                              size: 80.0,
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              "FEMALE",
                              style: TitleTextStyle,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      colr: activecardcolor,
                      CardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "HEIGHT",
                            style: TitleTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: <Widget>[
                              Text(
                                Heigth.toString(),
                                style: NumberTextStyle,
                              ),
                              Text(
                                "cm",
                                style: TitleTextStyle,
                              ),
                            ],
                          ),
                          SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                                activeTrackColor: Colors.white,
                                inactiveTrackColor: Colors.grey,
                                thumbColor: Colors.pink,
                                thumbShape: RoundSliderThumbShape(
                                    enabledThumbRadius: 15.0),
                                overlayColor: Color(0x70EB1555),
                                overlayShape: RoundSliderOverlayShape(
                                    overlayRadius: 25.0)),
                            child: Slider(
                              value: Heigth.toDouble(),
                              min: 120,
                              max: 220,
                              onChanged: (double value) {
                                setState(() {
                                  Heigth = value.round();
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      colr: activecardcolor,
                      CardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "WEIGHT",
                            style: TitleTextStyle,
                          ),
                          Text(
                            weight.toString(),
                            style: NumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onpressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onpressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      colr: activecardcolor,
                      CardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "AGE",
                            style: TitleTextStyle,
                          ),
                          Text(
                            age.toString(),
                            style: NumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onpressed: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onpressed: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            BottomButton(
              buttontitle: "BMI Calculation",
              ontap: () {
                setState(() {
                  Calculate calc =
                      new Calculate(height: Heigth, weight: weight);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Calculation(
                                BMIResult: calc.getResult(),
                                Data: calc.getData(),
                                Info: calc.getInfo(),
                              )));
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
