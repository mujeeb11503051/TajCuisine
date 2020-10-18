import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:test_demo22/view/ProductVM.dart';
import 'package:test_demo22/viewmodel/ProductVM.dart';
import '../pages/product_details.dart';

class SubmenuList extends StatelessWidget {
  final List<ProductVM> submenu;
  final vm;
  SubmenuList({Key key, this.submenu, this.vm}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: this.submenu.length,
        itemBuilder: (BuildContext context, int index) {
          final menuitem = this.submenu[index];
          return ListTile(
            leading: Container(
              height: 120,
              width: 120,
              child: Image.memory(
                base64Decode(menuitem.image),
              ),
            ),
            title: Text(menuitem.name),
            onTap: () => {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProductDetails(
                            userVM: this.vm,
                            menuitem: menuitem,
                          ))),
            },
          );
        });
  }
}
