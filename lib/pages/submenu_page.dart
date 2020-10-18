import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_demo22/model/cart.dart';
import 'package:test_demo22/services/SearchAPI.dart';
import 'package:test_demo22/view/ProductVM.dart';
import 'package:test_demo22/view/cart_empty_screen.dart';
import 'package:test_demo22/view/submenu_page_view.dart';
import 'package:test_demo22/viewmodel/ProductVM.dart';
import 'package:test_demo22/widget/badge.dart';

import '../main.dart';
import 'cart.dart';

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
    final cart = Provider.of<Cart>(context);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.dehaze),
          ),
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          title: Center(
              child: Text(
            'ORDER',
            style: TextStyle(
              color: Colors.red,
            ),
          )),
          actions: <Widget>[
            Consumer<Cart>(
              builder: (_, cart, ch) => Badge(
                child: ch,
                value: cart.itemCountCart.toString(),
              ),
              child: IconButton(
                  icon: Icon(
                    Icons.shopping_cart,
                    color: Colors.greenAccent,
                  ),
                  onPressed: () {
                    if (cart.items.length != 0) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Cart11()));
                    } else {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CartEmptyScreen()));
                    }
                  }),
            ), // shopping cart
          ],
        ),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                    left: 18, top: 10, right: 0, bottom: 10),
                child: Row(
                  children: <Widget>[
                    Container(
                      height: 36,
                      color: Colors.grey,
                      child: FlatButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0),
                              side: BorderSide(color: Colors.black)),
                          child: Container(
                              child: Icon(
                            Icons.arrow_back_ios,
                          ))),
                    ),
                    FlatButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => HomePage()));
                      },
                      child: Text(
                        'MENU',
                        style: TextStyle(fontSize: 11),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0),
                          side: BorderSide(color: Colors.black)),
                    ),
                    FlatButton(
                      onPressed: () {},
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0),
                          side: BorderSide(color: Colors.black)),
                      child: Text(
                        'PREVIOUS ORDERS',
                        style: TextStyle(fontSize: 11),
                      ),
                    ),
                    FlatButton(
                      onPressed: () {},
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0),
                          side: BorderSide(color: Colors.black)),
                      child: Container(
                          child: Text(
                        'FAVOURITES',
                        style: TextStyle(fontSize: 11),
                      )),
                    ),
                  ],
                ),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 18, right: 18, top: 5, bottom: 5),
                  child: Container(
                    height: 35,
                    child: TextField(
                      onChanged: (value) => {
                        showSearchPage(context, _searchDelegate, this.widget.vm)
                      },
                      autofocus: false,
                      decoration: InputDecoration(
                        labelText: 'Search',
                        border: new OutlineInputBorder(
                            borderSide: new BorderSide(color: Colors.grey)),
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.deepOrangeAccent,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
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
