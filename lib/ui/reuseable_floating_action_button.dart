import 'package:flutter/material.dart';


class RoundFloatingActionButton extends StatelessWidget {
  RoundFloatingActionButton({@required this.icon, @required this.onPressed });

  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
        child: Icon(icon),
        onPressed: onPressed,
        elevation: 6.0,
        constraints: BoxConstraints.tightFor(
          width: 50.0,
          height: 50.0,
        ),
        shape: CircleBorder(),
      fillColor: Colors.grey,
    );
  }
}
