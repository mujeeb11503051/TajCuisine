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
            leading: Image.memory(
              base64Decode(menuitem.image),
            ),
            title: Text(menuitem.name),
            subtitle: Text(menuitem.description),
            onTap: () => {
              //Navigator.of(context)
              //     .pushNamed(ProductDetails.routeName, arguments: {
              //   'itemCardId': menuitem.id.toString(),
              //   'itemCardCatId' : menuitem.catid.toString(),
              //   'itemCardTitle': menuitem.name,
              //   'itemCardImgLoc': menuitem.image,
              //   'itemCardDescription': menuitem.description,
              //   'itemCardPrice': menuitem.price,
              //   'itemCardQuantity': menuitem.qty,
              // })
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
