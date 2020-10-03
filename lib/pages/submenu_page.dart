import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_demo22/services/SearchAPI.dart';
import 'package:test_demo22/view/ProductVM.dart';
import 'package:test_demo22/view/submenu_page_view.dart';
import 'package:test_demo22/viewmodel/ProductVM.dart';

import '../main.dart';

class SubmenuPage extends StatefulWidget {
  static const String routeName = '/submenuPage';
  final int menuID;
  final vm;
  //final outID;
  SubmenuPage(this.vm, {this.menuID});
  @override
  _SubmenuPageState createState() => _SubmenuPageState();
}

class _SubmenuPageState extends State<SubmenuPage> {
  SearchDelegateAPI _searchDelegate;
  SubmenuListVM _productvm;
  @override
  void initState() {
    super.initState();
    //Initializing search delegate with sorted list of English words
    _productvm = new SubmenuListVM();

    _productvm.fetchProduct(this.widget.menuID).then((value) => {
          _searchDelegate =
              SearchDelegateAPI(_productvm.productList, this.widget.vm)
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                  child: SizedBox(
                      width: 250,
                      child: TextField(
                          onChanged: (value) => {
                                showSearchPage(
                                    context, _searchDelegate, this.widget.vm)
                             },
                          autofocus: false,
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.deepOrangeAccent)),
                            hintText: "Search",
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.deepOrangeAccent,
                            ),
                          )))),
              Expanded(
                flex: 7,
                child: ChangeNotifierProvider(
                  //builder: (_) => SubmenuListVM(),
                  create: (context) => SubmenuListVM(),
                  child: SubmenuPageView(this.widget.vm,
                      menuID: this.widget.menuID),
                ),
              ),
            ]));
  }

  void showSearchPage(BuildContext context, SearchDelegateAPI searchDelegate,
      dynamic vm) async {
    final selected = await showSearch(
      context: context,
      delegate: searchDelegate,
    );

    if (selected != null) {
      //Navigator.push(
      //    context,null)
      // MaterialPageRoute(
      //     builder: (context) => SubmenuPage(vm, menuID: selected)));
    }
    return null;
  }
}
