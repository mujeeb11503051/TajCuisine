import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_demo22/widget/bread_list_tile.dart';

class IndianBread extends StatefulWidget {
  @override
  _IndianBreadState createState() => _IndianBreadState();
}

class _IndianBreadState extends State<IndianBread> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: <Widget>[
            Text('Would you like to add indian bread?', style: TextStyle(color: Colors.black),),
            Text('(Optional)',style: TextStyle(color: Colors.black))
          ],
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        iconTheme: new IconThemeData(color: Colors.red),
      ),
      body: BreadListTile(),
    );
  }
}
