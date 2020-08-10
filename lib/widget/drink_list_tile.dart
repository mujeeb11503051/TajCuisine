import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_demo22/model/drinks.dart';
import 'package:test_demo22/model/indian_breads.dart';
import 'package:test_demo22/widget/drink_item.dart' as drinkItem;

class DrinkListTile extends StatefulWidget {
  @override
  _DrinkListTileState createState() => _DrinkListTileState();
}

class _DrinkListTileState extends State<DrinkListTile> {
  @override
  Widget build(BuildContext context) {

    final drinkData = Provider.of<Drinks>(context);
    final drinks = drinkData.drinks;

    return Column(
      children: <Widget>[
        Expanded(
          child: ListView.builder(
              itemCount: drinks.length,
              itemBuilder: (ctx, i) =>
                  ChangeNotifierProvider.value(value: drinks[i],
                    child: drinkItem.DrinkItem(),)),
        ),
      ],
    );;
  }
}


