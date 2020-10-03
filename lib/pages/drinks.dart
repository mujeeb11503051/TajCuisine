import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_demo22/viewmodel/ProductCatVM.dart';
import 'package:test_demo22/widget/drink_list_tile.dart';

class Drinks extends StatefulWidget {

  final userVM;
  Drinks({this.userVM});

  @override
  _DrinksState createState() => _DrinksState();
}

class _DrinksState extends State<Drinks> {
  List<ProductCatVM> getDrinks() {
    return Provider.of<ProductListVM>(context)
        .products
        .where((element) => element.type == 3)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    var dDrinks = getDrinks().first.id;

    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: <Widget>[
            Text(
              'Choose Your drink?',
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        iconTheme: new IconThemeData(color: Colors.red),
      ),
      body: DrinkListTile(
        drinkId: dDrinks,vm: widget.userVM,
      ),
    );
    ;
  }
}
