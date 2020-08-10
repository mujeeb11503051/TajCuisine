import 'package:flutter/material.dart';

//my imports
import 'package:test_demo22/dummy_data.dart';
import 'package:test_demo22/widget/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: GridView.count(crossAxisCount: 3,
          primary: false,
          padding: EdgeInsets.all(20),
          crossAxisSpacing: 30,
          mainAxisSpacing: 30,
          children: DUMMY_CATEGORIES.map((catData) => CategoryItem(catData.id,catData.title,catData.imgLoc)).toList(),
        ),
      ),
    );
  }
}