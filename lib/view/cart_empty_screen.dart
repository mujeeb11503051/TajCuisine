import 'package:flutter/material.dart';

class CartEmptyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(icon: Icon(Icons.dehaze, color: Colors.black,),
        onPressed: (){Navigator.pop(context);},),
        title: Center(child: Text('Orders', style: TextStyle(color: Colors.black),)) ,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.arrow_right, color: Colors.white,),)
        ],
      ),
      body: Center(child: Text('Your cart is empty')),
    );
  }
}
