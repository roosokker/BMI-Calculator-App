import 'dart:math';

import 'package:flutter/cupertino.dart';

class Calculate{
  int height;
  int weight;
  double _result;
  Calculate({@required this.height , @required this.weight });

  String getResult()
  {
    _result =  weight / pow(height/100, 2);
    return (_result.toStringAsFixed(1));
  }

  String getData()
  {
    if(_result >= 25.0)
      return "Overweight";
    else if(_result >18.5)
      return "Normal";
    else
      return "Underweight";
  }

  String getInfo()
  {
    if(_result >= 25.0)
      return "You have more than a Normal body weight.. you have to Exercise!";
    else if(_result >18.5)
      return "You have a Normal body weight.. Good Job!";
    else
      return "You have less than a Normal weight.. you have to eat more!";
  }
}