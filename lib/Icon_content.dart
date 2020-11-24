import 'package:flutter/material.dart';

import 'Constants.dart';
class Content extends StatelessWidget {
  final IconData i;
  final String text;
  Content({this.i,this.text});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          i,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          text,
          style: Ktstyle
        )

      ],
    );
  }
}

