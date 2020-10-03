

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//my imports
import 'package:test_demo22/dummy_data.dart';
import 'package:test_demo22/viewmodel/ProductCatVM.dart';
import 'package:test_demo22/widget/category_item.dart';

class CategoriesScreen extends StatefulWidget {
  final UserVM;
  final List<ProductCatVM> searchItem;
  CategoriesScreen(this.UserVM, [this.searchItem]);

  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {

  List<ProductCatVM> updateWidget() {
    ///setState(() {
    return Provider.of<ProductListVM>(context).products;
  }

  @override
  Widget build(BuildContext context) {
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
    final menuList = updateWidget();

    if (menuList == null) {
      print(menuList);
      return Align(
        child: CircularProgressIndicator(),
      );
    } else if (menuList.isEmpty) {
      return Align(child: Text("No items found "));
    } else {
      return GridView.builder(
        itemCount: menuList.length,
        gridDelegate:
        SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (context, index){
          print(menuList[index].name);
          return CategoryItem(menuList[index].id.toString(), menuList[index].name, menuList[index].image);
        },

      );
    }

    // return Scaffold(
    //   body: Container(
    //     child: GridView.count(crossAxisCount: 3,
    //       primary: false,
    //       padding: EdgeInsets.all(20),
    //       crossAxisSpacing: 30,
    //       mainAxisSpacing: 30,
    //       children: DUMMY_CATEGORIES.map((catData) => CategoryItem(catData.id,catData.title,catData.imgLoc)).toList(),
    //     ),
    //   ),
    // );

  }
}