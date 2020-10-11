import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_demo22/viewmodel/ProductCatVM.dart';
import 'package:test_demo22/viewmodel/ProductVM.dart';
import 'package:test_demo22/widget/bread_list_tile.dart';

class IndianBread extends StatefulWidget {

  final userVM;

  IndianBread({this.userVM});
    @override
    _IndianBreadState createState() => _IndianBreadState();
}

class _IndianBreadState extends State<IndianBread> {
  List<ProductCatVM> getIndianBread() {
     Provider.of<ProductListVM>(context,listen: false).fetchMenuItems();
     return  Provider.of<ProductListVM>(context,listen: false).breadsVM;
  }
  @override
  Widget build(BuildContext context) {
    var iBread = getIndianBread().first.id;
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: <Widget>[
            Text(
              'Would you like to add indian bread?',
              style: TextStyle(color: Colors.black),
            ),
            Text('(Optional)', style: TextStyle(color: Colors.black))
          ],
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        iconTheme: new IconThemeData(color: Colors.red),
      ),
      body: BreadListTile(breadID: iBread, vm: widget.userVM,),
    );
  }
}
