import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_demo22/model/cart.dart';
import 'package:test_demo22/model/indian_bread.dart';
import 'package:test_demo22/widget/round_button.dart';
import 'package:test_demo22/widget/round_button_indian_bread.dart';

class BreadItem extends StatefulWidget {
  final bread;
  final vm;

  final String spicyLevel = "";
  final String typedDes = "";

  BreadItem({this.vm, this.bread});
  @override
  _BreadItemState createState() => _BreadItemState();
}

class _BreadItemState extends State<BreadItem> {
  int count = -1;

  @override
  Widget build(BuildContext context) {
    //final bread = Provider.of<IndianBread>(context);
    final cart = Provider.of<Cart>(context);
    return Card(
      child: Padding(
        padding: EdgeInsets.all(8),
        child: ListTile(
          leading: Container(
            height: 80,
            width: 80,
            child: Image.memory(base64Decode(widget.bread.image)),
          ),
          title: Text(widget.bread.name),
          subtitle: Row(
            children: <Widget>[
              Text(
                "\$${widget.bread.price}",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(
                width: 2,
              ),
              Text("0 Cal"),
              SizedBox(
                width: 5,
              ),
              Container(
                height: 30,
                width: 70,
                child: RaisedButton(
                  elevation: 6,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        side: BorderSide(color: Colors.grey)),
                    onPressed: () {
                      if (count >= 0) {
                        cart.addItem(
                            widget.bread.id.toString(),
                            widget.bread.catid.toString(),
                            widget.bread.price,
                            widget.bread.name,
                            count.toDouble(),
                            widget.bread.image,
                            widget.spicyLevel,
                            widget.typedDes,
                            widget.bread.description);
                      }
                    },
                    color: Colors.green,
                    child: Text('Save')),
              )
            ],
          ),
          trailing: Container(
            //color: Colors.blue,
            height: 70,
            width: 110,
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
