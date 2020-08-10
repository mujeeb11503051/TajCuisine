import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_demo22/model/cart.dart';
import 'package:test_demo22/widget/round_button_indian_bread.dart';
import '../pages/product_details.dart';

class CartItem1 extends StatefulWidget {
  final String productId;
  final String id;
  final double price;
  final double quantity;
  final String title;
  final String imgLoc;
  final String spicyLevel;
  final String typedDescription;
  final String description;

  CartItem1({
    this.productId,
    this.id,
    this.price,
    this.quantity,
    this.title,
    this.imgLoc,
    this.typedDescription,
    this.spicyLevel,
    this.description
  });



  @override
  _CartItem1State createState() => _CartItem1State();
}

class _CartItem1State extends State<CartItem1> {
  @override
  Widget build(BuildContext context) {

    final cart = Provider.of<Cart>(context);
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 4),
      child: Padding(
        padding: EdgeInsets.all(8),
        child: ListTile(
          leading: Image.asset(widget.imgLoc),
          title: Row(
            children: <Widget>[
              //================================= Title of the item in the cart ======================
              Text(widget.title),
              //================================= - Button ==============================
              RoundIconButtonIndianBread(
                color: Colors.red,
                icon: Icons.remove,
                onPressed: () {
                  cart.subtractItemCount(widget.productId, widget.price, widget.title, widget.quantity, widget.imgLoc,widget.spicyLevel,widget.typedDescription, widget.description);
                },
              ),
              //=================================== Quantity ============================
              Text("${widget.quantity}"),
              //================================== + Button =============================
              RoundIconButtonIndianBread(
                color: Colors.green,
                icon: Icons.add,
                onPressed: () {
                  cart.addItemCount(widget.productId, widget.price, widget.title, widget.quantity, widget.imgLoc,widget.spicyLevel,widget.typedDescription, widget.description);
                },
              ),
            ],
          ),
          trailing: Text("\$${widget.price}"),
          subtitle: Row(
            children: <Widget>[
              //=================================== Edit Button =============================
              FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    side: BorderSide(color: Colors.grey)),
                onPressed: () {
//
//
//                  Navigator.of(context).pushNamed(ProductDetails.routeName, arguments: {
//                    'itemCardId': widget.id,
//                    'itemCardTitle': widget.title,
//                    'itemCardImgLoc': widget.imgLoc,
//                    'itemCardDescription': widget.description,
//                    'itemCardPrice': widget.price,
//                    'itemCardQuantity': widget.quantity,
//                    'itemCardSpicyLevel': widget.spicyLevel,
//                    'itemCardTypedDescription': widget.typedDescription
//                  });

                },
                child: Text('Edit'),
              ),
              SizedBox(
                width: 5,
              ),
              //====================================Remove Button ==============================
              FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    side: BorderSide(color: Colors.grey)),
                onPressed: () {
                  Provider.of<Cart>(context, listen: false)
                      .removeItem(widget.productId);
                },
                child: Text('Remove'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
