import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  var icon;
  var onpressed;
  RoundIconButton({@required this.icon, @required this.onpressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onpressed,
      fillColor: Colors.grey,
      elevation: 6.0,
      shape: CircleBorder(),
      constraints: BoxConstraints.tightFor(height: 40.0, width: 40.0),
    );
  }
}