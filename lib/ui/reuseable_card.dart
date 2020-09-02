import 'package:flutter/material.dart';
import 'package:meta/meta.dart';


class ReuseableCard extends StatelessWidget {
  ReuseableCard({this.cardChild, this.colour});
  Color colour;
  Widget cardChild;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(8.0)),
      child: cardChild,
    );
  }
}
