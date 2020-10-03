import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:test_demo22/pages/submenu_page.dart';
import 'package:test_demo22/view/items_screen.dart';
import 'package:test_demo22/viewmodel/ProductCatVM.dart';

class ProductList extends StatelessWidget {
  List<ProductCatVM> menuList;
  final vm;
  ProductList(
    @ required this.vm, {
    Key key,
    this.menuList,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GridView.builder(
        itemCount: this.menuList.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (context, index) {
          return Padding(
              padding: EdgeInsets.all(1),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                      onPressed: () => {
                        if (this.menuList[index].isactive)
                          {
                            print(this.menuList[index].productCategory),
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SubmenuPage(this.vm,
                                    menuID: this.menuList[index].id),
                              ),
                            ),
                            print(menuList[index].id.toString())
                          }
                      },
                      color: Colors.white,
                      elevation: 0.0,
                      padding: EdgeInsets.all(0),
                      child: Image.memory(
                          base64Decode(this.menuList[index].image),
                          fit: BoxFit.fill,
                          width: 100,
                          height: 100),
                    ),
                    Text(
                      this.menuList[index].name,
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 12,
                          fontWeight: FontWeight.w700),
                    )
                  ]));
        });
  }
}
