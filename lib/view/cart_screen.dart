import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_demo22/model/cart.dart';
import 'package:test_demo22/widget/cart_item.dart';

class CartScreen extends StatelessWidget {

  final userVM;

  CartScreen({this.userVM});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
                itemCount: cart.itemCountCart,
                itemBuilder: (context, i) => CartItem1(
                      id: cart.items.values.toList()[i].id,
                      catID: cart.items.values.toList()[i].catId,
                      productId: cart.items.keys.toList()[i],
                      title: cart.items.values.toList()[i].title,
                      quantity: cart.items.values.toList()[i].quantity,
                      imgLoc: cart.items.values.toList()[i].imgloc,
                      price: cart.items.values.toList()[i].price,
                  spicyLevel: cart.items.values.toList()[i].spicyLevel,
                  typedDescription: cart.items.values.toList()[i].typedDescription,
                  description: cart.items.values.toList()[i].description,
                  userVm: userVM,
                    )),
          )
        ],
      ),
    );
  }
}
