import 'package:flutter/material.dart';

class RoundIconButtonIndianBread extends StatelessWidget {
  RoundIconButtonIndianBread({@required this.icon, this.onPressed,this.color});
  final IconData icon;
  final Function onPressed;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon, size: 15,),
      onPressed: onPressed,
      constraints: BoxConstraints.tightFor(width: 20.0, height: 20.0),
      elevation: 6.0,
      shape: CircleBorder(),
      fillColor: color,
    );
  }
}
