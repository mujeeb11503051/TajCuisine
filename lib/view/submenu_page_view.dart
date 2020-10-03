import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_demo22/viewmodel/ProductVM.dart';
import 'package:test_demo22/widget/submenuList.dart';

import 'ProductVM.dart';
// import model
// import controller

class SubmenuPageView extends StatefulWidget {
  final int menuID;
  final vm;
  SubmenuPageView(this.vm, {this.menuID});
  @override
  Widget build(BuildContext context) {
    //ProductVM vm = ProductVM();
    return ChangeNotifierProvider(
      //builder: (_) => SubmenuListVM(),
      create: (context) => SubmenuListVM(),
      child: build(context),
    );
  }

  @override
  State<StatefulWidget> createState() => _SubmenuPageState();
}

class _SubmenuPageState extends State<SubmenuPageView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    try {
      Provider.of<SubmenuListVM>(context, listen: false)
          .fetchProduct(widget.menuID);
    } on Exception catch (e) {
      // TODO
    }
  }

  @override
  Widget build(BuildContext context) {
    final menuList = Provider.of<SubmenuListVM>(context).productList;

    if (menuList == null) {
      return Align(
        child: CircularProgressIndicator(),
      );
    } else if (menuList.isEmpty) {
      return Align(child: Text("No items found "));
    } else {
      return SubmenuList(
          key: UniqueKey(), submenu: menuList, vm: this.widget.vm);
    }
  }
}
