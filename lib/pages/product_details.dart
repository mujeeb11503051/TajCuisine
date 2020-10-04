import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_demo22/model/cart.dart';
import 'package:test_demo22/model/items.dart';
import 'package:test_demo22/view/cart_empty_screen.dart';
import 'package:test_demo22/viewmodel/UserVM.dart';
import 'package:test_demo22/widget/badge.dart';
import '../main.dart';
import 'cart.dart';
import 'package:test_demo22/model/cart_model.dart';
import 'package:test_demo22/pages/indian_bread.dart';
import '../widget/round_button.dart';

enum SpicyLevelNow { mild, medium, spicy, hot }

class ProductDetails extends StatefulWidget {
  final UserVM userVM;
  final menuitem;
  int quantity;
  ProductDetails({this.userVM, this.menuitem});
  static const routeName = '/ProductDetails';

  SpicyLevelNow _character = SpicyLevelNow.mild;

  //model of cart
  List<CartModel> cartData = [];

  void addToCart() {}
  bool isFavourite;

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  var spicyLevels = [
    'Spicy Level : Mild',
    'Spicy Level : Medium',
    'Spicy Level : Spicy',
    'Spicy Level : Hot'
  ];
  String selectedSpicyLevel = "Spicy Level : Mild";

  String typedDescriptionText = " ";
  int count = -1;

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context).settings.arguments as Map;
    final product_detail_itemID =
        this.widget.menuitem.id; // routeArgs['itemCardId'];
    final product_detail_itemCatId =
        this.widget.menuitem.catid; //routeArgs['itemCardCatId'];
    final product_detail_name =
        this.widget.menuitem.name; //routeArgs['itemCardTitle'];
    final double product_detail_new_price =
        this.widget.menuitem.price; //routeArgs['itemCardPrice'];
    final product_detail_picture =
        this.widget.menuitem.image; // routeArgs['itemCardImgLoc'];
    final product_detail_new_desc =
        this.widget.menuitem.description; //routeArgs['itemCardDescription'];
    final product_details_new_quantity =
        this.widget.menuitem.qty; // routeArgs['itemCardQuantity'];
    String product_details_spicy_level = "";
    String product_details_typed_description = "";

    final descriptionController = new TextEditingController();
    descriptionController.text = typedDescriptionText;

