import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_demo22/model/indian_breads.dart';
import 'package:test_demo22/services/ServiceCalls.dart';
import 'package:test_demo22/viewmodel/ProductCatVM.dart';
import 'package:test_demo22/viewmodel/ProductVM.dart';

import 'bread_item.dart';

class BreadListTile extends StatefulWidget {
  final breadID;
  final vm;

  BreadListTile({this.breadID, this.vm});

  @override
  _BreadListTileState createState() => _BreadListTileState();
}

class _BreadListTileState extends State<BreadListTile> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    try {
      Provider.of<SubmenuListVM>(context, listen: false)
          .fetchProduct(widget.breadID);
    } on Exception catch (e) {
      // TODO
    }
  }

  List<ProductVM> getIndianBreadByCat() {
    return Provider.of<SubmenuListVM>(context).productList;

    //      .toList();
  }
  // List <ProductVM> getIndianBreadByCat( int breadId){
  //   return Provider.of<SubmenuListVM>(context)
  //       .productList
  //       .where((element) => element.catid == breadId)
  //       .toList();
  // }

  @override
  Widget build(BuildContext context) {
    //List<ProductCatVM> iBread = getIndianBread();
    final breadData = getIndianBreadByCat();
    //var breadData;
    //final breads = breadData.breads;

    if (breadData == null) {
      return Align(
        child: CircularProgressIndicator(),
      );
    } else {
      return Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
                itemCount: breadData.length,
                itemBuilder: (ctx, i) {
                  return BreadItem(vm: this.widget.vm, bread: breadData[i]);
                }),
          ),
        ],
      );
    }
  }
}
