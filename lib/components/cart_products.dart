import 'package:flutter/material.dart';

class CartProducts extends StatefulWidget {
  @override
  _CartProductsState createState() => _CartProductsState();
}

class _CartProductsState extends State<CartProducts> {

  var productsOnTheCart = [
    {
      "name": "Cherry",
      "picture": "images/icons8-cherry-100.png",
      "price": 85,
      "quantity" : 1,
    },
    {
      "name": "Coconut",
      "picture": "images/icons8-coconut-100.png",
      "price": 50,
      "quantity" : 1
    }
  ];


  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemCount: productsOnTheCart.length,
        itemBuilder: (context,index){
          return SingleCartProduct(
            cart_prod_name: productsOnTheCart[index]["name"],
            cart_prod_picture: productsOnTheCart[index]["picture"],
            cart_prod_price: productsOnTheCart[index]["price"].toString(),
            cart_prod_qty: productsOnTheCart[index]["quantity"].toString(),
          );
        });
  }
}

class SingleCartProduct extends StatelessWidget {

  final cart_prod_name;
  final cart_prod_picture;
  final cart_prod_price;
  final cart_prod_qty;

  SingleCartProduct({this.cart_prod_name,this.cart_prod_picture,this.cart_prod_price,this.cart_prod_qty});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Row(
          children: <Widget>[
            Container(
              height: 40,
              width: 40,
              child: Image.asset(cart_prod_picture),
            ),
            Container(
              child: Text(cart_prod_name),
            ),
            Container(
              child: Text(cart_prod_price),
            )
          ],
        ),
        subtitle: Text('aaa'),
      ),
    );
  }
}

