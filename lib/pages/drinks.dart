import 'package:flutter/material.dart';
import 'package:test_demo22/widget/drink_list_tile.dart';

class Drinks extends StatefulWidget {
  @override
  _DrinksState createState() => _DrinksState();
}

class _DrinksState extends State<Drinks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: <Widget>[
            Text('Choose Your drink?', style: TextStyle(color: Colors.black),),
          ],
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        iconTheme: new IconThemeData(color: Colors.red),
      ),
      body: DrinkListTile(),
    );;
  }
}
