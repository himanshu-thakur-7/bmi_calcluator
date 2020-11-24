import 'package:flutter/material.dart';
class ReusableCard extends StatelessWidget {
  final Color colour;
  final Widget cardChild;
  final Function Ges;
  ReusableCard({@required this.colour, this.cardChild,this.Ges});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:Ges,

      child: Container(
        child: cardChild,
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0),
        ),
        margin: EdgeInsets.all(15.0),

      ),
    );
  }
}
