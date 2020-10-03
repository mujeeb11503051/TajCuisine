import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_demo22/model/cart.dart';
import 'package:test_demo22/model/drinks.dart';
import 'package:test_demo22/pages/drinks.dart' as dddrink;
import 'package:test_demo22/view/pdf_page.dart';

class CartTotal extends StatefulWidget {

  final userVM;
  CartTotal({this.userVM});
  @override
  _CartTotalState createState() => _CartTotalState();
}

class _CartTotalState extends State<CartTotal> {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            width: 434,
            height: 40,
            color: Colors.grey[400],
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Choose Your Drink",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Container(
            width: 434,
            color: Colors.amberAccent[100],
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Add a refreshing beverage to your order?",
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
          //===========================
          Container(
            color: Colors.amberAccent[100],
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    child: Container(
                      width: 90,
                      height: 90,
                      color: Colors.green,
                      child: Image.asset("images/icons8-milk-carton-100.png"),
                    ),
                    onTap: (){Navigator.of(context).push(new MaterialPageRoute(builder: (context) => dddrink.Drinks(userVM: widget.userVM,)));},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: (){Navigator.of(context).push(new MaterialPageRoute(builder: (context) => dddrink.Drinks(userVM: widget.userVM,)));},
                    child: Container(
                      width: 90,
                      height: 90,
                      color: Colors.red,
                      child: Image.asset("images/icons8-milk-carton-100.png"),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: (){Navigator.of(context).push(new MaterialPageRoute(builder: (context) => dddrink.Drinks(userVM: widget.userVM,)));},
                    child: Container(
                      width: 90,
                      height: 90,
                      color: Colors.blue,
                      child: Image.asset("images/icons8-milk-carton-100.png"),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: (){Navigator.of(context).push(new MaterialPageRoute(builder: (context) => dddrink.Drinks(userVM: widget.userVM,)));},
                      child: Container(width: 90, height: 90, color: Colors.orange,child: Image.asset("images/icons8-milk-carton-100.png"),)),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.grey[400],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: Text('Food & Beverages: \$${cart.totalAmount}' , style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),),
                ),
                SizedBox(height: 5,),
                Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: Text('Taxes: \$${cart.totalTax}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),),
                ),
                SizedBox(height: 5,),
                Divider(
                  color: Colors.black,
                  indent: 195,
                  thickness: 3,
                ),
                SizedBox(height: 5,),
                Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: Text('Total: \$${(cart.totalTax + cart.totalAmount)}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),),
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      // ======================Add More======================================================================
                      child: Padding(
                        padding: const EdgeInsets.only(left: 30, top: 20,bottom: 15),
                        child: SizedBox(
                          height: 60,
                          child: FlatButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                side: BorderSide(color: Colors.red)),
                            onPressed: () {},
                            color: Colors.red,
                            textColor: Colors.white,
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: Center(child: Text('Add More')),
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
                      // ======================Checkout==========================================================================
                      child: Padding(
                        padding: const EdgeInsets.only(right: 27, top: 20,bottom: 15),
                        child: SizedBox(
                          height: 60,
                          child: FlatButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                side: BorderSide(color: Colors.red)),
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute (builder: (context) => PDFScreen(userVM: widget.userVM,)));
                            },
                            color: Colors.red,
                            textColor: Colors.white,
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Icon(Icons.add_shopping_cart),
                                      Text('Checkout'),
                                    ],
                                  ),
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
          )
        ],
      ),
    );
  }
}
