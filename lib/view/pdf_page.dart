import 'package:flutter/material.dart';
import 'package:test_demo22/view/user_details.dart';
import 'package:provider/provider.dart';
import '../model/cart.dart';

class PDFScreen extends StatelessWidget {
  final String productId = "pdf1";
  final double price = 6.99;
  final double quantity = 0;
  final String title = "Parmesan Bread Twist";
  final String imgLoc =
      "https://cache.dominos.com/olo/6_29_1/assets/build/market/US/_en/images/img/products/larges/F_PARMT.jpg";
  final String spicyLevel = "";
  final String typedDescription = "";
  final String description = "";

  @override
  Widget build(BuildContext context) {

    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(''),
        backgroundColor: Colors.white,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.clear, color: Colors.blue,),
            onPressed: (){Navigator.pop(context);},
          )
        ],
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Column(
                  children: <Widget>[
                    Text(
                      'YOU MIGHT ALSO ENJOY',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Would you like to add the following items to your order?',
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Parmesan Bread Twist for ${price}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                          fontSize: 24),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '230 Calories / 2 pieces',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                          fontSize: 24),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '30 Calories / 1 container',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                          fontSize: 24),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      width: 370,
                      height: 140,
                      child: Text(
                        "Handmade form fresh buttery-tasting dough and baked to a golden brown . Crusty on the outside and soft on the inside. Drizzled with garlic and Parmesan cheese seasoning, and sprinked with more Parmesan. Served with a side of marinara sauce for dipping.",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Image.network(imgLoc),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 165,
                      height: 50,
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            side: BorderSide(color: Colors.white)),
                        onPressed: () {
                          cart.addItem(productId, price, title,
                              quantity, imgLoc, spicyLevel,typedDescription, description);
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => FormScreen()));
                        },
                        color: Colors.green,
                        textColor: Colors.lightGreen,
                        child: Center(
                          child: Text(
                            'YES, ADD TO ORDER',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                InkWell(
                  child: Text(
                    'No, Go To Checkout',
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline),
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => FormScreen()));
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
