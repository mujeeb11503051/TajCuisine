import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_demo22/viewmodel/ProductCatVM.dart';
import 'package:test_demo22/widget/category_item.dart';
import 'package:test_demo22/widget/productList.dart';


class MenuViewPage extends StatefulWidget {
  final List<ProductCatVM> searchItem;
  final vm;
  MenuViewPage(this.vm, [this.searchItem]);
  static const String routeName = '/menuView';

  @override
  MenuViewPageState createState() => MenuViewPageState();
}

class MenuViewPageState extends State<MenuViewPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    try {
      Provider.of<ProductListVM>(context, listen: false).fetchMenuItems();
    } on Exception catch (e) {
      // TODO
    }
  }

  List<ProductCatVM> updateWidget() {
    ///setState(() {
   
    return Provider.of<ProductListVM>(context).products;
  }

  //provider for category items
  List<ProductCatVM> updateCategory(){
    return Provider.of<ProductListVM>(context).categoryVM;
  }


  // @override
  // Widget build(BuildContext context) {
  //   final menuList =
  //       searchWidget(); //Provider.of<ProductListVM>(context).products;

  //   if (menuList == null) {
  //     return Align(
  //       child: CircularProgressIndicator(),
  //     );
  //   } else if (menuList.isEmpty) {
  //     return Align(child: Text("No items found "));
  //   } else {
  //     return ProductList(this.widget.vm, this.widget.searchItem,
  //         key: UniqueKey(), menuList: menuList);
  //   }
  // }
  @override
  Widget build(BuildContext context) {
    final menuList =
        updateWidget();
    //Provider.of<ProductListVM>(context).products;

    // categoryList contains the element of 'type'  = 1
    final categoryList = updateCategory();
    if (categoryList == null) {
      return Align(
        child: CircularProgressIndicator(),
      );
    } else if (categoryList.isEmpty) {
      return Align(child: Text("No items found "));
    } else {
      return ProductList(this.widget.vm, key: UniqueKey(), menuList: categoryList);
    }
  }
}