//    if (product_details_typed_description.length == 1) {
//      descriptionController.text = typedDescriptionText;
//    } else {
//      descriptionController.text = product_details_typed_description;
//    }
//
//    if (product_details_spicy_level.length == 1) {
//      //this is done because , when we click edit on the cart, we need to sent data to this screen and all previous values mist be retained
//      product_details_spicy_level = selectedSpicyLevel;
//    }

    final cart = Provider.of<Cart>(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(
            Icons.dehaze,
            color: Colors.black,
          ),
        ),
        title: Center(
          child: Text(
            'ORDER',
            style: TextStyle(
              color: Colors.red,
            ),
          ),
        ),
        actions: <Widget>[
          Consumer<Cart>(
            builder: (_, cart, ch) => Badge(
              child: ch,
              value: cart.itemCountCart.toString(),
            ),
            child: IconButton(
                icon: Icon(
                  Icons.shopping_cart,
                  color: Colors.greenAccent,
                ),
                onPressed: () {
                  if (cart.items.length != 0) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Cart11(userVM: widget.userVM,)));
                  } else {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CartEmptyScreen()));
                  }
                }),
          ), // shopping cart
        ],
        iconTheme: new IconThemeData(color: Colors.red),
      ),
      body: new ListView(
        children: <Widget>[
          //back button , menu , previous order , favourite button
          Padding(
            padding:
                const EdgeInsets.only(left: 20, top: 0, right: 0, bottom: 0),
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
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => HomePage()));
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
                  const EdgeInsets.only(left: 20, right: 18, top: 5, bottom: 5),
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
          //title of the product
          Container(
            height: 40,
            child: Center(
                child: Text(
              product_detail_name,
              style: TextStyle(fontSize: 30),
            )),
          ),

          //====================================image==========================
          Container(
            color: Colors.white,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.memory(
                  base64Decode(product_detail_picture),
                  height: 150,
                  width: 150,
                ),
                IconButton(
                  icon: Icon(cart.isFavourite
                      ? Icons.favorite
                      : Icons.favorite_border),
                  onPressed: () {
                    cart.toggleFavouriteStatus();
                  },
                )
              ],
            ),
          ),
          //=================================description========================
          Padding(
            padding:
                const EdgeInsets.only(left: 30, top: 5, right: 10, bottom: 0),
            //description, price, quantity, buttons
            child: Container(
              height: 130,
              //color: Colors.red,
              child: Row(
                children: <Widget>[
                  Container(
                    width: 140,
                    child: Text(
                      product_detail_new_desc,
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  //========================price=====================
                  Container(
                    child: Text(
                      "\$$product_detail_new_price",
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  //===========================buttons and count====================
                  Container(
                    child: Row(
                      children: <Widget>[
                        // ======================= - button============================
                        RoundIconButton(
                          color: Colors.red,
                          icon: Icons.remove,
                          onPressed: () {
                            setState(() {
                              if (count > -1) {
                                count--;
                              }
                            });
                          },
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        //==========================value====================
                        Text(
                          (count + 1).toString().padLeft(2, "0"),
                          style: TextStyle(fontSize: 25),
                        ),
                        //========================== + button=================
                        SizedBox(
                          width: 5.0,
                        ),
                        RoundIconButton(
                          color: Colors.green,
                          icon: Icons.add,
                          onPressed: () {
                            setState(() {
                              if (count >= -1) {
                                count++;
                              }
                            });
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[],
          ),
          //SizedBox(height: 60,),
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 60, top: 20),
                child: Container(
                  // ======================spicy level================================================
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    width: 305,
                    height: 60,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 12),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          icon: Icon(Icons.arrow_right),
                          value: selectedSpicyLevel,
                          items: spicyLevels.map((String dropdownStringItems) {
                            return DropdownMenuItem<String>(
                              value: dropdownStringItems,
                              child: Text(dropdownStringItems),
                            );
                          }).toList(),
                          onChanged: (String value) {
                            setState(() {
                              selectedSpicyLevel = value;
                              //print(selectedSpicyLevel);
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          //===========================description box=====================
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 60, top: 10),
                child: Container(
                  // ======================size button==================
                  child: SizedBox(
                    height: 60,
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          side: BorderSide(color: Colors.grey)),
                      onPressed: () {
                        //pop up dialog code
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text('Description'),
                                content: TextField(
                                  controller: descriptionController,
                                  maxLines: 3,
                                  decoration: InputDecoration(
                                      hintText: 'Description',
                                      border: OutlineInputBorder()),
                                ),
                                actions: <Widget>[
                                  MaterialButton(
                                    onPressed: () {
                                      setState(() {
                                        typedDescriptionText =
                                            descriptionController.text;
                                      });
                                      Navigator.of(context).pop(context);
                                    },
                                    child: Text(
                                      'Save',
                                      style: TextStyle(color: Colors.blue),
                                    ),
                                  ),
                                ],
                              );
                            });
                      },
                      color: Colors.white,
                      textColor: Colors.black,
                      child: Row(
                        children: <Widget>[
                          Container(
                            child: Text('Add Description'),
                          ),
                          SizedBox(
                            width: 150,
                          ),
                          Container(
                            child: Icon(Icons.arrow_right),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 60, top: 10),
                child: Container(
                  // =====================indian bread====================================================================
                  child: SizedBox(
                    height: 60,
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          side: BorderSide(color: Colors.grey)),
                      onPressed: () {
                        Navigator.of(context).push(new MaterialPageRoute(
                            builder: (context) => IndianBread(userVM: widget.userVM,)));
                      },
                      color: Colors.white,
                      textColor: Colors.black,
                      child: Row(
                        children: <Widget>[
                          Container(
                            width: 223,
                            child: Text(
                                'Would you like to add indian bread?(Optional)'),
                          ),
                          SizedBox(
                            width: 27,
                          ),
                          Container(
                            child: Icon(Icons.arrow_right),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                // ======================Add and Checkout======================================================================
                child: Padding(
                  padding: const EdgeInsets.only(left: 30, top: 20),
                  child: SizedBox(
                    height: 60,
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          side: BorderSide(color: Colors.lightGreen)),
                      onPressed: () {
                        //adding to cart
                        if (count >= 0) {
                          cart.addItem(
                              product_detail_itemID.toString(),
                              product_detail_itemCatId.toString(),
                              product_detail_new_price,
                              product_detail_name,
                              count.toDouble(),
                              product_detail_picture,
                              selectedSpicyLevel,
                              typedDescriptionText,
                              product_detail_new_desc);
                        }

                        //for testing the values in the cart
                        cart.printData();
                        //going to the cart screen
                        if (cart.items.length != 0) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Cart11(userVM: widget.userVM,)));
                        } else {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CartEmptyScreen()));
                        }
                      },
                      color: Colors.white,
                      textColor: Colors.lightGreen,
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Center(child: Text('Add &Checkout')),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                // ======================Add to cart==========================================================================
                child: Padding(
                  padding: const EdgeInsets.only(right: 27, top: 20),
                  child: SizedBox(
                    height: 60,
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          side: BorderSide(color: Colors.grey)),
                      onPressed: () {
                        if (count >= 0) {
                          cart.addItem(
                              product_detail_itemID.toString(),
                              product_detail_itemCatId.toString(),
                              product_detail_new_price,
                              product_detail_name,
                              count.toDouble(),
                              product_detail_picture,
                              selectedSpicyLevel,
                              typedDescriptionText,
                              product_detail_new_desc);
                        }
                        print(product_detail_name);
                        //Navigator.of(context).push(MaterialPageRoute (builder: (context)=> MyApp()));
                      },
                      color: Colors.lightGreen,
                      textColor: Colors.white,
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Center(child: Text('Add to cart')),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
