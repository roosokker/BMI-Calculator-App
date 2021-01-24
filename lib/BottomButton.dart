import 'package:flutter/material.dart';
import 'Constants.dart';

class BottomButton extends StatelessWidget {
  final Function ontap;
  final String buttontitle;
  BottomButton({@required this.buttontitle , @required this.ontap});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 5,
      child: GestureDetector(
        onTap: ontap,
        child: Container(
          color: BottomContainerColor,
          width: double.infinity,
          height: BottomContainerHeight,
          margin: EdgeInsets.only(top: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(buttontitle , style: NumberTextStyle,),
            ],
          ),
        ),
      ),
    );
  }
}