import 'package:flutter/material.dart';
import 'package:test_demo22/model/ProductCategory.dart';
import 'package:test_demo22/services/ServiceCalls.dart';

class ProductListVM extends ChangeNotifier {
  List<ProductCatVM> products;
  dynamic categoryVM;
  dynamic drinksVM;
  dynamic breadsVM;
  // ProductListVM();

  Future<void> fetchMenuItemsByName([String pattern]) async {
    final mainmenu = await ServiceCalls().getMenuItems();
    products = mainmenu
        .map((products) => ProductCatVM(productCategory: products))
        .toList();
    products.where((element) => element.name.startsWith(pattern));
    notifyListeners();
  }

  Future<void> fetchByExactName([String pattern]) async {
    final mainmenu = await ServiceCalls().getMenuItems();
    products = mainmenu
        .map((products) => ProductCatVM(productCategory: products))
        .toList();
    products.where((element) => element.name == pattern);
    notifyListeners();
  }

  Future<void> fetchMenuItems([String pattern]) async {
    final mainmenu = await ServiceCalls().getMenuItems();
    products = mainmenu
        .map((products) => ProductCatVM(productCategory: products))
        .toList();
    categoryVM = products.where((element) => element.type == 1).toList();
    drinksVM = products.where((element) => element.type == 3).toList();
    breadsVM = products.where((element) => element.type == 2).toList();
    notifyListeners();
  }
}

class ProductCatVM {
  final ProductCategory productCategory;
  ProductCatVM({this.productCategory});
  String get name {
    return this.productCategory.name;
  }

  int get id {
    return this.productCategory.id;
  }

  int get outletId {
    return this.productCategory.outletId;
  }

  int get type {
    return this.productCategory.type;
  }

  String get image {
    return this.productCategory.image;
  }

  bool get isactive {
    return this.productCategory.active;
  }
}
