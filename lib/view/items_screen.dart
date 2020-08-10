import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//my imports
import 'package:test_demo22/dummy_data.dart';
import 'package:test_demo22/model/cart.dart';
import 'package:test_demo22/pages/cart.dart';
import 'package:test_demo22/widget/badge.dart';
import 'package:test_demo22/widget/item_card.dart';

import '../main.dart';
import 'cart_empty_screen.dart';

class ItemsScreen extends StatelessWidget {
  static const routeName = '/ItemScreen';
//  final String categoryId;
//  ItemsScreen({@required this.categoryId});

  @override
  Widget build(BuildContext context) {
    //arguments from previous page

    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryId = routeArgs['id'];

    //categoryItems is the new list which contains the filtered items
    final categoryItems = DUMMY_ITEMS.where((meal) {
      return meal.categoryId.contains(categoryId);
    }).toList();

    // this is used to get length of the cart items map
    final cart = Provider.of<Cart>(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.dehaze,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
        title: Center(
            child: Text(
          'ORDER',
          style: TextStyle(color: Colors.black),
        )),
        actions: <Widget>[
          Consumer<Cart>(
            builder: (_, cart, ch) => Badge(
              child: ch,
              value: cart.itemCountCart.toString(),
            ),
            child: IconButton(
                icon: Icon(Icons.shopping_cart, color: Colors.greenAccent,),
                onPressed: () {
                  if (cart.items.length != 0) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Cart11()));
                  } else {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CartEmptyScreen()));
                  }
                }),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding:
                const EdgeInsets.only(left: 20, top: 10, right: 0, bottom: 10),
            child: Row(
              children: <Widget>[
                Container(
                  height: 36,
                  color: Colors.grey,
                  child: FlatButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0),
                          side: BorderSide(color: Colors.black)),
                      child: Container(
                          child: Icon(
                        Icons.arrow_back_ios,
                      ))),
                ),
                FlatButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute (builder: (context) => HomePage()));
                  },
                  child: Text(
                    'MENU',
                    style: TextStyle(fontSize: 11),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                      side: BorderSide(color: Colors.black)),
                ),
                FlatButton(
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                      side: BorderSide(color: Colors.black)),
                  child: Text(
                    'PREVIOUS ORDERS',
                    style: TextStyle(fontSize: 11),
                  ),
                ),
                FlatButton(
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                      side: BorderSide(color: Colors.black)),
                  child: Container(
                      child: Text(
                    'FAVOURITES',
                    style: TextStyle(fontSize: 11),
                  )),
                ),
              ],
            ),
          ),
          //search bar
          Container(
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 18, right: 18, top: 5, bottom: 5),
              child: Container(
                height: 35,
                child: TextField(
                  decoration: InputDecoration(
                      labelText: 'Search',
                      border: new OutlineInputBorder(
                          borderSide: new BorderSide(color: Colors.grey))),
                ),
              ),
            ),
          ),
          Container(
            height: 600,
            child: ListView.builder(
                itemCount: categoryItems.length,
                itemBuilder: (context, int index) {
                  return ItemCard(
                    itemCardItemID: categoryItems[index].itemId,
                    itemCardCatID: categoryItems[index].categoryId,
                    itemCardImgLoc: categoryItems[index].itemImage,
                    itemCardTitle: categoryItems[index].itemName,
                    itemCardPrice: categoryItems[index].itemPrice,
                    itemCardDescription: categoryItems[index].itemDescription,
                    itemCardQuantity: categoryItems[index].quantity,
                    itemCardSpicyLevel: categoryItems[index].spicyLevel,
                    itemCardTypedDescription: categoryItems[index].typedDescription,

                  );
                }),
          ),
        ],
      ),
    );
  }
}
