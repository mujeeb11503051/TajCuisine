import 'package:flutter/material.dart';
import 'package:test_demo22/view/items_screen.dart';
import 'package:test_demo22/viewmodel/ProductCatVM.dart';
import 'package:test_demo22/widget/item_card.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageLoc;


  CategoryItem(this.id, this.title, this.imageLoc);

  void selectItem(BuildContext ctx){
    Navigator.of(ctx).pushNamed(ItemsScreen.routeName, arguments: {'id' : id});

  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        selectItem(context);
      },
      child: Container(
        width: 100.0,
        child: ListTile(
          title: Image.asset(
            imageLoc,
            width: 100.0,
            height: 80.0,
          ),
          subtitle: Container(
            child: Text(
              title,
            ),
            alignment: Alignment.topCenter,
          ),
        ),
      ),
    );
  }
}
