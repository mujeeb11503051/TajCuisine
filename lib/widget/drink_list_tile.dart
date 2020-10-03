import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_demo22/model/drinks.dart';
import 'package:test_demo22/model/indian_breads.dart';
import 'package:test_demo22/viewmodel/ProductVM.dart';
import 'package:test_demo22/widget/drink_item.dart' as drinkItem;

class DrinkListTile extends StatefulWidget {
  final drinkId;
  final vm;

  DrinkListTile({this.drinkId, this.vm});

  @override
  _DrinkListTileState createState() => _DrinkListTileState();
}

class _DrinkListTileState extends State<DrinkListTile> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    try {
      Provider.of<SubmenuListVM>(context, listen: false)
          .fetchProduct(widget.drinkId);
    } on Exception catch (e) {
      // TODO
    }
  }

  List<ProductVM> getDrinkByCat() {
    var productList;
    return Provider.of<SubmenuListVM>(context).productList;
  }

  @override
  Widget build(BuildContext context) {
    final dDrinkData = getDrinkByCat();

    //final drinkData = Provider.of<Drinks>(context);
    //final drinks = drinkData.drinks;

    if (dDrinkData == null) {
      return Align(
        child: CircularProgressIndicator(),
      );
    } else {
      return Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
                itemCount: dDrinkData.length,
                itemBuilder: (ctx, i) {
                  return drinkItem.DrinkItem(
                    vm: widget.vm,
                    drink: dDrinkData[i],
                  );
                }),
          ),
        ],
      );
    }
  }
}
