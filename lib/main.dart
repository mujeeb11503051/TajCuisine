import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:provider/provider.dart';
import 'package:test_demo22/dummy_data.dart';
import 'package:test_demo22/model/cart.dart';
import 'package:test_demo22/model/drinks.dart';
import 'package:test_demo22/model/items.dart';

//my own imports
import 'package:test_demo22/pages/cart.dart';
import 'package:test_demo22/pages/login_page.dart';
import 'package:test_demo22/pages/menu_view_page.dart';
import 'package:test_demo22/pages/product_details.dart';
import 'package:test_demo22/pages/submenu_page.dart';
import 'package:test_demo22/services/SearchAPI.dart';
import 'package:test_demo22/view/cart_empty_screen.dart';
import 'package:test_demo22/view/category_screen.dart';
import 'package:test_demo22/view/items_screen.dart';
import 'package:test_demo22/viewmodel/ProductCatVM.dart';
import 'package:test_demo22/viewmodel/ProductVM.dart';
import 'package:test_demo22/viewmodel/UserVM.dart';
import 'package:test_demo22/widget/badge.dart';
import 'package:test_demo22/widget/item_card.dart';

import 'model/indian_breads.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: IndianBreads(),
        ),
        ChangeNotifierProvider.value(
          value: Cart(),
        ),
        ChangeNotifierProvider.value(
          value: Drinks(),
        ),
        ChangeNotifierProvider.value(value: ProductListVM()),
        ChangeNotifierProvider.value(value: SubmenuListVM()),
        ChangeNotifierProvider.value(value: UserVM()),
        //ChangeNotifierProvider.value(value: ProductListVM())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
//    home: HomePage(),
        routes: {
          '/': (ctx) => LoginPage(),
          ItemsScreen.routeName: (ctx) => ItemsScreen(),
          ProductDetails.routeName: (ctx) => ProductDetails(),
        },
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  final userVM;

  HomePage({this.userVM});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  SearchDelegateAPI _searchDelegate;
  dynamic _productvm;
  @override
  void initState() {
    super.initState();
    //Initializing search delegate with sorted list of English words
    _productvm = new ProductListVM();
    _productvm.fetchMenuItems().then((value) => {
          //print(_productvm[0]),
          _searchDelegate =
              SearchDelegateAPI(_productvm.products, this.widget.userVM)
        });
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
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
        children: <Widget>[
          Padding(
            padding:
                const EdgeInsets.only(left: 20, top: 10, right: 0, bottom: 10),
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
                  onPressed: () {},
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
          //search bar
          Container(
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 18, right: 18, top: 5, bottom: 5),
              child: Container(
                height: 35,
                child: TextField(
                  onChanged: (value) => {
                    showSearchPage(context, _searchDelegate, this.widget.userVM)
                  },
                  decoration: InputDecoration(
                      labelText: 'Search',
                      border: new OutlineInputBorder(
                          borderSide: new BorderSide(color: Colors.grey))),
                ),
              ),
            ),
          ),
          Container(
            height: 600,
            child: ChangeNotifierProvider(
              // builder: (_) => ProductListVM(),
              create: (context) {
                ProductListVM();
              },
              child: MenuViewPage(this.widget.userVM),
            ),
          ) // CategoriesScreen()
        ],
      ),
    );
  }
}

void showSearchPage(
    BuildContext context, SearchDelegateAPI searchDelegate, dynamic vm) async {
  final selected = await showSearch(
    context: context,
    delegate: searchDelegate,
  );

  if (selected != null) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => SubmenuPage(vm, menuID: selected)));
  }
  return null;
}
