import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  RoundIconButton({@required this.icon, this.onPressed,this.color});
  final IconData icon;
  final Function onPressed;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onPressed,
      constraints: BoxConstraints.tightFor(width: 30.0, height: 30.0),
      elevation: 6.0,
      shape: CircleBorder(),
      fillColor: color,
    );
  }
}
