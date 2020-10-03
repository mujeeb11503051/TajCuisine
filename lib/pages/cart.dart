import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_demo22/components/cart_products.dart';
import 'package:test_demo22/components/cart_total.dart';
import 'package:test_demo22/view/cart_screen.dart';
import 'package:test_demo22/widget/badge.dart';
import '../main.dart';
import '../model/cart.dart';

class Cart11 extends StatefulWidget {

  final userVM;
  Cart11({this.userVM});

  @override
  _Cart11State createState() => _Cart11State();
}

class _Cart11State extends State<Cart11> {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(
              Icons.dehaze,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Center(
              child: Text(
            'Orders',
            style: TextStyle(color: Colors.black),
          )),
          actions: <Widget>[
            Consumer<Cart>(
              builder: (_, cart, ch) => Badge(
                child: ch,
                value: cart.itemCountCart.toString(),
              ),
              child:
                  IconButton(icon: Icon(Icons.shopping_cart, color: Colors.green,), onPressed: () {}),
            ),
          ],
        ),
        body: ListView(
          children: <Widget>[
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FlatButton(
                    onPressed: () {Navigator.of(context).push(MaterialPageRoute (builder: (context) => HomePage()));},
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
            Container(
              height: 310,
              child: CartScreen(),
            ),
            Container(
              height: 385,
              child: CartTotal(userVM: widget.userVM,),
            )
          ],
        ));
  }
}
