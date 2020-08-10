import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_demo22/model/cart.dart';
import 'package:test_demo22/model/indian_bread.dart';
import 'package:test_demo22/widget/round_button.dart';
import 'package:test_demo22/widget/round_button_indian_bread.dart';

class BreadItem extends StatefulWidget {
  @override
  _BreadItemState createState() => _BreadItemState();
}

class _BreadItemState extends State<BreadItem> {
  int count = -1;

  @override
  Widget build(BuildContext context) {
    final bread = Provider.of<IndianBread>(context);
    final cart = Provider.of<Cart>(context);
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: Padding(
        padding: EdgeInsets.all(8),
        child: ListTile(
          leading: Container(
            height: 80,
            width: 80,
            child: Image.asset(bread.imageUrl),
          ),
          title: Text(bread.title),
          subtitle: Row(
            children: <Widget>[
              Text(
                "\$${bread.price}",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(
                width: 10,
              ),
              Text("0 Cal"),
              IconButton(
                icon: Icon(Icons.add_shopping_cart),
                onPressed: () {
                  if (count >= 0) {
                    cart.addItem(bread.id, bread.price, bread.title,
                        count.toDouble(), bread.imageUrl, bread.spicyLevel,bread.typedDescription, bread.description);
                  }
                },
              )
            ],
          ),
          trailing: Container(
            //color: Colors.blue,
            height: 70,
            width: 120,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                // ======================= - button============================
                RoundIconButtonIndianBread(
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
                //==========================value====================
                Text(
                  (count + 1).toString().padLeft(2, "0"),
                  style: TextStyle(fontSize: 12),
                ),
                //========================== + button=================
                RoundIconButtonIndianBread(
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
          ),
        ),
      ),
    );
  }
}
