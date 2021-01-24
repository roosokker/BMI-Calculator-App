import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Color colr;
  final Widget CardChild;
  ReusableCard({@required this.colr , @required this.CardChild});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      margin: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        color: colr,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: CardChild,
    );
  }
}