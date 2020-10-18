import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_demo22/model/ProductModel.dart';
import 'package:test_demo22/model/cart.dart';
import 'package:test_demo22/viewmodel/ProductCatVM.dart';
import 'package:test_demo22/viewmodel/ProductVM.dart';
import 'package:test_demo22/widget/round_button_indian_bread.dart';
import '../pages/product_details.dart';

class CartItem1 extends StatefulWidget {
  final userVm;

  final String productId;
  final String id;
  final String catID;
  final double price;
  final double quantity;
  final String title;
  final String imgLoc;
  final String spicyLevel;
  final String typedDescription;
  final String description;

  CartItem1(
      {this.productId,
      this.id,
      this.catID,
      this.price,
      this.quantity,
      this.title,
      this.imgLoc,
      this.typedDescription,
      this.spicyLevel,
      this.description,
      this.userVm});

  @override
  _CartItem1State createState() => _CartItem1State();
}

class _CartItem1State extends State<CartItem1> {
  var menu;
  @override
  void initState() {
    // TODO: implement initState
    try {} on Exception catch (e) {
      // TODO
    }
  }

  Future<void> callforUpdate() async {
    await Provider.of<SubmenuListVM>(context, listen: false)
        .fetchProduct(int.parse(widget.catID));

    var cat = Provider.of<SubmenuListVM>(context, listen: false)
        .productList
        .where((element) => element.catid == int.parse(widget.catID));

    cat.forEach((element) {
      if (element.product.id == int.parse(widget.id)) {
        print(element.product.name);
        menu = element.product;
        print(element.product.id);
      }
    });
    // return menu;
  }

  bool isBreadOrDrink() {
    var isTrue = false;
    var bread = Provider.of<ProductListVM>(context, listen: false).breadsVM;
    if (bread.first.id.toString() == widget.catID) {
      return isTrue = true;
    }
    var drink = Provider.of<ProductListVM>(context, listen: false).drinksVM;
    if (drink.first.id.toString() == widget.catID) {
      return isTrue = true;
    }
    return isTrue;
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return FutureBuilder<void>(
        future: callforUpdate(),
        builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return Card(
              child: ListTile(
                leading: Container(
                  height: 120,
                  width: 120,
                  child: Image.memory(
                    base64Decode(widget.imgLoc),
                  ),
                ),
                title: Row(
                  children: <Widget>[
                    //================================= Title of the item in the cart ======================
                    Text(widget.title),
                    //================================= - Button ==============================
                    RoundIconButtonIndianBread(
                      color: Colors.red,
                      icon: Icons.remove,
                      onPressed: () {
                        cart.subtractItemCount(
                            widget.productId,
                            widget.catID,
                            widget.price,
                            widget.title,
                            widget.quantity,
                            widget.imgLoc,
                            widget.spicyLevel,
                            widget.typedDescription,
                            widget.description);
                      },
                    ),
                    //=================================== Quantity ============================
                    Text("${widget.quantity}"),
                    //================================== + Button =============================
                    RoundIconButtonIndianBread(
                      color: Colors.green,
                      icon: Icons.add,
                      onPressed: () {
                        cart.addItemCount(
                            widget.productId,
                            widget.catID,
                            widget.price,
                            widget.title,
                            widget.quantity,
                            widget.imgLoc,
                            widget.spicyLevel,
                            widget.typedDescription,
                            widget.description);
                      },
                    ),
                  ],
                ),
                trailing: Text("\$${widget.price * widget.quantity}", style: TextStyle(fontWeight: FontWeight.bold),),
                subtitle: Row(
                  children: <Widget>[
                    //=================================== Edit Button =============================
                    FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          side: BorderSide(color: Colors.grey)),
                      onPressed: isBreadOrDrink()
                          ? null
                          : () {
                        print(isBreadOrDrink());
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ProductDetails(
                                            userVM: widget.userVm,
                                            menuitem: menu,
                                            quantity: widget.quantity,
                                            flag: 1,
                                            passedSpicyLevel:
                                                widget.spicyLevel,
                                            passedDescription:
                                                widget.typedDescription,
                                          )));
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
            );
          }
          return Center(child: CircularProgressIndicator());
        });
  }
}
